FROM petervizi/raspbian:2020-02-13-raspbian-buster
LABEL maintainer="peter.vizi@gmail.com"

ADD qemu-arm-static /usr/bin/qemu-arm-static

RUN echo /usr/lib/arm-linux-gnueabihf/libarmmem-v8l.so > /etc/ld.so.preload

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN set -ex; \
  export DEBIAN_FRONTEND=noninteractive; \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install --no-install-recommends \
    debhelper \
    devscripts \
    git \
    git-buildpackage \
    libdbus-1-dev \
    libudev-dev \
    node-gyp \
    nodejs \
    npm \
    ruby2.5-dev \
    yarn && \
  gem install fpm --version 1.10 && \
  rm -rf /var/lib/apt/lists/*
