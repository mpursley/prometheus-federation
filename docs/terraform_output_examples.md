# WARNING: Example output, for reference use only

Note: This is just an example output from a previous run, for reference.
So, this output (likely) won't not be "up-to-date" with the current code...

```
$ terraform init
Initializing the backend...
Initializing provider plugins...
- Reusing previous version of ansible/ansible from the dependency lock file
- Reusing previous version of hashicorp/aws from the dependency lock file
- Reusing previous version of hashicorp/null from the dependency lock file
- Using previously-installed ansible/ansible v1.3.0
- Using previously-installed hashicorp/aws v5.89.0
- Using previously-installed hashicorp/null v3.2.3

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.primary_eip will be created
  + resource "aws_eip" "primary_eip" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags_all             = (known after apply)
      + vpc                  = (known after apply)
    }

  # aws_eip.secondary_eip will be created
  + resource "aws_eip" "secondary_eip" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags_all             = (known after apply)
      + vpc                  = (known after apply)
    }

  # aws_iam_instance_profile.ec2_profile will be created
  + resource "aws_iam_instance_profile" "ec2_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "prometheus-federation-ec2-profile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = "prometheus-federation-ec2-role"
      + tags_all    = (known after apply)
      + unique_id   = (known after apply)
    }

  # aws_iam_role.ec2_role will be created
  + resource "aws_iam_role" "ec2_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "prometheus-federation-ec2-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_instance.prometheus-primary will be created
  + resource "aws_instance" "prometheus-primary" {
      + ami                                  = "ami-07f9449c0b700566e"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prometheus-federation-ec2-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "prometheus-key-pair"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "prometheus-federation-primary"
        }
      + tags_all                             = {
          + "Name" = "prometheus-federation-primary"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_instance.prometheus-secondary will be created
  + resource "aws_instance" "prometheus-secondary" {
      + ami                                  = "ami-07f9449c0b700566e"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prometheus-federation-ec2-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "prometheus-key-pair"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "prometheus-federation-secondary"
        }
      + tags_all                             = {
          + "Name" = "prometheus-federation-secondary"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_internet_gateway.gw will be created
  + resource "aws_internet_gateway" "gw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "prometheus-federation-igw"
        }
      + tags_all = {
          + "Name" = "prometheus-federation-igw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route_table.r will be created
  + resource "aws_route_table" "r" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "prometheus-federation-rtb"
        }
      + tags_all         = {
          + "Name" = "prometheus-federation-rtb"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.a will be created
  + resource "aws_route_table_association" "a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.prometheus_sg will be created
  + resource "aws_security_group" "prometheus_sg" {
      + arn                    = (known after apply)
      + description            = "Allow Prometheus traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow inbound Node Exporter"
              + from_port        = 9100
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9100
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow inbound Prometheus"
              + from_port        = 9090
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9090
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow inbound SSH"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = []
              + description      = "Allow inbound traffic from within the security group"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = true
              + to_port          = 0
            },
        ]
      + name                   = "prometheus-federation-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.main will be created
  + resource "aws_subnet" "main" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "prometheus-federation-subnet"
        }
      + tags_all                                       = {
          + "Name" = "prometheus-federation-subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "prometheus-federation-vpc"
        }
      + tags_all                             = {
          + "Name" = "prometheus-federation-vpc"
        }
    }

  # null_resource.run_ansible_playbook will be created
  + resource "null_resource" "run_ansible_playbook" {
      + id = (known after apply)
    }

Plan: 13 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + primary_eip          = (known after apply)
  + primary_private_ip   = (known after apply)
  + primary_public_ip    = (known after apply)
  + secondary_eip        = (known after apply)
  + secondary_private_ip = (known after apply)
  + secondary_public_ip  = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you 
run "terraform apply" now.
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the   
following symbols:
  + create

Terraform will perform the following actions:

  # aws_eip.primary_eip will be created
  + resource "aws_eip" "primary_eip" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags_all             = (known after apply)
      + vpc                  = (known after apply)
    }

  # aws_eip.secondary_eip will be created
  + resource "aws_eip" "secondary_eip" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags_all             = (known after apply)
      + vpc                  = (known after apply)
    }

  # aws_iam_instance_profile.ec2_profile will be created
  + resource "aws_iam_instance_profile" "ec2_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "prometheus-federation-ec2-profile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = "prometheus-federation-ec2-role"
      + tags_all    = (known after apply)
      + unique_id   = (known after apply)
    }

  # aws_iam_role.ec2_role will be created
  + resource "aws_iam_role" "ec2_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "prometheus-federation-ec2-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_instance.prometheus-primary will be created
  + resource "aws_instance" "prometheus-primary" {
      + ami                                  = "ami-07f9449c0b700566e"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prometheus-federation-ec2-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "prometheus-key-pair"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "prometheus-federation-primary"
        }
      + tags_all                             = {
          + "Name" = "prometheus-federation-primary"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_instance.prometheus-secondary will be created
  + resource "aws_instance" "prometheus-secondary" {
      + ami                                  = "ami-07f9449c0b700566e"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + enable_primary_ipv6                  = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prometheus-federation-ec2-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "prometheus-key-pair"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "prometheus-federation-secondary"
        }
      + tags_all                             = {
          + "Name" = "prometheus-federation-secondary"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_internet_gateway.gw will be created
  + resource "aws_internet_gateway" "gw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "prometheus-federation-igw"
        }
      + tags_all = {
          + "Name" = "prometheus-federation-igw"
        }
      + vpc_id   = (known after apply)
    }

  # aws_route_table.r will be created
  + resource "aws_route_table" "r" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags             = {
          + "Name" = "prometheus-federation-rtb"
        }
      + tags_all         = {
          + "Name" = "prometheus-federation-rtb"
        }
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.a will be created
  + resource "aws_route_table_association" "a" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_security_group.prometheus_sg will be created
  + resource "aws_security_group" "prometheus_sg" {
      + arn                    = (known after apply)
      + description            = "Allow Prometheus traffic"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow inbound Node Exporter"
              + from_port        = 9100
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9100
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow inbound Prometheus"
              + from_port        = 9090
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 9090
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = "Allow inbound SSH"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
          + {
              + cidr_blocks      = []
              + description      = "Allow inbound traffic from within the security group"
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = true
              + to_port          = 0
            },
        ]
      + name                   = "prometheus-federation-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_subnet.main will be created
  + resource "aws_subnet" "main" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "prometheus-federation-subnet"
        }
      + tags_all                                       = {
          + "Name" = "prometheus-federation-subnet"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "prometheus-federation-vpc"
        }
      + tags_all                             = {
          + "Name" = "prometheus-federation-vpc"
        }
    }

  # null_resource.run_ansible_playbook will be created
  + resource "null_resource" "run_ansible_playbook" {
      + id = (known after apply)
    }

Plan: 13 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + primary_eip          = (known after apply)
  + primary_private_ip   = (known after apply)
  + primary_public_ip    = (known after apply)
  + secondary_eip        = (known after apply)
  + secondary_private_ip = (known after apply)
  + secondary_public_ip  = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_role.ec2_role: Creating...
aws_vpc.main: Creating...
aws_iam_role.ec2_role: Creation complete after 2s [id=prometheus-federation-ec2-role]
aws_iam_instance_profile.ec2_profile: Creating...
aws_vpc.main: Creation complete after 3s [id=vpc-0f8b76d9f39e66056]
aws_internet_gateway.gw: Creating...
aws_subnet.main: Creating...
aws_security_group.prometheus_sg: Creating...
aws_internet_gateway.gw: Creation complete after 1s [id=igw-010e9dd01567b5a69]
aws_route_table.r: Creating...
aws_route_table.r: Creation complete after 1s [id=rtb-01f6e5c31640d33df]
aws_security_group.prometheus_sg: Creation complete after 3s [id=sg-0a543a3cedd9495d3]
aws_iam_instance_profile.ec2_profile: Creation complete after 6s [id=prometheus-federation-ec2-profile]
aws_subnet.main: Still creating... [10s elapsed]
aws_subnet.main: Creation complete after 11s [id=subnet-0f814cfb93d49f69e]
aws_route_table_association.a: Creating...
aws_instance.prometheus-secondary: Creating...
aws_instance.prometheus-primary: Creating...
aws_route_table_association.a: Creation complete after 1s [id=rtbassoc-0347da2ffb9acc93b]
aws_instance.prometheus-secondary: Still creating... [9s elapsed]
aws_instance.prometheus-primary: Still creating... [9s elapsed]
aws_instance.prometheus-secondary: Provisioning with 'remote-exec'...
aws_instance.prometheus-secondary (remote-exec): Connecting to remote host via SSH...
aws_instance.prometheus-secondary (remote-exec):   Host: 54.160.152.198
aws_instance.prometheus-secondary (remote-exec):   User: ubuntu
aws_instance.prometheus-secondary (remote-exec):   Password: false
aws_instance.prometheus-secondary (remote-exec):   Private key: true
aws_instance.prometheus-secondary (remote-exec):   Certificate: false
aws_instance.prometheus-secondary (remote-exec):   SSH Agent: false
aws_instance.prometheus-secondary (remote-exec):   Checking Host Key: false
aws_instance.prometheus-secondary (remote-exec):   Target Platform: unix
aws_instance.prometheus-primary: Provisioning with 'remote-exec'...
aws_instance.prometheus-primary (remote-exec): Connecting to remote host via SSH...
aws_instance.prometheus-primary (remote-exec):   Host: 3.88.110.116
aws_instance.prometheus-primary (remote-exec):   User: ubuntu
aws_instance.prometheus-primary (remote-exec):   Password: false
aws_instance.prometheus-primary (remote-exec):   Private key: true
aws_instance.prometheus-primary (remote-exec):   Certificate: false
aws_instance.prometheus-primary (remote-exec):   SSH Agent: false
aws_instance.prometheus-primary (remote-exec):   Checking Host Key: false
aws_instance.prometheus-primary (remote-exec):   Target Platform: unix
aws_instance.prometheus-primary (remote-exec): Connecting to remote host via SSH...
aws_instance.prometheus-primary (remote-exec):   Host: 3.88.110.116
aws_instance.prometheus-primary (remote-exec):   User: ubuntu
aws_instance.prometheus-primary (remote-exec):   Password: false
aws_instance.prometheus-primary (remote-exec):   Private key: true
aws_instance.prometheus-primary (remote-exec):   Certificate: false
aws_instance.prometheus-primary (remote-exec):   SSH Agent: false
aws_instance.prometheus-primary (remote-exec):   Checking Host Key: false
aws_instance.prometheus-primary (remote-exec):   Target Platform: unix
aws_instance.prometheus-primary (remote-exec): Connecting to remote host via SSH...
aws_instance.prometheus-primary (remote-exec):   Host: 3.88.110.116
aws_instance.prometheus-primary (remote-exec):   User: ubuntu
aws_instance.prometheus-primary (remote-exec):   Password: false
aws_instance.prometheus-primary (remote-exec):   Private key: true
aws_instance.prometheus-primary (remote-exec):   Certificate: false
aws_instance.prometheus-primary (remote-exec):   SSH Agent: false
aws_instance.prometheus-primary (remote-exec):   Checking Host Key: false
aws_instance.prometheus-primary (remote-exec):   Target Platform: unix
aws_instance.prometheus-secondary: Still creating... [19s elapsed]
aws_instance.prometheus-primary: Still creating... [19s elapsed]
aws_instance.prometheus-secondary (remote-exec): Connecting to remote host via SSH...
aws_instance.prometheus-secondary (remote-exec):   Host: 54.160.152.198
aws_instance.prometheus-secondary (remote-exec):   User: ubuntu
aws_instance.prometheus-secondary (remote-exec):   Password: false
aws_instance.prometheus-secondary (remote-exec):   Private key: true
aws_instance.prometheus-secondary (remote-exec):   Certificate: false
aws_instance.prometheus-secondary (remote-exec):   SSH Agent: false
aws_instance.prometheus-secondary (remote-exec):   Checking Host Key: false
aws_instance.prometheus-secondary (remote-exec):   Target Platform: unix
aws_instance.prometheus-secondary (remote-exec): Connected!
aws_instance.prometheus-primary (remote-exec): Connecting to remote host via SSH...
aws_instance.prometheus-primary (remote-exec):   Host: 3.88.110.116
aws_instance.prometheus-primary (remote-exec):   User: ubuntu
aws_instance.prometheus-primary (remote-exec):   Password: false
aws_instance.prometheus-primary (remote-exec):   Private key: true
aws_instance.prometheus-primary (remote-exec):   Certificate: false
aws_instance.prometheus-primary (remote-exec):   SSH Agent: false
aws_instance.prometheus-primary (remote-exec):   Checking Host Key: false
aws_instance.prometheus-primary (remote-exec):   Target Platform: unix
aws_instance.prometheus-primary (remote-exec): Connected!
aws_instance.prometheus-secondary (remote-exec): waiting for the instance to be ready
aws_instance.prometheus-secondary: Creation complete after 24s [id=i-092ac2980e41c4be4]
aws_eip.secondary_eip: Creating...
aws_instance.prometheus-primary (remote-exec): waiting for the instance to be ready
aws_instance.prometheus-primary: Creation complete after 25s [id=i-08680ce690afa4c8d]
aws_eip.primary_eip: Creating...
null_resource.run_ansible_playbook: Creating...
null_resource.run_ansible_playbook: Provisioning with 'local-exec'...
null_resource.run_ansible_playbook (local-exec): Executing: ["/bin/sh" "-c" "./ansible/ansible_generate_inventory.bash -d 60"]
null_resource.run_ansible_playbook (local-exec): Delaying for 60 seconds before generating inventory...
aws_eip.secondary_eip: Creation complete after 2s [id=eipalloc-055ff3f7b998e75d3]
aws_eip.primary_eip: Creation complete after 3s [id=eipalloc-0323de8faca8b7303]
null_resource.run_ansible_playbook: Still creating... [10s elapsed]
null_resource.run_ansible_playbook: Still creating... [19s elapsed]
null_resource.run_ansible_playbook: Still creating... [29s elapsed]
null_resource.run_ansible_playbook: Still creating... [39s elapsed]
null_resource.run_ansible_playbook: Still creating... [48s elapsed]
null_resource.run_ansible_playbook: Still creating... [58s elapsed]
null_resource.run_ansible_playbook (local-exec): INFO    : Getting Public IP address for ec2 instances (this normally takes a few seconds)...
null_resource.run_ansible_playbook (local-exec): INFO   : Primary Public IP:     terraform output:       ╷
null_resource.run_ansible_playbook (local-exec): │ Warning: No outputs found
null_resource.run_ansible_playbook (local-exec): │
null_resource.run_ansible_playbook (local-exec): │ The state file either has no outputs defined, or all the defined outputs
null_resource.run_ansible_playbook (local-exec): │ are empty. Please define an output in your configuration with the `output`
null_resource.run_ansible_playbook (local-exec): │ keyword and run `terraform refresh` for it to become available. If you are
null_resource.run_ansible_playbook (local-exec): │ using interpolation, please verify the interpolated value is not empty. You
null_resource.run_ansible_playbook (local-exec): │ can use the `terraform console` command to assist.
null_resource.run_ansible_playbook (local-exec): ╵
null_resource.run_ansible_playbook (local-exec): INFO   : Primary Public IP:     aws ec2 describe:       None
null_resource.run_ansible_playbook (local-exec): INFO   : Secondary Public IP:   terraform output:       ╷
null_resource.run_ansible_playbook (local-exec): │ Warning: No outputs found
null_resource.run_ansible_playbook (local-exec): │ 
null_resource.run_ansible_playbook (local-exec): │ The state file either has no outputs defined, or all the defined outputs
null_resource.run_ansible_playbook (local-exec): │ are empty. Please define an output in your configuration with the `output`
null_resource.run_ansible_playbook (local-exec): │ keyword and run `terraform refresh` for it to become available. If you are
null_resource.run_ansible_playbook (local-exec): │ using interpolation, please verify the interpolated value is not empty. You
null_resource.run_ansible_playbook (local-exec): │ can use the `terraform console` command to assist.
null_resource.run_ansible_playbook (local-exec): ╵
null_resource.run_ansible_playbook (local-exec): INFO   : Secondary Public IP:   aws ec2 describe:       None

null_resource.run_ansible_playbook (local-exec): INFO   : Primary Public IP:     aws ec2 describe:       None
null_resource.run_ansible_playbook (local-exec): INFO   : Secondary Public IP:   aws ec2 describe:       None

null_resource.run_ansible_playbook (local-exec): ./ansible/ansible_generate_inventory.bash: line 79: ansible/inventory.ini: No such file or directory
null_resource.run_ansible_playbook (local-exec): Inventory file 'inventory.ini' generated.

null_resource.run_ansible_playbook (local-exec): WARNING: ssh'ing into the primary and secondary prometheus nodes. This should print their hostnames.
null_resource.run_ansible_playbook: Still creating... [1m8s elapsed]
null_resource.run_ansible_playbook (local-exec): ssh: Could not resolve hostname none: Temporary failure in name resolution
null_resource.run_ansible_playbook: Still creating... [1m17s elapsed]
null_resource.run_ansible_playbook (local-exec): ssh: Could not resolve hostname none: Temporary failure in name resolution

null_resource.run_ansible_playbook (local-exec): INFO   : Ok, done. The 'inventory.ini' file should be updated. You can now run the ansible_playbook(s) in this folder..
null_resource.run_ansible_playbook (local-exec):        : e.g.
null_resource.run_ansible_playbook (local-exec):        : $ ansible-playbook -i inventory.ini ansible_install_prometheus.yaml
null_resource.run_ansible_playbook: Provisioning with 'local-exec'...
null_resource.run_ansible_playbook (local-exec): Executing: ["/bin/sh" "-c" "ansible-playbook -i ansible/inventory.ini ansible/ansible_install_prometheus.yaml"]

null_resource.run_ansible_playbook (local-exec): PLAY [prometheus_servers] ******************************************************        

null_resource.run_ansible_playbook (local-exec): TASK [Gathering Facts] *********************************************************        
null_resource.run_ansible_playbook: Still creating... [1m27s elapsed]
null_resource.run_ansible_playbook (local-exec): fatal: [prometheus-secondary]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host 44.206.30.58 port 22: Connection timed out", "unreachable": true}
null_resource.run_ansible_playbook (local-exec): fatal: [prometheus-primary]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host 52.45.58.20 port 22: Connection timed out", "unreachable": true}

null_resource.run_ansible_playbook (local-exec): PLAY RECAP *********************************************************************
null_resource.run_ansible_playbook (local-exec): prometheus-primary         : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0
null_resource.run_ansible_playbook (local-exec): prometheus-secondary       : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0

╷
│ Error: local-exec provisioner error
│
│   with null_resource.run_ansible_playbook,
│   on main.tf line 205, in resource "null_resource" "run_ansible_playbook":
│  205:   provisioner "local-exec" {
│
│ Error running command 'ansible-playbook -i ansible/inventory.ini ansible/ansible_install_prometheus.yaml': exit status 4. Output:      
│ PLAY [prometheus_servers] ******************************************************
│
│ TASK [Gathering Facts] *********************************************************
│ fatal: [prometheus-secondary]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host  
│ 44.206.30.58 port 22: Connection timed out", "unreachable": true}
│ fatal: [prometheus-primary]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: connect to host    
│ 52.45.58.20 port 22: Connection timed out", "unreachable": true}
│
│ PLAY RECAP *********************************************************************
│ prometheus-primary         : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0
│ prometheus-secondary       : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0
│
│
╵
$ cd ansible/
$ ./ansible_generate_inventory.bash
INFO    : Getting Public IP address for ec2 instances (this normally takes a few seconds)...
INFO   : Primary Public IP:      terraform output:       3.88.110.116
INFO   : Primary Public IP:      aws ec2 describe:       None
INFO   : Secondary Public IP:    terraform output:       54.160.152.198
INFO   : Secondary Public IP:    aws ec2 describe:       None


WARNING : These Public IP checks from Terraform and AWS don't always seem to work correctly yet.
        : Double check these Public IP are correct using the AWS Console...

INFO   : Primary Public IP:      aws ec2 describe:       None
INFO   : Secondary Public IP:    aws ec2 describe:       None

Inventory file 'inventory.ini' generated.

WARNING: ssh'ing into the primary and secondary prometheus nodes. This should print their hostnames.
ssh: Could not resolve hostname none: Temporary failure in name resolution
ssh: Could not resolve hostname none: Temporary failure in name resolution

INFO   : Ok, done. The 'inventory.ini' file should be updated. You can now run the ansible_playbook(s) in this folder..
       : e.g.
       : $ ansible-playbook -i inventory.ini ansible_install_prometheus.yaml
$ vim ./ansible_generate_inventory.bash
$ ./ansible_generate_inventory.bash
INFO    : Getting Public IP address for ec2 instances (this normally takes a few seconds)...
INFO   : Primary Public IP:      terraform output:       3.88.110.116
INFO   : Primary Public IP:      aws ec2 describe:       None
INFO   : Secondary Public IP:    terraform output:       54.160.152.198
INFO   : Secondary Public IP:    aws ec2 describe:       None


WARNING : These Public IP checks from Terraform and AWS don't always seem to work correctly yet.
        : Double check these Public IP are correct using the AWS Console...

INFO   : Primary Public IP:      aws ec2 describe:       23.21.168.132
INFO   : Secondary Public IP:    aws ec2 describe:       3.226.8.39

Inventory file 'inventory.ini' generated.

WARNING: ssh'ing into the primary and secondary prometheus nodes. This should print their hostnames.
Warning: Permanently added '23.21.168.132' (ED25519) to the list of known hosts.
ip-10-0-1-21
Warning: Permanently added '3.226.8.39' (ED25519) to the list of known hosts.
ip-10-0-1-138

INFO   : Ok, done. The 'inventory.ini' file should be updated. You can now run the ansible_playbook(s) in this folder..
       : e.g.
       : $ ansible-playbook -i inventory.ini ansible_install_prometheus.yaml

$ ./ansible_install_prometheus.sh 

PLAY [prometheus_servers] ***************************************************************************************************************

TASK [Gathering Facts] ******************************************************************************************************************
ok: [prometheus-primary]
ok: [prometheus-secondary]

TASK [Wait 60 seconds for EC2 instances to get public IPs] ******************************************************************************
Pausing for 60 seconds
(ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
[Wait 60 seconds for EC2 instances to get public IPs]
Pausing for 60 seconds to allow EC2 instances to get public IPs...:
ok: [prometheus-primary]

TASK [Update apt cache] *****************************************************************************************************************
changed: [prometheus-secondary]
changed: [prometheus-primary]

TASK [Install Prometheus dependencies (unzip)] ******************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Create Prometheus user] ***********************************************************************************************************
changed: [prometheus-secondary]
changed: [prometheus-primary]

TASK [Create Prometheus directories] ****************************************************************************************************
changed: [prometheus-primary] => (item=/etc/prometheus)
changed: [prometheus-secondary] => (item=/etc/prometheus)
changed: [prometheus-secondary] => (item=/var/lib/prometheus)
changed: [prometheus-primary] => (item=/var/lib/prometheus)

TASK [Download Prometheus] **************************************************************************************************************
changed: [prometheus-secondary]
changed: [prometheus-primary]

TASK [Extract Prometheus] ***************************************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Move Prometheus binaries] *********************************************************************************************************
changed: [prometheus-secondary] => (item=prometheus)
changed: [prometheus-primary] => (item=prometheus)
changed: [prometheus-primary] => (item=promtool)
changed: [prometheus-secondary] => (item=promtool)

TASK [Move Prometheus configuration files] **********************************************************************************************
changed: [prometheus-primary] => (item=consoles)
changed: [prometheus-secondary] => (item=consoles)
changed: [prometheus-secondary] => (item=console_libraries)
changed: [prometheus-primary] => (item=console_libraries)

TASK [Create prometheus.yml (Primary)] **************************************************************************************************
skipping: [prometheus-secondary]
changed: [prometheus-primary]

TASK [Create prometheus.yml (Secondary)] ************************************************************************************************
skipping: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Create federation scrape config (Primary)] ****************************************************************************************
skipping: [prometheus-secondary]
changed: [prometheus-primary]

TASK [Create Prometheus systemd service] ************************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Reload systemd] *******************************************************************************************************************
ok: [prometheus-secondary]
ok: [prometheus-primary]

TASK [Start and enable Prometheus service] **********************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Download Node Exporter] ***********************************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Extract Node Exporter] ************************************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Move Node Exporter binary] ********************************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Create Node Exporter systemd service] *********************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

TASK [Reload systemd (node_exporter)] ***************************************************************************************************
ok: [prometheus-secondary]
ok: [prometheus-primary]

TASK [Start Node Exporter] **************************************************************************************************************
changed: [prometheus-primary]
changed: [prometheus-secondary]

PLAY RECAP ******************************************************************************************************************************
prometheus-primary         : ok=21   changed=17   unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
prometheus-secondary       : ok=19   changed=16   unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

$ cat ./inventory.ini 
[prometheus_servers]
prometheus-primary ansible_host=23.21.168.132
prometheus-secondary ansible_host=3.226.8.39

[prometheus_servers:vars]
ansible_ssh_private_key_file=~/.ssh/prometheus-key-pair.pem
ansible_connection=ssh
ansible_user=ubuntu
$ ./ssh_prom_with_portforward_to_webui.sh -r 23.21.168.132
Executing SSH command:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.8.0-1023-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Mar  8 03:42:54 UTC 2025

  System load:  0.36              Processes:             108
  Usage of /:   32.5% of 7.57GB   Users logged in:       0
  Memory usage: 26%               IPv4 address for eth0: 10.0.1.21
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

14 updates can be applied immediately.
14 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Sat Mar  8 03:42:35 2025 from 173.170.167.126
ubuntu@ip-10-0-1-21:~$ ## goto http://localhost:9090/graph ... check on metrics from primary and secondary...
ubuntu@ip-10-0-1-21:~$
logout

$ cd ..
$ terraform apply
aws_vpc.main: Refreshing state... [id=vpc-0f8b76d9f39e66056]
aws_iam_role.ec2_role: Refreshing state... [id=prometheus-federation-ec2-role]
aws_iam_instance_profile.ec2_profile: Refreshing state... [id=prometheus-federation-ec2-profile]
aws_security_group.prometheus_sg: Refreshing state... [id=sg-0a543a3cedd9495d3]
aws_internet_gateway.gw: Refreshing state... [id=igw-010e9dd01567b5a69]
aws_subnet.main: Refreshing state... [id=subnet-0f814cfb93d49f69e]
aws_instance.prometheus-secondary: Refreshing state... [id=i-092ac2980e41c4be4]
aws_instance.prometheus-primary: Refreshing state... [id=i-08680ce690afa4c8d]
aws_route_table.r: Refreshing state... [id=rtb-01f6e5c31640d33df]
aws_route_table_association.a: Refreshing state... [id=rtbassoc-0347da2ffb9acc93b]
aws_eip.primary_eip: Refreshing state... [id=eipalloc-0323de8faca8b7303]
aws_eip.secondary_eip: Refreshing state... [id=eipalloc-055ff3f7b998e75d3]
null_resource.run_ansible_playbook: Refreshing state... [id=1251269016917598436]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply" which may have affected this plan:   

  # aws_instance.prometheus-primary has changed
  ~ resource "aws_instance" "prometheus-primary" {
        id                                   = "i-08680ce690afa4c8d"
      ~ public_ip                            = "3.88.110.116" -> "23.21.168.132"
        tags                                 = {
            "Name" = "prometheus-federation-primary"
        }
        # (38 unchanged attributes hidden)

        # (8 unchanged blocks hidden)
    }

  # aws_instance.prometheus-secondary has changed
  ~ resource "aws_instance" "prometheus-secondary" {
        id                                   = "i-092ac2980e41c4be4"
      ~ public_ip                            = "54.160.152.198" -> "3.226.8.39"
        tags                                 = {
            "Name" = "prometheus-federation-secondary"
        }
        # (38 unchanged attributes hidden)

        # (8 unchanged blocks hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following    
plan may include actions to undo or respond to these changes.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following        
symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # null_resource.run_ansible_playbook is tainted, so must be replaced
-/+ resource "null_resource" "run_ansible_playbook" {
      ~ id = "1251269016917598436" -> (known after apply)
    }

Plan: 1 to add, 0 to change, 1 to destroy.

Changes to Outputs:
  ~ primary_public_ip    = "3.88.110.116" -> "23.21.168.132"
  ~ secondary_public_ip  = "54.160.152.198" -> "3.226.8.39"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.run_ansible_playbook: Destroying... [id=1251269016917598436]
null_resource.run_ansible_playbook: Destruction complete after 0s
null_resource.run_ansible_playbook: Creating...
null_resource.run_ansible_playbook: Provisioning with 'local-exec'...
null_resource.run_ansible_playbook (local-exec): Executing: ["/bin/sh" "-c" "./ansible/ansible_generate_inventory.bash -d 60"]
null_resource.run_ansible_playbook (local-exec): Delaying for 60 seconds before generating inventory...
null_resource.run_ansible_playbook: Still creating... [9s elapsed]
null_resource.run_ansible_playbook: Still creating... [19s elapsed]
null_resource.run_ansible_playbook: Still creating... [29s elapsed]
null_resource.run_ansible_playbook: Still creating... [37s elapsed]
null_resource.run_ansible_playbook: Still creating... [47s elapsed]
null_resource.run_ansible_playbook: Still creating... [57s elapsed]
null_resource.run_ansible_playbook (local-exec): INFO    : Getting Public IP address for ec2 instances (this normally takes a few seconds)...
null_resource.run_ansible_playbook (local-exec): INFO   : Primary Public IP:     terraform output:       ╷
null_resource.run_ansible_playbook (local-exec): │ Warning: No outputs found
null_resource.run_ansible_playbook (local-exec): │ 
null_resource.run_ansible_playbook (local-exec): │ The state file either has no outputs defined, or all the defined outputs
null_resource.run_ansible_playbook (local-exec): │ are empty. Please define an output in your configuration with the `output`
null_resource.run_ansible_playbook (local-exec): │ keyword and run `terraform refresh` for it to become available. If you are
null_resource.run_ansible_playbook (local-exec): │ using interpolation, please verify the interpolated value is not empty. You
null_resource.run_ansible_playbook (local-exec): │ can use the `terraform console` command to assist.
null_resource.run_ansible_playbook (local-exec): ╵
null_resource.run_ansible_playbook (local-exec): INFO   : Primary Public IP:     aws ec2 describe:       None
null_resource.run_ansible_playbook (local-exec): INFO   : Secondary Public IP:   terraform output:       ╷
null_resource.run_ansible_playbook (local-exec): │ Warning: No outputs found
null_resource.run_ansible_playbook (local-exec): │
null_resource.run_ansible_playbook (local-exec): │ The state file either has no outputs defined, or all the defined outputs
null_resource.run_ansible_playbook (local-exec): │ are empty. Please define an output in your configuration with the `output`
null_resource.run_ansible_playbook (local-exec): │ keyword and run `terraform refresh` for it to become available. If you are
null_resource.run_ansible_playbook (local-exec): │ using interpolation, please verify the interpolated value is not empty. You
null_resource.run_ansible_playbook (local-exec): │ can use the `terraform console` command to assist.
null_resource.run_ansible_playbook (local-exec): ╵
null_resource.run_ansible_playbook (local-exec): INFO   : Secondary Public IP:   aws ec2 describe:       None


null_resource.run_ansible_playbook (local-exec): WARNING : These Public IP checks from Terraform and AWS don't always seem to work correctly yet.
null_resource.run_ansible_playbook (local-exec):         : Double check these Public IP are correct using the AWS Console...

null_resource.run_ansible_playbook (local-exec): INFO   : Primary Public IP:     aws ec2 describe:       23.21.168.132
null_resource.run_ansible_playbook (local-exec): INFO   : Secondary Public IP:   aws ec2 describe:       3.226.8.39

null_resource.run_ansible_playbook (local-exec): ./ansible/ansible_generate_inventory.bash: line 79: ansible/inventory.ini: No such file or directory
null_resource.run_ansible_playbook (local-exec): Inventory file 'inventory.ini' generated.

null_resource.run_ansible_playbook (local-exec): WARNING: ssh'ing into the primary and secondary prometheus nodes. This should print their hostnames.
null_resource.run_ansible_playbook (local-exec): ip-10-0-1-21
null_resource.run_ansible_playbook (local-exec): ip-10-0-1-138

null_resource.run_ansible_playbook (local-exec): INFO   : Ok, done. The 'inventory.ini' file should be updated. You can now run the ansible_playbook(s) in this folder..
null_resource.run_ansible_playbook (local-exec):        : e.g.
null_resource.run_ansible_playbook (local-exec):        : $ ansible-playbook -i inventory.ini ansible_install_prometheus.yaml
null_resource.run_ansible_playbook: Provisioning with 'local-exec'...
null_resource.run_ansible_playbook (local-exec): Executing: ["/bin/sh" "-c" "ansible-playbook -i ansible/inventory.ini ansible/ansible_install_prometheus.yaml"]

null_resource.run_ansible_playbook (local-exec): PLAY [prometheus_servers] ******************************************************        

null_resource.run_ansible_playbook (local-exec): TASK [Gathering Facts] *********************************************************        
null_resource.run_ansible_playbook: Still creating... [1m7s elapsed]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]

null_resource.run_ansible_playbook (local-exec): TASK [Wait 60 seconds for EC2 instances to get public IPs] *********************        
null_resource.run_ansible_playbook: Still creating... [1m16s elapsed]
null_resource.run_ansible_playbook: Still creating... [1m26s elapsed]
null_resource.run_ansible_playbook: Still creating... [1m36s elapsed]
null_resource.run_ansible_playbook: Still creating... [1m45s elapsed]
null_resource.run_ansible_playbook: Still creating... [1m55s elapsed]
null_resource.run_ansible_playbook: Still creating... [2m5s elapsed]
null_resource.run_ansible_playbook (local-exec): Pausing for 60 seconds
null_resource.run_ansible_playbook (local-exec): (ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Update apt cache] ********************************************************        
null_resource.run_ansible_playbook (local-exec): changed: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): changed: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Install Prometheus dependencies (unzip)] *********************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]

null_resource.run_ansible_playbook (local-exec): TASK [Create Prometheus user] **************************************************        
null_resource.run_ansible_playbook: Still creating... [2m14s elapsed]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]

null_resource.run_ansible_playbook (local-exec): TASK [Create Prometheus directories] *******************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary] => (item=/etc/prometheus)
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary] => (item=/etc/prometheus)
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary] => (item=/var/lib/prometheus)
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary] => (item=/var/lib/prometheus)

null_resource.run_ansible_playbook (local-exec): TASK [Download Prometheus] *****************************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Extract Prometheus] ******************************************************        
null_resource.run_ansible_playbook: Still creating... [2m24s elapsed]
null_resource.run_ansible_playbook: Still creating... [2m34s elapsed]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]

null_resource.run_ansible_playbook (local-exec): TASK [Move Prometheus binaries] ************************************************        
null_resource.run_ansible_playbook: Still creating... [2m44s elapsed]
null_resource.run_ansible_playbook: Still creating... [2m52s elapsed]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary] => (item=prometheus)
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary] => (item=promtool)
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary] => (item=prometheus)
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary] => (item=promtool)

null_resource.run_ansible_playbook (local-exec): TASK [Move Prometheus configuration files] *************************************        
null_resource.run_ansible_playbook (local-exec): changed: [prometheus-primary] => (item=consoles)
null_resource.run_ansible_playbook (local-exec): changed: [prometheus-secondary] => (item=consoles)
null_resource.run_ansible_playbook (local-exec): changed: [prometheus-secondary] => (item=console_libraries)
null_resource.run_ansible_playbook (local-exec): changed: [prometheus-primary] => (item=console_libraries)

null_resource.run_ansible_playbook (local-exec): TASK [Create prometheus.yml (Primary)] *****************************************        
null_resource.run_ansible_playbook (local-exec): skipping: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): changed: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Create prometheus.yml (Secondary)] ***************************************        
null_resource.run_ansible_playbook: Still creating... [3m2s elapsed]
null_resource.run_ansible_playbook (local-exec): skipping: [prometheus-primary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]

null_resource.run_ansible_playbook (local-exec): TASK [Create federation scrape config (Primary)] *******************************        
null_resource.run_ansible_playbook (local-exec): skipping: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): changed: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Create Prometheus systemd service] ***************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]

null_resource.run_ansible_playbook (local-exec): TASK [Reload systemd] **********************************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Start and enable Prometheus service] *************************************        
null_resource.run_ansible_playbook: Still creating... [3m12s elapsed]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Download Node Exporter] **************************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Extract Node Exporter] ***************************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]

null_resource.run_ansible_playbook (local-exec): TASK [Move Node Exporter binary] ***********************************************        
null_resource.run_ansible_playbook: Still creating... [3m21s elapsed]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]

null_resource.run_ansible_playbook (local-exec): TASK [Create Node Exporter systemd service] ************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Reload systemd (node_exporter)] ******************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): TASK [Start Node Exporter] *****************************************************        
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-secondary]
null_resource.run_ansible_playbook (local-exec): ok: [prometheus-primary]

null_resource.run_ansible_playbook (local-exec): PLAY RECAP *********************************************************************        
null_resource.run_ansible_playbook (local-exec): prometheus-primary         : ok=21   changed=4    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
null_resource.run_ansible_playbook (local-exec): prometheus-secondary       : ok=19   changed=2    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

null_resource.run_ansible_playbook: Creation complete after 3m28s [id=8662306554920368334]

Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Outputs:

primary_eip = "23.21.168.132"
primary_private_ip = "10.0.1.21"
primary_public_ip = "23.21.168.132"
secondary_eip = "3.226.8.39"
secondary_private_ip = "10.0.1.138"
secondary_public_ip = "3.226.8.39"
$ terraform apply
aws_iam_role.ec2_role: Refreshing state... [id=prometheus-federation-ec2-role]
aws_vpc.main: Refreshing state... [id=vpc-0f8b76d9f39e66056]
aws_iam_instance_profile.ec2_profile: Refreshing state... [id=prometheus-federation-ec2-profile]
aws_security_group.prometheus_sg: Refreshing state... [id=sg-0a543a3cedd9495d3]
aws_internet_gateway.gw: Refreshing state... [id=igw-010e9dd01567b5a69]
aws_subnet.main: Refreshing state... [id=subnet-0f814cfb93d49f69e]
aws_instance.prometheus-primary: Refreshing state... [id=i-08680ce690afa4c8d]
aws_instance.prometheus-secondary: Refreshing state... [id=i-092ac2980e41c4be4]
aws_route_table.r: Refreshing state... [id=rtb-01f6e5c31640d33df]
aws_route_table_association.a: Refreshing state... [id=rtbassoc-0347da2ffb9acc93b]
aws_eip.secondary_eip: Refreshing state... [id=eipalloc-055ff3f7b998e75d3]
aws_eip.primary_eip: Refreshing state... [id=eipalloc-0323de8faca8b7303]
null_resource.run_ansible_playbook: Refreshing state... [id=8662306554920368334]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

primary_eip = "23.21.168.132"
primary_private_ip = "10.0.1.21"
primary_public_ip = "23.21.168.132"
secondary_eip = "3.226.8.39"
secondary_private_ip = "10.0.1.138"
secondary_public_ip = "3.226.8.39"
$ cat ansible/inventory.ini 
[prometheus_servers]
prometheus-primary ansible_host=23.21.168.132
prometheus-secondary ansible_host=3.226.8.39

[prometheus_servers:vars]
ansible_ssh_private_key_file=~/.ssh/prometheus-key-pair.pem
ansible_connection=ssh
ansible_user=ubuntu
$ ansible/ssh_prom_with_portforward_to_webui.sh -r 23.21.168.132
Executing SSH command:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.8.0-1023-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Mar  8 03:53:58 UTC 2025

  System load:  0.0               Processes:             106
  Usage of /:   32.5% of 7.57GB   Users logged in:       0
  Memory usage: 26%               IPv4 address for eth0: 10.0.1.21
  Swap usage:   0%

 * Ubuntu Pro delivers the most comprehensive open source security and
   compliance features.

   https://ubuntu.com/aws/pro

Expanded Security Maintenance for Applications is not enabled.

14 updates can be applied immediately.
14 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.2 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Sat Mar  8 03:52:28 2025 from 173.170.167.126
ubuntu@ip-10-0-1-21:~$ 
ubuntu@ip-10-0-1-21:~$ exit
logout

$ terraform destroy
aws_vpc.main: Refreshing state... [id=vpc-0f8b76d9f39e66056]
aws_iam_role.ec2_role: Refreshing state... [id=prometheus-federation-ec2-role]
aws_iam_instance_profile.ec2_profile: Refreshing state... [id=prometheus-federation-ec2-profile]
aws_internet_gateway.gw: Refreshing state... [id=igw-010e9dd01567b5a69]
aws_subnet.main: Refreshing state... [id=subnet-0f814cfb93d49f69e]
aws_security_group.prometheus_sg: Refreshing state... [id=sg-0a543a3cedd9495d3]
aws_instance.prometheus-secondary: Refreshing state... [id=i-092ac2980e41c4be4]
aws_instance.prometheus-primary: Refreshing state... [id=i-08680ce690afa4c8d]
aws_route_table.r: Refreshing state... [id=rtb-01f6e5c31640d33df]
aws_route_table_association.a: Refreshing state... [id=rtbassoc-0347da2ffb9acc93b]
aws_eip.primary_eip: Refreshing state... [id=eipalloc-0323de8faca8b7303]
aws_eip.secondary_eip: Refreshing state... [id=eipalloc-055ff3f7b998e75d3]
null_resource.run_ansible_playbook: Refreshing state... [id=8662306554920368334]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following        
symbols:
  - destroy

Terraform will perform the following actions:

  # aws_eip.primary_eip will be destroyed
  - resource "aws_eip" "primary_eip" {
      - allocation_id            = "eipalloc-0323de8faca8b7303" -> null
      - arn                      = "arn:aws:ec2:us-east-1:825765416683:elastic-ip/eipalloc-0323de8faca8b7303" -> null
      - association_id           = "eipassoc-096b49047497e4813" -> null
      - domain                   = "vpc" -> null
      - id                       = "eipalloc-0323de8faca8b7303" -> null
      - instance                 = "i-08680ce690afa4c8d" -> null
      - network_border_group     = "us-east-1" -> null
      - network_interface        = "eni-0f6c8b98ba3a70d71" -> null
      - private_dns              = "ip-10-0-1-21.ec2.internal" -> null
      - private_ip               = "10.0.1.21" -> null
      - public_dns               = "ec2-23-21-168-132.compute-1.amazonaws.com" -> null
      - public_ip                = "23.21.168.132" -> null
      - public_ipv4_pool         = "amazon" -> null
      - tags                     = {} -> null
      - tags_all                 = {} -> null
      - vpc                      = true -> null
        # (4 unchanged attributes hidden)
    }

  # aws_eip.secondary_eip will be destroyed
  - resource "aws_eip" "secondary_eip" {
      - allocation_id            = "eipalloc-055ff3f7b998e75d3" -> null
      - arn                      = "arn:aws:ec2:us-east-1:825765416683:elastic-ip/eipalloc-055ff3f7b998e75d3" -> null
      - association_id           = "eipassoc-0a01617ce0a13f06f" -> null
      - domain                   = "vpc" -> null
      - id                       = "eipalloc-055ff3f7b998e75d3" -> null
      - instance                 = "i-092ac2980e41c4be4" -> null
      - network_border_group     = "us-east-1" -> null
      - network_interface        = "eni-07c14ca7ea7db05a1" -> null
      - private_dns              = "ip-10-0-1-138.ec2.internal" -> null
      - private_ip               = "10.0.1.138" -> null
      - public_dns               = "ec2-3-226-8-39.compute-1.amazonaws.com" -> null
      - public_ip                = "3.226.8.39" -> null
      - public_ipv4_pool         = "amazon" -> null
      - tags                     = {} -> null
      - tags_all                 = {} -> null
      - vpc                      = true -> null
        # (4 unchanged attributes hidden)
    }

  # aws_iam_instance_profile.ec2_profile will be destroyed
  - resource "aws_iam_instance_profile" "ec2_profile" {
      - arn         = "arn:aws:iam::825765416683:instance-profile/prometheus-federation-ec2-profile" -> null
      - create_date = "2025-03-08T03:33:45Z" -> null
      - id          = "prometheus-federation-ec2-profile" -> null
      - name        = "prometheus-federation-ec2-profile" -> null
      - path        = "/" -> null
      - role        = "prometheus-federation-ec2-role" -> null
      - tags        = {} -> null
      - tags_all    = {} -> null
      - unique_id   = "AIPA4AQ3UJ3VS2ZWWIV7G" -> null
        # (1 unchanged attribute hidden)
    }

  # aws_iam_role.ec2_role will be destroyed
  - resource "aws_iam_role" "ec2_role" {
      - arn                   = "arn:aws:iam::825765416683:role/prometheus-federation-ec2-role" -> null
      - assume_role_policy    = jsonencode(
            {
              - Statement = [
                  - {
                      - Action    = "sts:AssumeRole"
                      - Effect    = "Allow"
                      - Principal = {
                          - Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              - Version   = "2012-10-17"
            }
        ) -> null
      - create_date           = "2025-03-08T03:33:44Z" -> null
      - force_detach_policies = false -> null
      - id                    = "prometheus-federation-ec2-role" -> null
      - managed_policy_arns   = [] -> null
      - max_session_duration  = 3600 -> null
      - name                  = "prometheus-federation-ec2-role" -> null
      - path                  = "/" -> null
      - tags                  = {} -> null
      - tags_all              = {} -> null
      - unique_id             = "AROA4AQ3UJ3V7ABE5SYR4" -> null
        # (3 unchanged attributes hidden)
    }

  # aws_instance.prometheus-primary will be destroyed
  - resource "aws_instance" "prometheus-primary" {
      - ami                                  = "ami-07f9449c0b700566e" -> null
      - arn                                  = "arn:aws:ec2:us-east-1:825765416683:instance/i-08680ce690afa4c8d" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - iam_instance_profile                 = "prometheus-federation-ec2-profile" -> null
      - id                                   = "i-08680ce690afa4c8d" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t2.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "prometheus-key-pair" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-0f6c8b98ba3a70d71" -> null
      - private_dns                          = "ip-10-0-1-21.ec2.internal" -> null
      - private_ip                           = "10.0.1.21" -> null
      - public_ip                            = "23.21.168.132" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0f814cfb93d49f69e" -> null
      - tags                                 = {
          - "Name" = "prometheus-federation-primary"
        } -> null
      - tags_all                             = {
          - "Name" = "prometheus-federation-primary"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0a543a3cedd9495d3",
        ] -> null
        # (7 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
            # (1 unchanged attribute hidden)
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 0 -> null
          - volume_id             = "vol-04bb503edc2effdf6" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
            # (1 unchanged attribute hidden)
        }
    }

  # aws_instance.prometheus-secondary will be destroyed
  - resource "aws_instance" "prometheus-secondary" {
      - ami                                  = "ami-07f9449c0b700566e" -> null
      - arn                                  = "arn:aws:ec2:us-east-1:825765416683:instance/i-092ac2980e41c4be4" -> null
      - associate_public_ip_address          = true -> null
      - availability_zone                    = "us-east-1a" -> null
      - cpu_core_count                       = 1 -> null
      - cpu_threads_per_core                 = 1 -> null
      - disable_api_stop                     = false -> null
      - disable_api_termination              = false -> null
      - ebs_optimized                        = false -> null
      - get_password_data                    = false -> null
      - hibernation                          = false -> null
      - iam_instance_profile                 = "prometheus-federation-ec2-profile" -> null
      - id                                   = "i-092ac2980e41c4be4" -> null
      - instance_initiated_shutdown_behavior = "stop" -> null
      - instance_state                       = "running" -> null
      - instance_type                        = "t2.micro" -> null
      - ipv6_address_count                   = 0 -> null
      - ipv6_addresses                       = [] -> null
      - key_name                             = "prometheus-key-pair" -> null
      - monitoring                           = false -> null
      - placement_partition_number           = 0 -> null
      - primary_network_interface_id         = "eni-07c14ca7ea7db05a1" -> null
      - private_dns                          = "ip-10-0-1-138.ec2.internal" -> null
      - private_ip                           = "10.0.1.138" -> null
      - public_ip                            = "3.226.8.39" -> null
      - secondary_private_ips                = [] -> null
      - security_groups                      = [] -> null
      - source_dest_check                    = true -> null
      - subnet_id                            = "subnet-0f814cfb93d49f69e" -> null
      - tags                                 = {
          - "Name" = "prometheus-federation-secondary"
        } -> null
      - tags_all                             = {
          - "Name" = "prometheus-federation-secondary"
        } -> null
      - tenancy                              = "default" -> null
      - user_data_replace_on_change          = false -> null
      - vpc_security_group_ids               = [
          - "sg-0a543a3cedd9495d3",
        ] -> null
        # (7 unchanged attributes hidden)

      - capacity_reservation_specification {
          - capacity_reservation_preference = "open" -> null
        }

      - cpu_options {
          - core_count       = 1 -> null
          - threads_per_core = 1 -> null
            # (1 unchanged attribute hidden)
        }

      - credit_specification {
          - cpu_credits = "standard" -> null
        }

      - enclave_options {
          - enabled = false -> null
        }

      - maintenance_options {
          - auto_recovery = "default" -> null
        }

      - metadata_options {
          - http_endpoint               = "enabled" -> null
          - http_protocol_ipv6          = "disabled" -> null
          - http_put_response_hop_limit = 1 -> null
          - http_tokens                 = "optional" -> null
          - instance_metadata_tags      = "disabled" -> null
        }

      - private_dns_name_options {
          - enable_resource_name_dns_a_record    = false -> null
          - enable_resource_name_dns_aaaa_record = false -> null
          - hostname_type                        = "ip-name" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - device_name           = "/dev/sda1" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - tags                  = {} -> null
          - tags_all              = {} -> null
          - throughput            = 0 -> null
          - volume_id             = "vol-0071dd8c558f03fa7" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
            # (1 unchanged attribute hidden)
        }
    }

  # aws_internet_gateway.gw will be destroyed
  - resource "aws_internet_gateway" "gw" {
      - arn      = "arn:aws:ec2:us-east-1:825765416683:internet-gateway/igw-010e9dd01567b5a69" -> null
      - id       = "igw-010e9dd01567b5a69" -> null
      - owner_id = "825765416683" -> null
      - tags     = {
          - "Name" = "prometheus-federation-igw"
        } -> null
      - tags_all = {
          - "Name" = "prometheus-federation-igw"
        } -> null
      - vpc_id   = "vpc-0f8b76d9f39e66056" -> null
    }

  # aws_route_table.r will be destroyed
  - resource "aws_route_table" "r" {
      - arn              = "arn:aws:ec2:us-east-1:825765416683:route-table/rtb-01f6e5c31640d33df" -> null
      - id               = "rtb-01f6e5c31640d33df" -> null
      - owner_id         = "825765416683" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-010e9dd01567b5a69"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {
          - "Name" = "prometheus-federation-rtb"
        } -> null
      - tags_all         = {
          - "Name" = "prometheus-federation-rtb"
        } -> null
      - vpc_id           = "vpc-0f8b76d9f39e66056" -> null
    }

  # aws_route_table_association.a will be destroyed
  - resource "aws_route_table_association" "a" {
      - id             = "rtbassoc-0347da2ffb9acc93b" -> null
      - route_table_id = "rtb-01f6e5c31640d33df" -> null
      - subnet_id      = "subnet-0f814cfb93d49f69e" -> null
        # (1 unchanged attribute hidden)
    }

  # aws_security_group.prometheus_sg will be destroyed
  - resource "aws_security_group" "prometheus_sg" {
      - arn                    = "arn:aws:ec2:us-east-1:825765416683:security-group/sg-0a543a3cedd9495d3" -> null
      - description            = "Allow Prometheus traffic" -> null
      - egress                 = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = false
              - to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ] -> null
      - id                     = "sg-0a543a3cedd9495d3" -> null
      - ingress                = [
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow inbound Node Exporter"
              - from_port        = 9100
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 9100
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow inbound Prometheus"
              - from_port        = 9090
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 9090
            },
          - {
              - cidr_blocks      = [
                  - "0.0.0.0/0",
                ]
              - description      = "Allow inbound SSH"
              - from_port        = 22
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "tcp"
              - security_groups  = []
              - self             = false
              - to_port          = 22
            },
          - {
              - cidr_blocks      = []
              - description      = "Allow inbound traffic from within the security group"
              - from_port        = 0
              - ipv6_cidr_blocks = []
              - prefix_list_ids  = []
              - protocol         = "-1"
              - security_groups  = []
              - self             = true
              - to_port          = 0
            },
        ] -> null
      - name                   = "prometheus-federation-sg" -> null
      - owner_id               = "825765416683" -> null
      - revoke_rules_on_delete = false -> null
      - tags                   = {} -> null
      - tags_all               = {} -> null
      - vpc_id                 = "vpc-0f8b76d9f39e66056" -> null
        # (1 unchanged attribute hidden)
    }

  # aws_subnet.main will be destroyed
  - resource "aws_subnet" "main" {
      - arn                                            = "arn:aws:ec2:us-east-1:825765416683:subnet/subnet-0f814cfb93d49f69e" -> null    
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1a" -> null
      - availability_zone_id                           = "use1-az4" -> null
      - cidr_block                                     = "10.0.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0f814cfb93d49f69e" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = true -> null
      - owner_id                                       = "825765416683" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Name" = "prometheus-federation-subnet"
        } -> null
      - tags_all                                       = {
          - "Name" = "prometheus-federation-subnet"
        } -> null
      - vpc_id                                         = "vpc-0f8b76d9f39e66056" -> null
        # (4 unchanged attributes hidden)
    }

  # aws_vpc.main will be destroyed
  - resource "aws_vpc" "main" {
      - arn                                  = "arn:aws:ec2:us-east-1:825765416683:vpc/vpc-0f8b76d9f39e66056" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-0e0f5718d0db1b99c" -> null
      - default_route_table_id               = "rtb-09b2a48c6246d0004" -> null
      - default_security_group_id            = "sg-07d39aa57a497a931" -> null
      - dhcp_options_id                      = "dopt-087ddaba36a143fb1" -> null
      - enable_dns_hostnames                 = false -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-0f8b76d9f39e66056" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-09b2a48c6246d0004" -> null
      - owner_id                             = "825765416683" -> null
      - tags                                 = {
          - "Name" = "prometheus-federation-vpc"
        } -> null
      - tags_all                             = {
          - "Name" = "prometheus-federation-vpc"
        } -> null
        # (4 unchanged attributes hidden)
    }

  # null_resource.run_ansible_playbook will be destroyed
  - resource "null_resource" "run_ansible_playbook" {
      - id = "8662306554920368334" -> null
    }

Plan: 0 to add, 0 to change, 13 to destroy.

Changes to Outputs:
  - primary_eip          = "23.21.168.132" -> null
  - primary_private_ip   = "10.0.1.21" -> null
  - primary_public_ip    = "23.21.168.132" -> null
  - secondary_eip        = "3.226.8.39" -> null
  - secondary_private_ip = "10.0.1.138" -> null
  - secondary_public_ip  = "3.226.8.39" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.run_ansible_playbook: Destroying... [id=8662306554920368334]
null_resource.run_ansible_playbook: Destruction complete after 0s
aws_route_table_association.a: Destroying... [id=rtbassoc-0347da2ffb9acc93b]
aws_eip.secondary_eip: Destroying... [id=eipalloc-055ff3f7b998e75d3]
aws_eip.primary_eip: Destroying... [id=eipalloc-0323de8faca8b7303]
aws_route_table_association.a: Destruction complete after 1s
aws_route_table.r: Destroying... [id=rtb-01f6e5c31640d33df]
aws_route_table.r: Destruction complete after 1s
aws_internet_gateway.gw: Destroying... [id=igw-010e9dd01567b5a69]
aws_eip.primary_eip: Destruction complete after 3s
aws_eip.secondary_eip: Destruction complete after 3s
aws_instance.prometheus-primary: Destroying... [id=i-08680ce690afa4c8d]
aws_instance.prometheus-secondary: Destroying... [id=i-092ac2980e41c4be4]
aws_internet_gateway.gw: Still destroying... [id=igw-010e9dd01567b5a69, 9s elapsed]
aws_instance.prometheus-secondary: Still destroying... [id=i-092ac2980e41c4be4, 9s elapsed]
aws_instance.prometheus-primary: Still destroying... [id=i-08680ce690afa4c8d, 9s elapsed]
aws_internet_gateway.gw: Still destroying... [id=igw-010e9dd01567b5a69, 19s elapsed]
aws_instance.prometheus-primary: Still destroying... [id=i-08680ce690afa4c8d, 19s elapsed]
aws_instance.prometheus-secondary: Still destroying... [id=i-092ac2980e41c4be4, 19s elapsed]
aws_internet_gateway.gw: Still destroying... [id=igw-010e9dd01567b5a69, 29s elapsed]
aws_instance.prometheus-secondary: Still destroying... [id=i-092ac2980e41c4be4, 29s elapsed]
aws_instance.prometheus-primary: Still destroying... [id=i-08680ce690afa4c8d, 29s elapsed]
aws_internet_gateway.gw: Still destroying... [id=igw-010e9dd01567b5a69, 39s elapsed]
aws_instance.prometheus-primary: Still destroying... [id=i-08680ce690afa4c8d, 39s elapsed]
aws_instance.prometheus-secondary: Still destroying... [id=i-092ac2980e41c4be4, 39s elapsed]
aws_internet_gateway.gw: Still destroying... [id=igw-010e9dd01567b5a69, 47s elapsed]
aws_instance.prometheus-primary: Still destroying... [id=i-08680ce690afa4c8d, 47s elapsed]
aws_instance.prometheus-secondary: Still destroying... [id=i-092ac2980e41c4be4, 47s elapsed]
aws_instance.prometheus-primary: Destruction complete after 49s
aws_internet_gateway.gw: Still destroying... [id=igw-010e9dd01567b5a69, 58s elapsed]
aws_instance.prometheus-secondary: Still destroying... [id=i-092ac2980e41c4be4, 57s elapsed]
aws_internet_gateway.gw: Still destroying... [id=igw-010e9dd01567b5a69, 1m8s elapsed]
aws_instance.prometheus-secondary: Still destroying... [id=i-092ac2980e41c4be4, 1m7s elapsed]
aws_internet_gateway.gw: Destruction complete after 1m15s
aws_instance.prometheus-secondary: Still destroying... [id=i-092ac2980e41c4be4, 1m16s elapsed]
aws_instance.prometheus-secondary: Destruction complete after 1m18s
aws_iam_instance_profile.ec2_profile: Destroying... [id=prometheus-federation-ec2-profile]
aws_subnet.main: Destroying... [id=subnet-0f814cfb93d49f69e]
aws_security_group.prometheus_sg: Destroying... [id=sg-0a543a3cedd9495d3]
aws_iam_instance_profile.ec2_profile: Destruction complete after 1s
aws_iam_role.ec2_role: Destroying... [id=prometheus-federation-ec2-role]
aws_subnet.main: Destruction complete after 1s
aws_iam_role.ec2_role: Destruction complete after 0s
aws_security_group.prometheus_sg: Destruction complete after 1s
aws_vpc.main: Destroying... [id=vpc-0f8b76d9f39e66056]
aws_vpc.main: Destruction complete after 1s

Destroy complete! Resources: 13 destroyed.
$ aws ec2 describe-instances --filters "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name'].Value]" --output table
$
```
