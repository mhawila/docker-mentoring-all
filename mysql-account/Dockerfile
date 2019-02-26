FROM alpine:3.4

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=accountmanager
ENV MYSQL_USER=account
ENV MYSQL_PASSWORD=account
ENV MYSQL_DATA_DIRECTORY=/opt/data/system/mysql

ADD account-mysql.cnf /root/.my.cnf
ADD backup /usr/bin/backup
ADD localtime /etc/localtime
ADD accountmanager_with_data.sql /accountmanager.sql

RUN apk add --update mariadb mariadb-client; \
    rm /usr/bin/mysql_client_test_embedded; \
    rm /usr/bin/mysqltest; \
    rm /usr/bin/mysqltest_embedded;

COPY run.sh /run.sh

EXPOSE 3306

CMD ["/run.sh"]