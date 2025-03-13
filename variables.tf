variable "aws_region" {
  type        = string
  default     = "us-east-1" # Change to your desired region
  description = "AWS region"
}

variable "ami_id" {
  type        = string
  default     = "ami-07f9449c0b700566e" # Example: Ubuntu 22.04 in us-east-1.  FIND THE RIGHT AMI!
  description = "AMI ID for the Ubuntu instances"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro" # Free tier eligible. Use t3.small or similar for better performance.
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  default     = "prometheus-key-pair" # Replace with your key pair name
  description = "Name of the EC2 key pair"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR Block for the VPC"
}

variable "subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR Block for the Subnet"
}

variable "project_name" {
  type        = string
  default     = "prometheus-federation"
  description = "A name to use for resources to help with organization."
}

variable "private_key_path" {
  type        = string
  default     = "~/.ssh/prometheus-key-pair.pem" # Use the proper path
  description = "Path to the private key file used for SSH access."
}
