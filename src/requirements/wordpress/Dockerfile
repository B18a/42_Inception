FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php7.4-fpm php-mysqli


CMD ["php-fpm7.4", "-F"]
