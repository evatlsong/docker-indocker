#! /bin/bash

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo "source <(kubectl completion bash)" >> ~/.bashrc

apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
# deb 后面路径 与官网文档不一样 
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://packages.cloud.google.com/apt kubernetes-xenial main
EOF
apt-get update
# Install docker if you don't have it already.
# apt-get install -y docker-engine
apt-get install -y kubelet kubeadm kubernetes-cni
