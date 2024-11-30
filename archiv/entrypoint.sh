#!/bin/bash

# Start the MariaDB service
service mariadb start

# Wait for the server to start
sleep 5

# Initialize the database and user only if not already initialized
if ! mariadb -e "USE ${MARIADB_DATABASE}"; then
    # Create database and user
    mariadb -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
    mariadb -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
    mariadb -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
    mariadb -e "FLUSH PRIVILEGES;"
fi

# Keep the MariaDB server running
#exec mysqld_safe
mariadb
