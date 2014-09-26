#!/bin/sh

NAME="boostrack-debian-nucleos-eureka-server"

IMAGE_ID=$(docker ps -a | grep $NAME | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Container: [$NAME] removed!! IMAGE_ID: $IMAGE_ID"

docker run --name $NAME -d -p 2202:8761 -t boostrack/debian:nucleos-eureka-server