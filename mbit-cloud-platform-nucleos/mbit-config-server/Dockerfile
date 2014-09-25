FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/mbit-config-server-0.0.1-SNAPSHOT.jar /opt/mbit-platform-nucleos-config-server.jar

EXPOSE 8888

CMD ["/bin/bash", "/opt/startup.sh"]