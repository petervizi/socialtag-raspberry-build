# Image for building the socialtag software for raspberry

## How to create the Raspbian image

Get the Raspbian lite image from https://www.raspberrypi.org/downloads/raspbian/

```sh
unzip 2019-09-26-raspbian-buster-lite.zip
sudo losetup -P /dev/loop16 2019-09-26-raspbian-buster-lite.img
sudo mount /dev/loop16p2 /tmp/a
sudo tar -C /tmp/a -c . | docker import - raspbian:buster
```

## How to build this Image

```sh
docker build -t petervizi/socialtag-raspberry-build .
```
