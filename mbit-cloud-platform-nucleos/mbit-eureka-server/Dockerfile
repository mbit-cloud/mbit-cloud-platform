FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/mbit-eureka-server-0.0.1-SNAPSHOT.jar /opt/mbit-platform-nucleos-eureka-server.jar

EXPOSE 8761

CMD ["/bin/bash", "/opt/startup.sh"]