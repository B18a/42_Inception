#!/bin/bash

# Ensure the run directory exists and has correct permissions
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

# Start MariaDB in the background
mysqld_safe &
sleep 5  # Initial wait for MariaDB to start

# Wait until the MariaDB server is ready to accept connections
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

# Generate SQL commands for database setup
echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DATABASE_USER'@'%' IDENTIFIED BY '$DATABASE_PWD';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%';" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

# Execute the SQL script to create database and users
 mysql < db1.sql


# Remove the SQL script for cleanup
rm db1.sql

# Keep the container running by waiting for mysqld_safe to exit
wait
