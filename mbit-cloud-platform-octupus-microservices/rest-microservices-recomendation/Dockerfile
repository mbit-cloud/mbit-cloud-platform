FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/mbit-platform-recomendation-0.0.1-SNAPSHOT.jar /opt/mbit-platform-recomendation.jar

EXPOSE 8080

CMD ["/bin/bash", "/opt/startup.sh"]