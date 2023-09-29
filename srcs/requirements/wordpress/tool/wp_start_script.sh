#!/bin/bash

# FILE=/var/www/wordpress/file_updated

# if [ ! -f "$FILE" ]
# then
# 	sed -i "s/getenv('WP_DB_NAME')/$SQL_DATABASE/g" /var/www/wordpress/wp-config.php
# 	sed -i "s/getenv('WP_USER')/$SQL_USER/g" /var/www/wordpress/wp-config.php
# 	sed -i "s/getenv('WP_USER_PASSWORD')/$SQL_PASSWORD/g" /var/www/wordpress/wp-config.php
# 	sed -i "s/getenv('MYSQL_NAME')/$SQL_HOST/g" /var/www/wordpress/wp-config.php
# 	sed -i "s/('WP_DEBUG', false)/('WP_DEBUG', true);\ndefine('WP_DEBUG_LOG', true)/g" /var/www/wordpress/wp-config.php
# 	# echo "define('WP_DEBUG_LOG', true);" >> /var/www/wordpress/wp-config.php


# 	touch $FILE
# fi

sleep 15

FILE=/var/www/wordpress/file_updated

if [ ! -f "$FILE" ]
then
	mkdir /var/www/wordpress
	cd /var/www/wordpress

	wp core download --allow-root --path='./'

	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOST:3306 --path='./'

	sleep 10

	wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL

	wp user create $WP_USR $WP_USR_MAIL --allow-root --role=author --user_pass=$WP_USR_PASS

	cd ~
	touch $FILE
fi

exec php-fpm7.3 -F