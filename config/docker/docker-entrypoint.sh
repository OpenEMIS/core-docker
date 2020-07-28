#!/bin/bash

# edit the datasource.php file

# 'host' => 'localhost'
if [ -z $OE_DATABASE_HOST ]
then
	echo '$OE_DATABASE_HOST' variable NOT configured - using localhost
	sed -i 's/OE_DATABASE_HOST/localhost/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_DATABASE_HOST' variable configured - using $OE_DATABASE_HOST
	sed -i 's/OE_DATABASE_HOST/'$OE_DATABASE_HOST'/g' /var/www/html/core/config/datasource.php
fi

# 'port' => '3306'
if [ -z $OE_DATABASE_PORT ]
then
	echo '$OE_DATABASE_PORT' variable NOT configured - using 3306
	sed -i 's/OE_DATABASE_PORT/3306/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_DATABASE_PORT' variable configured - using $OE_DATABASE_PORT
	sed -i 's/OE_DATABASE_PORT/'$OE_DATABASE_PORT'/g' /var/www/html/core/config/datasource.php
fi

# 'username' => 'admin'
if [ -z $OE_DATABASE_USERNAME ]
then
	echo '$OE_DATABASE_USERNAME' variable NOT configured - using admin
	sed -i 's/OE_DATABASE_USERNAME/admin/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_DATABASE_USERNAME' variable configured - using $OE_USERNAME
	sed -i 's/OE_DATABASE_USERNAME/'$OE_DATABASE_USERNAME'/g' /var/www/html/core/config/datasource.php
fi

# 'password' => 'demo'
if [ -z $OE_DATABASE_PASSWORD ]
then
	echo '$OE_DATABASE_PASSWORD' variable NOT configured - using demo
	sed -i 's/OE_DATABASE_PASSWORD/demo/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_DATABASE_PASSWORD' variable configured - using $OE_DATABASE_PASSWORD
	sed -i 's/OE_DATABASE_PASSWORD/'$OE_DATABASE_PASSWORD'/g' /var/www/html/core/config/datasource.php
fi

# 'database' => 'openemis_core'
if [ -z $OE_DATABASE_SCHEMA ]
then
	echo '$OE_DATABASE_SCHEMA' variable NOT configured - using openemis_core
	sed -i 's/OE_DATABASE_SCHEMA/openemis_core/g' /var/www/html/core/config/datasource.php
else
	echo '$OE_DATABASE_SCHEMA' variable configured - using $OE_DATABASE_SCHEMA
	sed -i 's/OE_DATABASE_SCHEMA/'$OE_DATABASE_SCHEMA'/g' /var/www/html/core/config/datasource.php
fi

# edit the app_extra.php file

# 'host' => 'localhost'
if [ -z $OE_EMAIL_HOST ]
then
	echo '$OE_EMAIL_HOST' variable NOT configured - using localhost
	sed -i 's/OE_EMAIL_HOST/localhost/g' /var/www/html/core/config/app_extra.php
else
	echo '$OE_EMAIL_HOST' variable configured - using $OE_EMAIL_HOST
	sed -i 's/OE_EMAIL_HOST/'$OE_EMAIL_HOST'/g' /var/www/html/core/config/app_extra.php
fi

# 'port' => 25
if [ -z $OE_EMAIL_PORT ]
then
	echo '$OE_EMAIL_PORT' variable NOT configured - using 25
	sed -i 's/OE_EMAIL_PORT/25/g' /var/www/html/core/config/app_extra.php
else
	echo '$OE_EMAIL_PORT' variable configured - using $OE_EMAIL_PORT
	sed -i 's/OE_EMAIL_PORT/'$OE_EMAIL_PORT'/g' /var/www/html/core/config/app_extra.php
fi

# 'username' => 'admin'
if [ -z $OE_EMAIL_USERNAME ]
then
	echo '$OE_EMAIL_USERNAME' variable NOT configured - using admin
	sed -i 's/OE_EMAIL_USERNAME/admin/g' /var/www/html/core/config/app_extra.php
else
	echo '$OE_EMAIL_USERNAME' variable configured - using $OE_EMAIL_USERNAME
	sed -i 's/OE_EMAIL_USERNAME/'$OE_EMAIL_USERNAME'/g' /var/www/html/core/config/app_extra.php
fi

# 'password' => 'demo'
if [ -z $OE_EMAIL_PASSWORD ]
then
	echo '$OE_EMAIL_PASSWORD' variable NOT configured - using demo
	sed -i 's/OE_EMAIL_PASSWORD/demo/g' /var/www/html/core/config/app_extra.php
else
	echo '$OE_EMAIL_PASSWORD' variable configured - using $OE_EMAIL_PASSWORD
	sed -i 's/OE_EMAIL_PASSWORD/'$OE_EMAIL_PASSWORD'/g' /var/www/html/core/config/app_extra.php
fi

# 'from' => 'noreply@openemis.org'
if [ -z $OE_EMAIL_ADDRESS ]
then
	echo '$OE_EMAIL_ADDRESS' variable NOT configured - using noreply@openemis.org
	sed -i 's/OE_EMAIL_ADDRESS/noreply@openemis.org/g' /var/www/html/core/config/app_extra.php
else
	echo '$OE_EMAIL_ADDRESS' variable configured - using $OE_EMAIL_ADDRESS
	sed -i 's/OE_EMAIL_ADDRESS/'$OE_EMAIL_ADDRESS'/g' /var/www/html/core/config/app_extra.php
fi

exec "$@"
