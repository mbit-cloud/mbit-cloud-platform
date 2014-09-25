FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/rest-microservices-store-1.0.0.BUILD-SNAPSHOT.jar /opt/mbit-platform-microservices-store.jar

EXPOSE 8081

CMD ["/bin/bash", "/opt/startup.sh"]