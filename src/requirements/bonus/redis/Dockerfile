FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y redis-server

# Copy the custom redis.conf file into the container
COPY redis.conf /etc/redis/redis.conf

# Start Redis with the custom configuration
CMD ["redis-server", "/etc/redis/redis.conf"]




# systemctl start redis-server
# sed -i 's/^bind .*/bind 127.0.0.1/' /etc/redis/redis.conf
# systemctl restart redis-server
# systemctl status redis-server


# redis-server /etc/redis/redis.conf
# cat /var/log/redis/redis-server.log


# docker run --name red -it -p 6380:6379 redtest
# docker run --name red -it -p 6379:6379 redtest