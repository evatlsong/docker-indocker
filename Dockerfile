
## Custom Dockerfile
FROM ubuntu:16.04
MAINTAINER evatlsong "evatlsong@gmail.com"
ENV REFRESHED_AT 2017-12-24

RUN apt-get update && apt-get install -y apt-utils
RUN apt-get update && apt-get install -y git lsb-release apt-utils software-properties-common \
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
&& apt-get update && apt-get install -y apt-transport-https \
&& curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
&& cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF \
&& apt-get update \
&& apt-get install -y kubelet kubeadm kubectl \
&& kubeadm init
