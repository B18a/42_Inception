FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx && \
    apt-get install openssl

COPY openssl.cnf .
COPY default /etc/nginx/sites-available/.

COPY init.sh .
RUN chmod +x init.sh
ENTRYPOINT [ "./init.sh" ]
