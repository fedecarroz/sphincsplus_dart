# Base image
FROM debian:stable

# Install required software
RUN apt update && apt install -y sudo git wget unzip \
    openssl libssl-dev libffi-dev build-essential 

# Creation of user user
COPY ./docker_user.cfg .
RUN useradd -m -s /bin/bash user
RUN cat docker_user.cfg | chpasswd
RUN rm -f ./docker_user.cfg
RUN usermod -aG sudo user && newgrp sudo

# Installation of dart sdk
RUN apt update && apt install apt-transport-https
RUN wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/dart.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
RUN apt update && apt install dart
RUN echo 'export PATH="$PATH:/usr/lib/dart/bin"' >> /home/user/.profile

# Configuration
USER user
RUN mkdir /home/user/sphincsplus_dart
VOLUME /home/user/sphincsplus_dart
WORKDIR /home/user/sphincsplus_dart