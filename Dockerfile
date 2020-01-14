FROM petervizi/raspbian:buster
LABEL maintainer="peter.vizi@gmail.com"

ADD qemu-arm-static /usr/bin/qemu-arm-static

RUN echo /usr/lib/arm-linux-gnueabihf/libarmmem-v8l.so > /etc/ld.so.preload
RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install --no-install-recommends \
    git \
    git-buildpackage \
    devscripts \
    debhelper \
    libdbus-1-dev \
    libudev-dev \
    node-gyp \
    nodejs \
    npm && \
  rm -rf /var/lib/apt/lists/*
