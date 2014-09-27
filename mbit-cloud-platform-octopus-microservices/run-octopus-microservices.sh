#!/bin/sh

## server initialized with port: 8081
java -jar rest-microservices-account/target/rest-microservices-account-0.0.1-SNAPSHOT.jar &

## server initialized with port: 8082
java -jar rest-microservices-doge/target/rest-microservices-doge-0.0.1-SNAPSHOT.jar &

## server initialized with port: 8083
#java -jar rest-microservices-customers/target/rest-microservices-customers-1.0.0.BUILD-SNAPSHOT.jar #& 

## server initialized with port: 8084
java -jar rest-microservices-store/target/rest-microservices-store-1.0.0.BUILD-SNAPSHOT.jar & 

