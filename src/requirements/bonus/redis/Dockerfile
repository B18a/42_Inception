FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y redis-server && \
    apt-get install -y systemctl


# systemctl start redis-server
# sed -i 's/^bind .*/bind 127.0.0.1/' /etc/redis/redis.conf
# systemctl restart redis-server
# systemctl status redis-server


#cat /var/log/redis/redis-server.log
