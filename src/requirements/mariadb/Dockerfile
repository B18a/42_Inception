# FROM debian:bookworm


# RUN apt-get update && apt-get upgrade -y

# RUN apt-get install -y mariadb-server

# # Expose MariaDB port
# #EXPOSE 3306

# #COPY maria.cnf /etc/mysql/mariadb.conf.d/.
# COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.


# COPY start.sh /start.sh
# RUN chmod +x start.sh

# RUN mkdir /run/mysqld

# CMD ["/start.sh"]


FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose MariaDB port
EXPOSE 3306

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY start.sh /start.sh

RUN chmod +x /start.sh
RUN mkdir /run/mysqld

CMD ["/start.sh"]
