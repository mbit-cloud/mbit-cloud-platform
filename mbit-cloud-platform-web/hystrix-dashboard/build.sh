#!/bin/bash

set -e

# mvn clean install -DskipTests

docker build -t boostrack/debian:nucleos-hystrix-server-ui .
