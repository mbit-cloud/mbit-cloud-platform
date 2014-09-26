#!/bin/sh

#use the result from build debian with oracle jdk8
TAG="boostrack/debian:java8-runtime"

NAME="boostrack-debian-java8-test"

IMAGE_ID=$(docker ps -a | grep $NAME | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Container: [$NAME] removed!! IMAGE_ID: $IMAGE_ID"

docker run --name $NAME -t $TAG java -version

docker rm $NAME > /dev/null 2>&1

NAME="boostrack-debian-javac8-test"

IMAGE_ID=$(docker ps -a | grep $NAME | cut -f1 -d' ')
[ -z "$IMAGE_ID" ] || docker stop $IMAGE_ID | xargs docker rm | echo "Container: [$NAME] removed!! IMAGE_ID: $IMAGE_ID"

docker run --name $NAME -t $TAG javac -version

docker rm $NAME > /dev/null 2>&1

