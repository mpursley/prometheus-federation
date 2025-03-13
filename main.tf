terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    ansible = {
      source  = "ansible/ansible"
      version = "~> 1.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Ansible Provider
provider "ansible" {
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Create a Subnet
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true # Ensure instances get public IPs

  tags = {
    Name = "${var.project_name}-subnet"
  }
}

# Internet Gateway for the VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Route Table
resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.project_name}-rtb"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.r.id
}

# --- Security Group ---
resource "aws_security_group" "prometheus_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow Prometheus traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 9090 # Prometheus default port
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # TODO: Restrict this in production !!!
    description = "Allow inbound Prometheus"
  }

  ingress {
    from_port   = 9100 # Node Exporter port
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # TODO: Restrict this in production !!!
    description = "Allow inbound Node Exporter"
  }

  ingress {
    from_port   = 22 # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # TODO: Restrict this to your IP in production !!!
    description = "Allow inbound SSH"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    description = "Allow inbound traffic from within the security group"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- IAM Role ---
resource "aws_iam_role" "ec2_role" {
  name = "${var.project_name}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

# --- EC2 Instances ---
resource "aws_instance" "prometheus-primary" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.prometheus_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  subnet_id              = aws_subnet.main.id

  tags = {
    Name = "${var.project_name}-primary"
  }

  # Wait until the instance is ready before applying ansible setup
  provisioner "remote-exec" {
    inline = ["echo waiting for the instance to be ready"]
    connection {
      type        = "ssh"
      user        = "ubuntu" # change to the ec2 image username
      private_key = file(var.private_key_path) # file containing the private key
      host        = self.public_ip
    }
  }
}

resource "aws_instance" "prometheus-secondary" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.prometheus_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  subnet_id              = aws_subnet.main.id

  tags = {
    Name = "${var.project_name}-secondary"
  }
  # Wait until the instance is ready before applying ansible setup
  provisioner "remote-exec" {
    inline = ["echo waiting for the instance to be ready"]
    connection {
      type        = "ssh"
      user        = "ubuntu" # change to the ec2 image username
      private_key = file(var.private_key_path) # file containing the private key
      host        = self.public_ip
    }
  }
}

resource "aws_eip" "primary_eip" {
  instance = aws_instance.prometheus-primary.id
  domain   = "vpc"
}

resource "aws_eip" "secondary_eip" {
  instance = aws_instance.prometheus-secondary.id
  domain   = "vpc"
}

resource "null_resource" "run_ansible_playbook" {
  depends_on = [
    aws_instance.prometheus-primary,
    aws_instance.prometheus-secondary
  ]
  provisioner "local-exec" {
    command = "./ansible/ansible_generate_inventory.bash -d 60"
    on_failure = fail
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ansible/inventory.ini ansible/ansible_install_prometheus.yaml"
    on_failure = fail
  }
}
