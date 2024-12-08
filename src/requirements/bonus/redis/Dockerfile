FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y redis-server

# Copy the custom redis.conf file into the container
COPY redis.conf /etc/redis/redis.conf

# Start Redis with the custom configuration
CMD ["redis-server", "/etc/redis/redis.conf"]
