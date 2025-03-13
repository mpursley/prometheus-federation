#!/bin/bash

## Run this script from the root folder (cd ..)
pushd .. > /dev/null


# Default values
DELAY=0

# Function to display help message
show_help() {
  echo "Usage: $0 [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  -h, --help           Show this help message"
  echo "  -d, --delay <seconds> Delay in seconds before generating inventory (default: $DELAY)"
  echo ""
  echo "Example:"
  echo "  $0 -d 60"
  echo "  $0 --delay 30"
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      show_help
      exit 0
      ;;
    -d|--delay)
      DELAY="$2"
      if ! [[ "$DELAY" =~ ^[0-9]+$ ]] ; then
        echo "Error: Delay must be a non-negative integer." >&2
        exit 1
      fi
      shift 2
      ;;
    *)
      echo "Error: Unknown option: $1" >&2
      show_help
      exit 1
      ;;
  esac
done

# Check if delay is needed
if (( DELAY > 0 )); then
  echo "Delaying for $DELAY seconds before generating inventory..."
  sleep "$DELAY"
fi

# e.g. primary_ip_aws=54.88.145.213
echo -e "INFO    : Getting Public IP address for ec2 instances (this normally takes a few seconds)..."
primary_ip_terraform=$(terraform output -raw primary_public_ip)
primary_ip_aws=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=prometheus-federation-primary" --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
echo -e "INFO   : Primary Public IP:\t terraform output:\t $primary_ip_terraform"
echo -e "INFO   : Primary Public IP:\t aws ec2 describe:\t $primary_ip_aws"
## Option to hardcode the IP, if needed...
#primary_ip_aws=23.21.168.132

#e.g. secondary_ip_aws=44.216.231.206
secondary_ip_terraform=$(terraform output -raw secondary_public_ip)
secondary_ip_aws=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=prometheus-federation-secondary" --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)
echo -e "INFO   : Secondary Public IP:\t terraform output:\t $secondary_ip_terraform"
echo -e "INFO   : Secondary Public IP:\t aws ec2 describe:\t $secondary_ip_aws"
## Option to hardcode the IP, if needed...
#secondary_ip_aws=3.226.8.39

## TODO: These public IP checks with `terraform output` and `aws ec2 describe` don't seem to be working as expected yet
echo -e ; echo
echo -e "WARNING : These Public IP checks from Terraform and AWS don't always seem to work correctly yet."
echo -e "        : Double check these Public IP are correct using the AWS Console..."
echo
echo -e "INFO   : Primary Public IP:\t aws ec2 describe:\t $primary_ip_aws"
echo -e "INFO   : Secondary Public IP:\t aws ec2 describe:\t $secondary_ip_aws"
echo
## /TODO: Fix this check (or do this in a better way) and remove this block

cat <<EOF > ansible/inventory.ini
[prometheus_servers]
prometheus-primary ansible_host=$primary_ip_aws
prometheus-secondary ansible_host=$secondary_ip_aws

[prometheus_servers:vars]
ansible_ssh_private_key_file=~/.ssh/prometheus-key-pair.pem
ansible_connection=ssh
ansible_user=ubuntu
EOF

echo -e "Inventory file 'inventory.ini' generated."
echo
echo "WARNING: ssh'ing into the primary and secondary prometheus nodes. This should print their "hostnames"."
for ip in $primary_ip_aws $secondary_ip_aws ; do
  ssh -i ~/.ssh/prometheus-key-pair.pem -L 9090:localhost:9090 ubuntu@"$ip" -o StrictHostKeyChecking=accept-new hostname
done

## A return to the original folder...
popd > /dev/null

echo
echo "INFO   : Ok, done. The 'inventory.ini' file should be updated. You can now run the ansible_playbook(s) in this folder.."
echo "       : e.g."
echo "       : $ ansible-playbook -i inventory.ini ansible_install_prometheus.yaml"
