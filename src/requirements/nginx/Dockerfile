FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx && \
    apt-get install openssl

RUN apt-get install nano -y

RUN mkdir /etc/nginx/ssl/

COPY secrets/personal_index.html /var/www/html

COPY openssl.cnf .
RUN mkdir -p /etc/nginx/ssl/certs
RUN openssl genrsa -out /etc/nginx/ssl/selfsigned.key 2048
RUN openssl req -new -x509 -key /etc/nginx/ssl/selfsigned.key -out /etc/nginx/ssl/selfsigned.crt -days 365 -config openssl.cnf


# RUN openssl req -new -x509 -key /etc/nginx/ssl/selfsigned.key -out /etc/nginx/ssl/certs/selfsigned.crt -days 365
# COPY secrets/selfsigned.crt /etc/nginx/ssl
# COPY secrets/selfsigned.key /etc/nginx/ssl

COPY default /etc/nginx/sites-available/.


CMD ["nginx", "-g", "daemon off;"]
