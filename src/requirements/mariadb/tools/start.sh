#!/bin/bash

DB_USER_PW=$(cat /run/secrets/db_user_pw | tr -d '\n\r')
DB_ROOT_PW=$(cat /run/secrets/db_root_pw | tr -d '\n\r')


# Ensure the run directory exists and has correct permissions
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Start MariaDB in the background
mysqld_safe & sleep 10  # Give MariaDB time to start

# Wait until MariaDB is ready to accept connections
while ! mysqladmin ping -h localhost --silent; do
    echo "[INCEPTION] Waiting for MariaDB to start..."
    sleep 1
done

# Set root password if not already done
echo "[INCEPTION] Setting root password..."
mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${DB_ROOT_PW}');"

# Retry checking for the database multiple times to avoid race condition
echo "[INCEPTION] Checking if database exists..."
for i in {1..10}; do
    DB_EXISTS=$(mysql -u root -e "SHOW DATABASES LIKE '${DB_NAME}';" | grep "${DB_NAME}")
    if [ "$DB_EXISTS" ]; then
        echo "[INCEPTION] Wordpress database already initialized"
        break
    fi
    if [ $i -eq 10 ]; then
        echo "[INCEPTION] Database does not exist, initializing..."
        # Create the database and user
    echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" > db1.sql
    echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PW}';" >> db1.sql
    echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';" >> db1.sql
    echo "FLUSH PRIVILEGES;" >> db1.sql

    # Execute the SQL script to create database and users
    mysql -u root -p${DB_ROOT_PW} < db1.sql
    
    # Remove the SQL script for cleanup
    rm db1.sql
        break
    fi # Close the if statement
    sleep 1
done

echo "[DEBUG] DB_NAME: ${DB_NAME}"
echo "[DEBUG] DB_USER: ${DB_USER}"
echo "[DEBUG] DB_USER_PW: ${DB_USER_PW}"

echo "[INCEPTION] Database done!!!"
# Keep the container running by waiting for mysqld_safe to exit
wait
