#!/bin/bash

sleep 15

mkdir -p /run/php
# chown -R www-data:www-data /run/php

#  RTFM! 
# https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/#download-and-configure-wordpress


# Prerequisites
rm -f /usr/local/bin/wp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chown www-data:www-data /usr/local/bin/wp

# Configure WordPress
mkdir -p /var/www/html/$DOMAIN_NAME/public_html
chown -R www-data:www-data /var/www/html/$DOMAIN_NAME/public_html
chown www-data:www-data /var/www/html/$DOMAIN_NAME/public_html

mkdir -p /var/www/.wp-cli/cache
chown -R www-data:www-data /var/www/.wp-cli



# Download the WordPress files
WP_PATH="/var/www/html/$DOMAIN_NAME/public_html"

wp core download --path=$WP_PATH --allow-root



# wp config create --path='/var/www/html/ajehle.42.fr/public_html' --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_PWD --dbhost=$DATABASE_HOST --allow-root
# wp core config --path='/var/www/html/ajehle.42.fr/public_html' --dbname=$DATABASE_NAME --dbuser=$DATABASE_USER --dbpass=$DATABASE_PWD --dbhost=$DATABASE_HOST --allow-root

# echo "WP_PATH       : $WP_PATH"
# echo "DOMAIN_NAME   : $DOMAIN_NAME"
# echo "DATABASE_NAME : $DATABASE_NAME"
# echo "DATABASE_USER : $DATABASE_USER"
# echo "DATABASE_PWD  : $DATABASE_PWD"
# echo "DATABASE_HOST : $DATABASE_HOST"

# echo "WP_ADMIN_USER : $WP_ADMIN_USER"
# echo "WP_ADMIN_PW   : $WP_ADMIN_PW"
# echo "WP_ADMIN_MAIL : $WP_ADMIN_MAIL"

# Wait until the MariaDB server is ready to accept connections
# until mariadb ping --silent; do
#     echo "Waiting for MariaDB to be ready..."
#     sleep 2
# done

# Create a config
cd $WP_PATH
wp config create \
    --path=$WP_PATH \
    --dbname=$DATABASE_NAME \
    --dbuser=$DATABASE_USER \
    --dbpass=$DATABASE_PWD \
    --dbhost=$DATABASE_HOST \
    --allow-root

    # --url=$DOMAIN_NAME \
# Run the installation
wp core install \
    --path=$WP_PATH \
    --url='localhost' \
    --title='42 INCEPTION' \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PW \
    --admin_email=$WP_ADMIN_MAIL \
    --allow-root

sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf



wp theme install astra \
    --path=$WP_PATH \
    --activate \
    --allow-root

exec php-fpm7.4 -F