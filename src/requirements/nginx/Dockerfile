FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx

RUN apt-get install nano -y

COPY www.conf /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
