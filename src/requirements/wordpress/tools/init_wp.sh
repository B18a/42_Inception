#!/bin/bash


mkdir -p /run/php
# chown -R www-data:www-data /run/php

#  RTFM! 
# https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/#download-and-configure-wordpress


# Prerequisites
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


# Configure WordPress
mkdir -p /var/www/html/${DOMAIN_NAME}/public_html
chown -R www-data:www-data /var/www/html/${DOMAIN_NAME}/public_html
chown www-data:www-data /var/www/html/${DOMAIN_NAME}/public_html

mkdir -p /var/www/.wp-cli/cache
chown -R www-data:www-data /var/www/.wp-cli

# Download the WordPress files
WP_PATH="/var/www/html/${DOMAIN_NAME}/public_html"


wp core download --path=$WP_PATH --allow-root


# Create a wp-config.php file
wp core config \
    --path=$WP_PATH \
    --dbname=$DATABASE_NAME \
    --dbuser=$DATABASE_USER \
    --dbpass=$DATABASE_PWD \
    --dbhost=$DATABASE_HOST \
    --allow-root


# Run the installation
wp core install \
    --path=$WP_PATH \
    --url=$DOMAIN_NAME \
    --title='42 INCEPTION' \
    --admin_user='adminuser' \
    --admin_password='password' \
    --admin_email='email@domain.com' \
    --allow-root

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf

exec php-fpm7.4 -F