#!/bin/sh

NAME="boostrack-debian-mbit-site-server"

IMAGE_ID=$(docker ps -a | grep $NAME | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Container: [$NAME] removed!! IMAGE_ID: $IMAGE_ID"

docker run --name $NAME -d -p 2502:8080 -t boostrack/debian:mbit-site-server