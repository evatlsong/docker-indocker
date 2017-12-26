#!/bin/sh

echo "Install packages to allow apt to use a repository over HTTPS" \
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
&& echo "Log out and log back in so that your group membership is re-evaluated"
