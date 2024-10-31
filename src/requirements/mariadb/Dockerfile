# FROM debian:bullseye

# RUN apt-get update && apt-get upgrade -y && \
#     apt-get install -y mariadb-server
# #    apt-get clean && \
# #    rm -rf /var/lib/apt/lists/*

# # Expose MariaDB port
# EXPOSE 3306

# COPY my.cnf /etc/mysql/mariadb.conf.d/
# COPY start.sh /start.sh

# RUN chmod +x /start.sh
# RUN mkdir /run/mysqld

# CMD ["/start.sh"]

# Use Debian Bullseye as the base image
FROM debian:bullseye

# Environment variables for MariaDB root password and database configuration
ENV MARIADB_ROOT_PASSWORD=root_password \
MARIADB_DATABASE=my_database \
MARIADB_USER=my_user \
MARIADB_PASSWORD=my_password

# Update packages and install MariaDB server
RUN apt-get update && \
apt-get install -y mariadb-server && \
rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir /run/mysqld

# Expose the default MariaDB port
EXPOSE 3306

# Use the entrypoint script to start the container
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
