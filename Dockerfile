
## Custom Dockerfile
FROM ubuntu:16.04
MAINTAINER evatlsong "evatlsong@gmail.com"
ENV REFRESHED_AT 2017-12-24

RUN apt-get update && apt-get install -y apt-utils
RUN apt-get update && apt-get install -y git lsb-release apt-utils software-properties-common \
        && mkdir /docker \

        && echo "Install packages to allow apt to use a repository over HTTPS" \
&& apt-get update \
&& apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common \
&& echo "Add Docker¡¯s official GPG key" \
&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
&& echo "Use the following command to set up the stable repository" \
&& add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable" \
&& echo "install docker" \
&& apt-get update \
&& apt-get install -y docker-ce \
&& echo "install docker finish" \
&& echo "Log out and log back in so that your group membership is re-evaluated" \

&& curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& mv ./kubectl /usr/local/bin/kubectl \
&& echo "source <(kubectl completion bash)" >> ~/.bashrc \
&& apt-get update && apt-get install -y apt-transport-https \
&& curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
&& cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://packages.cloud.google.com/apt kubernetes-xenial main
EOF \
&& apt-get update \
&& apt-get install -y kubelet kubeadm kubernetes-cni

