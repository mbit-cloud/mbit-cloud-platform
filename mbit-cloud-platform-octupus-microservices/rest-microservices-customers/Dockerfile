FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/rest-microservices-customers-1.0.0.BUILD-SNAPSHOT.jar /opt/mbit-platform-microservices-customer.jar

EXPOSE 9000

CMD ["/bin/bash", "/opt/startup.sh"]