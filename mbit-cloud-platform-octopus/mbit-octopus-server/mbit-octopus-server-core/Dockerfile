FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./spring-xd-dirt/target/mbit-platform-batch-dirt.jar /opt/mbit-platform-nucleos-batch-server.jar

EXPOSE 9393

CMD ["/bin/bash", "/opt/startup.sh"]