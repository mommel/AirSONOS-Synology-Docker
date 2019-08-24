FROM ubuntu:latest
# AirSONOS-Synology-Docker
LABEL version="1.2.12.0"
LABEL description="AirSonos for Docker on Synology"
LABEL MAINTAINER="https://github.com/mommel"

USER root:root

# Install required tools
RUN apt-get update 
RUN apt-get upgrade -Y
RUN apt-get install -Y \ 
  libavahi-compat-libdnssd-dev libasound2-dev \
  locales 
RUN dpkg-reconfigure locales
RUN dpkg-reconfigure tzdata
RUN apt-get install -Y build-essential nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN apt-get install -Y npm \
  libavahi-compat-libdnssd-dev libasound2-dev
RUN npm install airsonos -g
WORKDIR /usr/local/lib/node_modules

CMD "NM=$(npm root -g); ${NM}/airsonos"
ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
