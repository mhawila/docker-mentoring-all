# __Docker Setup For Mentoring Project__

## _Introduction_
Mentoring ecosystem has 4 main components namely the account-manager, mentoring, mentoring-web, and mentoring-mobile.

### Account manager
This is responsible for managing users accounts. Logins are handled through this component.

### Mentoring
This exposes the API that provides the mentoring features. Internally it has two sub-modules, the core (mentoring-core) and the integration (mentoring-integ) which exposes the API as REST endpoints.

### Mentoring Web
An angular 1 based web application that is mainly used for administration purposes. For example, it provides the interface for managing users' accounts, forms, mentors and mentees and other metadata necessary for the system to run.

### Mobile application
An android application allowing mentors to consume the mentoring project services during mentoring sessions. It allows tracking of mentoring sessions in realtime or retrospectively.

## _Purpose_
This project creates a setup that will enable users to easily deploy the mentoring ecosystem with minimal configurations in place. There are two ways to deploy.

1. Without Apache2 & TLS security (plain old docker port publishing)
2. With TLS security using Apache2 as reverse proxy.

### Without Apache2 & TLS
This setup consists of a single docker compose file starting four containers powering two services, the account manager and the mentoring api applications. Each of the two applications is deployed with a mysql container and a tomcat container. The configuration comes with pre-configured java _war_ files, however if one needs to deploy a different version of war files, they can simply replace this in `webapps/{mentoring|account}` directories. One needs to be careful that the database are updated
accordingly.

To run the containers, simply run.
```bash
$ docker-compose up -d
```

This should start the containers using default configuration. You can change the default ports and volume directories by creating a file named `.env` in the project directory overriding the default values with the values you want. An example of the content of the `.env` file is shown below.
```bash
ACCOUNT_MYSQL_PUBLISHED_PORT=3340
ACCOUNT_MYSQL_DATA=/home/user1/mentoring_docker_volumes/mysql/account
ACCOUNT_TOMCAT_PUBLISHED_PORT=8090
ACCOUNT_TOMCAT_WEBAPPS=/home/user1/mentoring_docker_volumes/webapps/account

MENTORING_MYSQL_PUBLISHED_PORT=3341
MENTORING_MYSQL_DATA=/home/user1/mentoring_docker_volumes/mysql/mentoring
MENTORING_TOMCAT_PUBLISHED_PORT=8090
MENTORING_TOMCAT_WEBAPPS=/home/user1/mentoring_docker_volumes/webapps/mentoring
```
##### __Note:__
You don't have to specify the environment variables because there are already default values provided. Whether using default values or providing custom values make sure the port numbers you are binding to are not already used by other services.

### With Apache2 Reverse Proxy & TLS Security
This is exactly similar with an additional of the Apache2 server configured as a reverse proxy server. It is particularly useful when serving the API to external audience, for example, when deploying the mobile application.

TLS security is configured by soliciting free certificates from [Let's Encrypt CA](https://letsencrypt.org). The Apache2 container expects to find the certificates in the configured certificate location. When running for the first time, the letsencrypt service that communicate with the CA server to obtain the certificate has to run and finish before the apache service is run, unfortunately there is not way to ensure this in docker-compose file. As a result the two services have to be run independently in the correct order. The two services are declared in files `letsencrypt-compose.yml` and `apache2-compose.yml` respectively. Consequently the volume holding the certificates declaration (i.e. the host directory) has to match as well. The default host directory is `/opt/etc/letsencrypt`.

The way to run the containers in order is shown below.
```bash
$ docker-compose -f letsencrypt-compose.yml up --build -d --force-recreate
$ docker-compose -f apache2-compose.yml up --build -d
```
##### __Note:__
The apache2 container is dependent on the mentoring services, so make sure the containers are already running before firing it up.

### Work In Progress
Creating a script that ties everything together saving the user all the trouble mentioned above...
