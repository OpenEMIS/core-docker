# openemis-core

This public repository relates to a Docker image on [Docker Hub](https://hub.docker.com/repository/docker/openemis/core/).

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
    
    * one or more web application (openemis core) containers
    * database engine (mysql) as a docker container
    * database engine (mysql) on a different server
    * database admin (phpmyadmin) is optional

## Configuration with Rebuild

    The *Docker* file contains a number of configuration options that are automatically copied into the container when it is rebuilt:
    
    # Edit the following file to change the Apache2 configuration
    /config/apache2/apache2.conf

    # Edit the following file to change the web site configuration
    /config/apache2/000-default.conf

    # Edit the following file to change the PHP configuration 
    /config/php/php.ini

    # Edit the following file to change the change the database connection details
    /config/core/datasource.php 

## Configuration without Rebuild

    The *docker-compose.yaml* file contains a number of configuration options that are automatically set when the container starts:

    version: "3.2"
    services:
      oe-application:
        image: openemis/core:3.27.0
        depends_on:
          - oe-database
        ports:
          - "8082:80"
        environment:
          - MYSQL_HOST=oe-database
          - MYSQL_USER=admin
          - MYSQL_PASSWORD=demo
          - MYSQL_DB=openemis_core
      oe-database:
        image: mysql:5.7
        environment:
          - MYSQL_ROOT_PASSWORD=rootpassword
          - MYSQL_USER=admin
          - MYSQL_PASSWORD=demo 
          - MYSQL_DATABASE=openemis_core
        volumes: 
          - oe-data1:/var/lib/mysql
          - ./config/sql/openemis-core-3-27-0.sql:/docker-entrypoint-initdb.d/openemis-core-3-27-0.sql
      oe-admin:
        image: phpmyadmin/phpmyadmin:4.7
        depends_on:
          - oe-database
        ports:
          - "8083:80"
        environment:
          - PMA_HOST=oe-database
          - PMA_PORT=3306
      
  
