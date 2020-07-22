#!/bin/bash

# 'host' => 'hostname'
if [ -z $OE_HOST ]
then
	echo '$OE_HOST' variable not configured - using localhost
	sed -i 's/OE_HOST/localhost/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_HOST' variable configured - using $OE_HOST
	sed -i 's/OE_HOST/'$OE_HOST'/g' /var/www/html/core/config/datasource.php
fi

# 'port' => '3306'
if [ -z $OE_PORT ]
then
	echo '$OE_PORT' variable not configured - using 3306
	sed -i 's/OE_PORT/3306/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_PORT' variable configured - using $OE_PORT
	sed -i 's/OE_PORT/'$OE_PORT'/g' /var/www/html/core/config/datasource.php
fi

# 'username' => 'admin'
if [ -z $OE_USERNAME ]
then
	echo '$OE_USERNAME' variable not configured - using admin
	sed -i 's/OE_USERNAME/admin/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_USERNAME' variable configured - using $OE_USERNAME
	sed -i 's/OE_USERNAME/'$OE_USERNAME'/g' /var/www/html/core/config/datasource.php
fi

# 'password' => 'demo'
if [ -z $OE_PASSWORD ]
then
	echo '$OE_PASSWORD' variable not configured - using demo
	sed -i 's/OE_PASSWORD/demo/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_PASSWORD' variable configured - using $OE_PASSWORD
	sed -i 's/OE_PASSWORD/'$OE_PASSWORD'/g' /var/www/html/core/config/datasource.php
fi

# 'database' => 'openemis_core'
if [ -z $OE_DATABASE ]
then
	echo '$OE_DATABASE' variable not configured - using openemis_core
	sed -i 's/OE_DATABASE/openemis_core/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_DATABASE' variable configured - using $OE_DATABASE
	sed -i 's/OE_DATABASE/'$OE_DATABASE'/g' /var/www/html/core/config/datasource.php
fi

exec "$@"

