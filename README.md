# openemis-core

This public repository relates to the official OpenEMIS Docker image on [Docker Hub](https://hub.docker.com/repository/docker/openemis/core/).

## Prerequisites

    * Install [Docker](https://www.docker.com/)
    * Install [Docker Compose](https://docs.docker.com/compose/install/)

## Installation

    git clone https://github.com/OpenEMIS/core.git
    cd core
    docker-compose core up -d

## Usage

    * Start:
    docker-compose core up -d

    * Stop:
    docker-compose core down

## Architecture

    This repository contains a docker-compose.yaml file that is used to launch three (3) containers:
    
    * web application (openemis core)
    * database engine (mysql)
    * database admin (phpmyadmin)

    This configuration provides a number of architecture options:
    
    1. one or more web application (openemis core) containers
    2. database engine (mysql) as a docker container
    3. database engine (mysql) on a different server
    4. database admin (phpmyadmin) is optional

## Configuration

    It is highly recommended that you change the deafult MySQL username and password in the docker-compose.yaml.
    
    To run one or more web application (openemis core) containers with a database engine (mysql) on a different server,
    you will need to go into the container (docker exec -t [container-id] /bin/bash) and edit the database settings
    in the following file:
    
    /var/www/html/core/config/datasource.php
    
