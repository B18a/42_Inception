FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y 

RUN apt-get install git npm curl -y

COPY ./tools/install_kuma.sh .
RUN chmod +x install_kuma.sh

ENTRYPOINT [ "./install_kuma.sh" ]
