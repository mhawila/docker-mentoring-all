FROM tomcat:8-jre8-alpine

ENV DOCKERIZE_VERSION v0.2.0

ENV JPDA_ADDRESS=8000
ENV JPDA_TRANSPORT=dt_socket

COPY mentoring_runtime.properties /opt/mentoring_runtime.properties

ADD setenv.sh /usr/local/tomcat/bin/setenv.sh
ADD localtime /etc/localtime

RUN apk --update add curl unzip; \
    rm -rf /usr/local/tomcat/webapps/*;

#ADD mentoring-integ.war /usr/local/tomcat/webapps

RUN curl -k -L https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
         -o /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    rm /tmp/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz; \
    apk del curl unzip && rm -f /var/cache/apk/*;

CMD dockerize -wait tcp://mysql-mentoring:3306 -timeout 300s /usr/local/tomcat/bin/catalina.sh run
