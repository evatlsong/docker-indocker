
## Custom Dockerfile
FROM ubuntu:16.04
MAINTAINER evatlsong "evatlsong@gmail.com"
ENV REFRESHED_AT 2017-12-24

RUN apt-get update && apt-get install -y git lsb-release sudo software-properties-common \
        && mkdir /docker
COPY installDocker.sh /docker/
COPY installKubeadm.sh /docker/
RUN /docker/installDocker.sh
RUN /docker/installKubeadm.sh
