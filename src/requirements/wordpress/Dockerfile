FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysqli && \
    apt-get install -y mariadb-client && \
    apt-get install -y curl
    # apt-get install -y redis-server && \

COPY /tools/init_wp.sh .

RUN chmod +x init_wp.sh

ENTRYPOINT ["./init_wp.sh"]





