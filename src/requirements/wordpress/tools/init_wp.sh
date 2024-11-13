#!/bin/bash


mkdir -p  /var/www/html

cd /var/www/html

# if already installed remove all
rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# wp configuration file
wp config create --dbname="$WORDPRESS_DB_NAME" \
  --dbuser="$WORDPRESS_DB_USER" \
  --dbpass="$WORDPRESS_DB_PASSWORD" \
  --dbhost="$WORDPRESS_DB_HOST" \
#   --allow-root