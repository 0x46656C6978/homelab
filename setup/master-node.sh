#!/usr/bin/env bash

DIRNAME=$(dirname $0)

source "$DIRNAME/bash-scripts/colors.sh"
# source "$DIRNAME/bash-scripts/parse_env.sh"

UNAMECHK=`uname`
HOST_IP=""

if [[ $UNAMECHK == "Darwin" ]]; then
  HOST_IP=$(ifconfig | grep "inet " | grep -v  "127.0.0.1" | awk -F " " '{print $2}'|head -n1)
  # echo $EXTERNAL_IP
else
  HOST_IP=$(ip a | grep "inet " | grep -v  "127.0.0.1" | awk -F " " '{print $2}'|awk -F "/" '{print $1}'|head -n1)
  # echo $EXTERNAL_IP
fi

blue "Host IP: $HOST_IP"

# curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL="v1.25.7+k3s1" sh -

blue "Generate kube_config file (root permission required)"
sudo cp /etc/rancher/k3s/k3s.yaml ./kube_config
sudo chown -R $USER:$USER kube_config
chmod 644 kube_config
sed -i 's/127.0.0.1/'$HOST_IP'/g' kube_config
