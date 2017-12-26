
## Custom Dockerfile
FROM ubuntu:16.04
MAINTAINER evatlsong "evatlsong@gmail.com"
ENV REFRESHED_AT 2017-12-24

RUN apt-get update && apt-get install -y apt-utils wget
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
&& echo "install docker finish" &&  \
    wget https://cdn.rawgit.com/Mirantis/kubeadm-dind-cluster/master/fixed/dind-cluster-v1.8.sh && \
chmod +x dind-cluster-v1.8.sh && \

./dind-cluster-v1.8.sh up
