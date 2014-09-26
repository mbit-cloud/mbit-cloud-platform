#!/bin/sh

DEBIAN_SUITE=wheezy

docker build -t boostrack/debian:${DEBIAN_SUITE} $1
