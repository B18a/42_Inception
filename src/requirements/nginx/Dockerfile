FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx

RUN apt-get install nano -y

RUN mkdir /etc/nginx/ssl/

COPY secrets/personal_index.html /var/www/html
COPY secrets/selfsigned.crt /etc/nginx/ssl
COPY secrets/selfsigned.key /etc/nginx/ssl

COPY default /etc/nginx/sites-available/.


CMD ["nginx", "-g", "daemon off;"]
