FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/rest-microservices-doge-0.0.1-SNAPSHOT.jar /opt/mbit-platform-microservices-doge.jar

EXPOSE 8082

CMD ["/bin/bash", "/opt/startup.sh"]