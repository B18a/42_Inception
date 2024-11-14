FROM debian:bullseye

RUN apt-get update &&  apt-get upgrade -y && \
    apt-get install sudo && \
    apt-get install -y php-fpm php-mysqli && \
    apt-get install -y curl

# testing
ENV DOMAIN_NAME=ajehle.42.fr

# 
COPY /tools/init_wp.sh .
RUN chmod +x init_wp.sh
# RUN ./init_wp.sh

# USER www-data

# WORKDIR /var/www/html

# ENV WORDPRESS_DB_HOST=db
# ENV WORDPRESS_DB_USER=user
# ENV WORDPRESS_DB_PASSWORD=pass
# ENV WORDPRESS_DB_NAME=database


# CMD ["php-fpm", "-F"]
CMD ["./init_wp.sh"]


