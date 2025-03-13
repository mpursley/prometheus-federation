#!/bin/bash

## Run this script from the root folder (cd ..)
pushd .. > /dev/null

# Default values
DELAY=0
MAX_RETRIES=3
RETRY_DELAY=10  # Delay between retries in seconds

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
      if ! [[ "$DELAY" =~ ^[0-9]+$ ]]; then
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

# --- Function to get Public IP with retries ---
get_public_ip() {
  local instance_name="$1"
  local retry_count=0
  local ip="None"

  while [[ "$ip" == "None" && "$retry_count" -lt "$MAX_RETRIES" ]]; do
    echo -e "INFO    : Getting Public IP address for $instance_name (attempt $((retry_count + 1)) of $MAX_RETRIES)..."
    ip=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$instance_name" --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

    if [[ "$ip" == "None" ]]; then
      retry_count=$((retry_count + 1))
      if [[ "$retry_count" -lt "$MAX_RETRIES" ]]; then
        echo "Public IP not available yet for $instance_name. Retrying in $RETRY_DELAY seconds..."
        sleep "$RETRY_DELAY"
      fi
    fi
  done

  echo -e "Public IP for $instance_name:\t $ip"
  echo

  if [[ "$ip" == "None" ]]; then
    echo "Error: Failed to get Public IP for $instance_name after $MAX_RETRIES attempts." >&2
    return 1 # Return an error code
  fi
  echo "Success getting IP for instance $instance_name"
  echo
  echo
  echo
  echo
  echo
  echo

  echo "$ip"  # Return the IP
}
# --- End of Function ---

# --- Get Public IPs with Retries ---
primary_ip_aws=$(get_public_ip "prometheus-federation-primary")
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to get Public IP for primary instance. Exiting." >&2
  exit 1
fi

secondary_ip_aws=$(get_public_ip "prometheus-federation-secondary")
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to get Public IP for secondary instance. Exiting." >&2
  exit 1
fi
# --- End of Get Public IPs with Retries ---

# --- Create the inventory ---
cat <<EOF > ansible/inventory.ini
[prometheus_servers]
prometheus-primary ansible_host=$primary_ip_aws
prometheus-secondary ansible_host=$secondary_ip_aws

[prometheus_servers:vars]
ansible_ssh_private_key_file=~/.ssh/prometheus-key-pair.pem
ansible_connection=ssh
ansible_user=ubuntu
EOF
# --- End of inventory creation ---

echo -e "Inventory file 'inventory.ini' generated."
echo
echo "WARNING: ssh'ing into the primary and secondary prometheus nodes. This should print their \"hostnames\"."
for ip in $primary_ip_aws $secondary_ip_aws; do
  ssh -i ~/.ssh/prometheus-key-pair.pem -L 9090:localhost:9090 ubuntu@"$ip" -o StrictHostKeyChecking=accept-new hostname
done

## A return to the original folder...
popd > /dev/null

echo
echo "INFO   : Ok, done. The 'inventory.ini' file should be updated. You can now run the ansible_playbook(s) in this folder.."
echo "       : e.g."
echo "       : $ ansible-playbook -i inventory.ini ansible_install_prometheus.yaml"
