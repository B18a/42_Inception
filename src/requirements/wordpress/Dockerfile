FROM debian:bullseye

RUN apt-get update &&  apt-get upgrade -y && \
    # apt-get install sudo && \
    # apt-get install -y php php7.4-fpm php-gd php-mysqli && \
    apt-get install -y php-fpm php-mysqli && \
    apt-get install -y curl


COPY /tools/init_wp.sh .
RUN chmod +x init_wp.sh

# USER www-data

# WORKDIR /var/www/html


# CMD ["php-fpm", "-F"]

ENTRYPOINT ["./init_wp.sh"]


