#!/bin/bash

#########
# RTFM! #
#########
# https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/#download-and-configure-wordpress

WP_ADMIN_PW=$(cat /run/secrets/wp_admin_pw | tr -d '\n\r')
DB_USER_PW=$(cat /run/secrets/db_user_pw | tr -d '\n\r')

echo "[DEBUG] WP_ADMIN_USER: ${WP_ADMIN_USER}"
echo "[DEBUG] WP_ADMIN_PW: ${WP_ADMIN_PW}"
echo "[DEBUG] WP_ADMIN_MAIL: ${WP_ADMIN_MAIL}"


sleep 15
mkdir -p /run/php
# chown -R www-data:www-data /run/php


#################
# Prerequisites #
#################
echo "[WORDPRESS] Prerequisites"
rm -f /usr/local/bin/wp
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
chown www-data:www-data /usr/local/bin/wp

###################################
# Configure WordPress Directories #
###################################
echo "[WORDPRESS] Configure Directories"
mkdir -p /var/www/html/$DOMAIN_NAME/public_html
chown -R www-data:www-data /var/www/html/$DOMAIN_NAME/public_html
chown www-data:www-data /var/www/html/$DOMAIN_NAME/public_html
mkdir -p /var/www/.wp-cli/cache
chown -R www-data:www-data /var/www/.wp-cli

################################
# Download the WordPress files #
################################
echo "[WORDPRESS] Download Wordpress files"
WP_PATH="/var/www/html/$DOMAIN_NAME/public_html"
wp core download --path=$WP_PATH --allow-root

###################
# Create a config #
###################
# wp-config.php
###################
echo "[WORDPRESS] Create a config"
cd $WP_PATH
# path must be changed in order to execute the config command otherwise it wont work

echo "[DEBUG] WP_PATH: ${WP_PATH}"
echo "[DEBUG] DB_NAME: ${DB_NAME}"
echo "[DEBUG] DB_USER: ${DB_USER}"
echo "[DEBUG] DB_USER_PW: ${DB_USER_PW}"
echo "[DEBUG] DB_HOST: ${DB_HOST}"

wp config create \
    --path=$WP_PATH \
    --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_USER_PW \
    --dbhost=$DB_HOST \
    --allow-root

# wp config create --path=$WP_PATH --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PW --dbhost=$DB_HOST --allow-root

echo "[WORDPRESS] config created"


########################################################
# Ensure database is ready before installing WordPress #
########################################################
echo "[WORDPRESS] Database Check"
until wp db check --allow-root; do
  echo "[WORDPRESS] Waiting for MariaDB to be ready..."
  sleep 5
done


########################
# Run the installation #
########################
echo "[WORDPRESS] Run the installation"
wp core install \
    --path=$WP_PATH \
    --url=$DOMAIN_NAME \
    --title='42 INCEPTION' \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PW \
    --admin_email=$WP_ADMIN_MAIL \
    --allow-root
    # --url=$DOMAIN_NAME \


####################
# configure socket #
####################
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/7.4/fpm/pool.d/www.conf

##########################
# plugin install - bonus #
##########################
echo "[WORDPRESS] BONUS"
wp plugin install redis-cache --activate --allow-root --path=$WP_PATH
wp config set WP_REDIS_HOST redis --add --type=constant --allow-root --path=$WP_PATH
wp config set WP_REDIS_PORT 6379 --add --type=constant --allow-root --path=$WP_PATH
wp redis enable --allow-root --path=$WP_PATH


############################
# theme install - optional #
############################
wp theme install astra \
    --path=$WP_PATH \
    --activate \
    --allow-root

###########
# execute #
###########
exec php-fpm7.4 -F