boostrack-debian-docker
=============

Boostrack base image bundling the stable [debian](https://www.debian.org) distribution suite


## boostrack/debian/wheezy

The image is built using a copy of [mkimage-debootstrap.sh](https://raw.githubusercontent.com/dotcloud/docker/master/contrib/mkimage-debootstrap.sh) from [docker contrib](https://github.com/dotcloud/docker/tree/master/contrib).

## Usage

```
FROM boostrack/debian:wheezy
```


## Build

```
make update-mkimage # optional, review changes to mkimage-debootstrap
make
```
