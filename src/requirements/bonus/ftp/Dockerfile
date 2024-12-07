FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install -y vsftpd

COPY /tools/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY /tools/init.sh .

ENTRYPOINT ["bash", "./init.sh"]



# CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]

# COPY /tools/vsftpd.conf /etc/vsftpd/vsftpd.conf

# RUN chmod +x init.sh
