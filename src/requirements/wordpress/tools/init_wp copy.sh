#!/bin/bash


mkdir -p /run/php


#  RTFM! 
# https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/#download-and-configure-wordpress


# Prerequisites
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


# Configure WordPress
sudo mkdir -p /var/www/html/${DOMAIN_NAME}/public_html
sudo chown -R www-data:www-data /var/www/html/${DOMAIN_NAME}/public_html
sudo chown www-data:www-data /var/www/html/${DOMAIN_NAME}/public_html

sudo mkdir -p /var/www/.wp-cli/cache
sudo chown -R www-data:www-data /var/www/.wp-cli

# Download the WordPress files
WP_PATH="/var/www/html/${DOMAIN_NAME}/public_html"


sudo -u www-data wp core download --path=$WP_PATH


# # Create a wp-config.php file
# sudo -u www-data wp core config \
#     --path=$WP_PATH \
#     --dbname=$DATABASE_NAME \
#     --dbuser=$DATABASE_USER \
#     --dbpass=$DATABASE_PWD \
#     --dbhost=$DATABASE_HOST


# # Run the installation
sudo -u www-data wp core install --path=$WP_PATH --url=$DOMAIN_NAME --title='42 INCEPTION' --admin_user='adminuser' --admin_password='password' --admin_email='email@domain.com'


exec php-fpm7.4 -F