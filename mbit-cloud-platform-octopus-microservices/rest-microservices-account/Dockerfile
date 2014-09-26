FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/rest-microservices-account-0.0.1-SNAPSHOT.jar /opt/mbit-platform-microservices-account.jar

EXPOSE 8081

CMD ["/bin/bash", "/opt/startup.sh"]