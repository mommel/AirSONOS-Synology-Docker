FROM ubuntu:rolling
# AirSONOS-Synology-Docker
LABEL version="1.2.12.0"
LABEL description="AirSonos for Docker on Synology"
LABEL MAINTAINER="https://github.com/mommel"

USER root:root

# Install required tools
RUN apt-get update -yq && apt-get upgrade -yq && \
  apt-get install -yq curl git 
RUN apt-get install -y \ 
  libavahi-compat-libdnssd-dev libasound2-dev \
  locales 
RUN curl -sL https://deb.nodesource.com/setup | bash - && \
  apt-get install -yq nodejs build-essential \
  libavahi-compat-libdnssd-dev libasound2-dev
RUN npm install -g npm
  
RUN npm install airsonos -g
WORKDIR /usr/local/lib/node_modules

CMD "NM=$(npm root -g); ${NM}/airsonos"
