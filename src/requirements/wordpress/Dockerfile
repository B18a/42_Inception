FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysqli


CMD ["php-fpm", "-F"]
