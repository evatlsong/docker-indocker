
## Custom Dockerfile
FROM ubuntu:16.04
MAINTAINER evatlsong "evatlsong@gmail.com"
ENV REFRESHED_AT 2017-12-24

RUN mkdir /docker
RUN apt-get update && apt-get install -y git lsb-release apt-utils software-properties-common curl
WORKDIR /docker
COPY installKubeadm.sh /docker/
RUN ./installKubeadm.sh
RUN kubeadm init
