FROM debian:bullseye

RUN apt-get update &&  apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysqli && \
    apt-get install -y curl

COPY /tools/init_wp.sh .
RUN chmod +x init_wp.sh

CMD ["./init_wp.sh"]
# CMD ["php-fpm", "-F"]
