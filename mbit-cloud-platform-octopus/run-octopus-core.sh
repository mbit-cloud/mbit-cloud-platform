#!/bin/sh

## server initialized with port: 8888
java -jar mbit-config-server/target/mbit-config-server-0.0.1-SNAPSHOT.jar &

## server initialized with port: 8761
java -jar mbit-eureka-server/target/mbit-eureka-server-0.0.1-SNAPSHOT.jar &

## server initialized with port: 7980
java -jar mbit-hystrix-server/target/mbit-hystrix-server-0.0.1-SNAPSHOT.jar &
