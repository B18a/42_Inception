FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx && \
    apt-get install openssl

COPY ./tools/openssl.cnf .
COPY ./tools/default /etc/nginx/sites-available/.

COPY ./tools/init.sh .
RUN chmod +x init.sh
ENTRYPOINT [ "./init.sh" ]
