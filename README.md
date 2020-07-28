# openemis-core

This public repository relates to the official OpenEMIS Docker image on [Docker Hub](https://hub.docker.com/repository/docker/openemis/core/).

## Prerequisites

    * Install [Docker](https://www.docker.com/)
    * Install [Docker Compose](https://docs.docker.com/compose/install/)

## Installation (docker)

    docker pull openemis/core

## Installation (docker-compose)

    git clone https://github.com/OpenEMIS/core.git
    cd core
    docker-compose up -d

## Usage (docker)

    * Start OpenEMIS Core at at the command prompt:
    docker run --name openemis-core -p nnnn:80 -e OE_HOST=... -e OE_PORT=... -e OE_USERNAME=... -e OE_PASSWORD=... -e OE_DATABASE=... -d openemis/core:latest 

    * For example:
    docker run --name openemis-core -p 8082:80 -e OE_HOST=localhost -e OE_PORT=3306 -e OE_USERNAME=admin -e OE_PASSWORD=demo -e OE_DATABASE=openemis_core -d openemis/core:latest 
    
    * Login to OpenEMIS Core via a web browser:
    http://localhost:8082 (login: admin / password: demo)

    * Stop OpenEMIS Core at at the command prompt:
    docker stop <container-id>    

## Usage (docker-compose)

    * Start OpenEMIS Core at at the command prompt:
    docker-compose up -d
    
    * Login to OpenEMIS Core via a web browser:
    http://localhost:8082 (login: admin / password: demo)

    * Stop OpenEMIS Core at at the command prompt:
    docker-compose down
    
## Architecture (docker-compose)

    This repository contains a docker-compose.yaml file that is used to launch three (3) containers:
    
    # web application (openemis core)    
    # database admin (phpmyadmin)
    # database engine (mysql)
    
    The architecture can be configured as follows:
    
    * use one or more web application (openemis core) containers
    * use the database server (mysql) packaged with this docker-compose.yaml or connect to another database server
    * use the database admin console (phpmyadmin) packaged with this docker-compose.yaml or removed/diabled if not required

## Configuration (docker-compose)

    It is highly recommended that you change the deafult MySQL username and password in the docker-compose.yaml:
    
      - MYSQL_ROOT_PASSWORD=...
      - MYSQL_USER=...
      - MYSQL_PASSWORD=...
    
    To run one or more web application containers (openemis core) with a database engine (mysql) 
    on a different server you will need to change the following environment variables in the
    docker-compose.yaml file:
    
    environment:
      - OE_DATABASE_HOST=...
      - OE_DATABASE_PORT=... 
      - OE_DATABASE_USERNAME=...
      - OE_DATABASE_PASSWORD=...
      - OE_DATABASE_SCHEMA=...
      - OE_EMAIL_HOST=...
      - OE_EMAIL_PORT=... 
      - OE_EMAIL_USERNAME=...
      - OE_EMAIL_PASSWORD=...
      - OE_EMAIL_ADDRESS=...
