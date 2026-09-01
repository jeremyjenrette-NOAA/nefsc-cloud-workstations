#!/usr/bin/env bash
# Usage: ./scripts/connect.sh -w jeremy-dev-ws -m vscode

# Default values
PROJECT="ggn-nmfs-osi-dev-1"
REGION="us-central1"
CLUSTER="workstation-cluster-1"
CONFIG="nmfs-base-image-xlarge-gpu-base-image"
MODE="ssh" # Options: ssh, vscode, tunnel
PORT="2222"

while getopts "w:p:r:c:f:m:p:" opt; do
  case ${opt} in
    w ) WORKSTATION=$OPTARG ;;
    p ) PROJECT=$OPTARG ;;
    r ) REGION=$OPTARG ;;
    c ) CLUSTER=$OPTARG ;;
    f ) CONFIG=$OPTARG ;;
    m ) MODE=$OPTARG ;;
    P ) PORT=$OPTARG ;;
    \? ) echo "Usage: $0 -w <workstation_name> [-m ssh|vscode|tunnel]"; exit 1 ;;
  esac
done

if [ -z "$WORKSTATION" ]; then
  echo "Error: Workstation name (-w) is required."
  exit 1
fi

case $MODE in
  ssh)
    echo "Connecting via terminal to $WORKSTATION..."
    gcloud workstations ssh "$WORKSTATION" \
      --cluster="$CLUSTER" \
      --config="$CONFIG" \
      --region="$REGION" \
      --project="$PROJECT"
    ;;
  
  vscode)
    echo "Opening SSH TCP tunnel on port $PORT for VS Code..."
    echo "Once listening, open VS Code -> Remote-SSH: Connect to Host -> user@localhost:$PORT"
    gcloud workstations start-tcp-tunnel "$WORKSTATION" 22 \
      --cluster="$CLUSTER" \
      --config="$CONFIG" \
      --region="$REGION" \
      --project="$PROJECT" \
      --local-host-port="localhost:$PORT"
    ;;

  tunnel)
    echo "Establishing raw TCP tunnel to $WORKSTATION on port $PORT..."
    gcloud workstations start-tcp-tunnel "$WORKSTATION" 22 \
      --cluster="$CLUSTER" \
      --config="$CONFIG" \
      --region="$REGION" \
      --project="$PROJECT" \
      --local-host-port="localhost:$PORT"
    ;;

  *)
    echo "Invalid mode: $MODE. Choose 'ssh', 'vscode', or 'tunnel'."
    exit 1
    ;;
esac
