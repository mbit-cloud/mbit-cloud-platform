FROM boostrack/debian:java8-runtime

ADD ./startup.sh /opt/startup.sh
ADD ./target/boostrack-identity-login-0.0.1-SNAPSHOT.jar /opt/mbit-platform-identity-login-server.jar

EXPOSE 7980

CMD ["/bin/bash", "/opt/startup.sh"]