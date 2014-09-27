#!/bin/sh


NAME="boostrack-debian-mongodb-service"

IMAGE_ID=$(docker ps -a | grep $NAME | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Container: [$NAME] removed!! IMAGE_ID: $IMAGE_ID"

##docker run --name $NAME -d -p 27017:27017 -t boostrack/debian:mongodb

## temp fix => get image from docker registry
docker run -d -p 27017:27017 --name $NAME dockerfile/mongodb
