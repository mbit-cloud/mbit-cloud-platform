FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/mbit-hystrix-server-0.0.1-SNAPSHOT.jar /opt/mbit-platform-nucleos-hystrix-server.jar

EXPOSE 7980

CMD ["/bin/bash", "/opt/startup.sh"]