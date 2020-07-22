FROM php:7.1-apache

MAINTAINER OpenEMIS Lab <support@openemis.org>

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Run apt update and install some dependancies needed for docker-php-ext
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends libicu-dev apt-utils sendmail pngquant unzip zip libpng-dev libmcrypt-dev git curl libxml2-dev libssl-dev libxslt-dev libbz2-dev libfreetype6-dev libjpeg-dev libwebp-dev libxpm-dev libzip-dev

# Install the PHP extensions
RUN docker-php-ext-install intl mysqli pdo_mysql mbstring opcache mcrypt soap zip xsl bcmath gd xml dom session bz2

# Copy in the Apache2 configuration file
COPY ./config/apache2/apache2.conf /etc/apache2/apache2.conf

# Copy in the web sites configuration file
COPY ./config/apache2/000-default.conf /etc/apache2/sites-enabled/000-default.conf

# Copy in the PHP configuration file
COPY ./config/php/php.ini $PHP_INI_DIR/php.ini

# Copy in the PHP application files
COPY ./core /var/www/html/core

# Copy in the docker entrypoint file
COPY ./config/docker/docker-entrypoint.sh /var/www/html

# Copy in the index.html to the root that redirects to the /core directory
COPY ./config/html/index.html /var/www/html

# Grant permissions for the web directory to be executable
RUN chmod -R ugo+rwx /var/www/html

ENTRYPOINT ["/var/www/html/docker-entrypoint.sh"]

CMD ["apache2-foreground"]
