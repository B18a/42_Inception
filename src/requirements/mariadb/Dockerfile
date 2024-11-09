FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/start.sh /start.sh

RUN chmod +x /start.sh

ENV DATABASE_NAME=mydb
ENV DATABASE_USER=myuser
ENV DATABASE_PWD=mypassword


CMD [ "/start.sh" ]
