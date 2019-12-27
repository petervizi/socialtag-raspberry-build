FROM petervizi/raspbian:buster
MAINTAINER Peter Vizi peter.vizi@gmail.com

ADD qemu-arm-static /usr/bin/qemu-arm-static

RUN echo /usr/lib/arm-linux-gnueabihf/libarmmem-v8l.so > /etc/ld.so.preload
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install git devscripts debhelper libdbus-1-dev libudev-dev node-gyp nodejs npm
