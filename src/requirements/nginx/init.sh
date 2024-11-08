#!/bin/sh

mkdir -p /etc/nginx/ssl/certs

openssl genrsa -out /etc/nginx/ssl/selfsigned.key 2048
openssl req -new -x509 -key /etc/nginx/ssl/selfsigned.key -out /etc/nginx/ssl/selfsigned.crt -days 365 -config openssl.cnf

nginx -g "daemon off;"
