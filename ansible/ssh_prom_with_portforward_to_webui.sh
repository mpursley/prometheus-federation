#!/bin/bash

# Default values
REMOTE_HOST=""
REMOTE_USER="ubuntu"
LOCAL_PORT="9090"
REMOTE_PORT="9090"
PRIVATE_KEY_PATH="$HOME/.ssh/prometheus-key-pair.pem"
DELAY=0 # Default to no delay

# Function to display help message
show_help() {
  echo "Usage: $0 [OPTIONS]"
  echo ""
  echo "Options:"
  echo "  -h, --help           Show this help message"
  echo "  -r, --remote-host    Remote host to connect to (default: $REMOTE_HOST)"
  echo "  -u, --remote-user    Remote user for SSH (default: $REMOTE_USER)"
  echo "  -l, --local-port     Local port for forwarding (default: $LOCAL_PORT)"
  echo "  -R, --remote-port    Remote port for forwarding (default: $REMOTE_PORT)"
  echo "  -k, --key-path       Path to the private key (default: $PRIVATE_KEY_PATH)"
  echo "  -d, --delay <seconds> Delay in seconds before establishing the connection (default: $DELAY)"
  echo ""
  echo "Example:"
  echo "  $0 -r prometheus-secondary -u ec2-user -l 9091 -d 60"
  echo "  $0 --remote-host prometheus-primary --key-path ./my_key.pem --delay 30"
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      show_help
      exit 0
      ;;
    -r|--remote-host)
      REMOTE_HOST="$2"
      shift 2
      ;;
    -u|--remote-user)
      REMOTE_USER="$2"
      shift 2
      ;;
    -l|--local-port)
      LOCAL_PORT="$2"
      shift 2
      ;;
    -R|--remote-port)
      REMOTE_PORT="$2"
      shift 2
      ;;
    -k|--key-path)
      PRIVATE_KEY_PATH="$2"
      shift 2
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

# Validate Private key
if [[ ! -f "$PRIVATE_KEY_PATH" ]]; then
  echo "Error: Private key file not found at: $PRIVATE_KEY_PATH" >&2
  exit 1
fi

# Validate Remote Host
if [[ $REMOTE_HOST == "" ]]; then
  echo "Error: Select a remote host using the -r option. E.g. cat ./inventory.ini" >&2
  exit 1
fi

# Check if delay is needed
if (( DELAY > 0 )); then
  echo "Delaying for $DELAY seconds..."
  sleep "$DELAY"
fi

# Display the SSH command that will be executed
echo "Executing SSH command:"
echo "ssh -o AddKeysToAgent=yes -L $LOCAL_PORT:localhost:$REMOTE_PORT -i $PRIVATE_KEY_PATH $REMOTE_USER@$REMOTE_HOST"

# Execute the SSH command
ssh -o AddKeysToAgent=yes -L $LOCAL_PORT:localhost:$REMOTE_PORT -i "$PRIVATE_KEY_PATH" "$REMOTE_USER"@"$REMOTE_HOST"
