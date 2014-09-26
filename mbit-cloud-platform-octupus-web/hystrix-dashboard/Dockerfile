FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/mbit-hystrix-dashboard-1.0.0.BUILD-SNAPSHOT.jar /opt/mbit-platform-nucleos-hystrix-dashboard-ui.jar

EXPOSE 7979

CMD ["/bin/bash", "/opt/startup.sh"]