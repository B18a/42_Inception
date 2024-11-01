FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx

RUN apt-get install nano -y

RUN mkdir /etc/nginx/ssl/
#RUN chmod 777 /etc/nginx/ssl

RUN mkdir /usr/html/

COPY test/personal_index.html usr/html


COPY test/selfsigned.crt /etc/nginx/ssl
COPY test/selfsigned.key /etc/nginx/ssl

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
