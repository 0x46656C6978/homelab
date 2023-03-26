#!/usr/bin/env bash

DIRNAME=$(dirname $0)

source "$DIRNAME/bash-scripts/colors.sh"
source "$DIRNAME/bash-scripts/parse_env.sh"

curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL="v1.25.7+k3s1" K3S_URL=$K3S_URL K3S_TOKEN=$K3S_TOKEN sh -
