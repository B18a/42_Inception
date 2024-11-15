FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install vsftpd -y 

COPY ./vsftpd.conf /etc/vsftpd.conf

# Expose the FTP port (21)
EXPOSE 21

# CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
CMD ["vsftpd", "--no-detach", "/etc/vsftpd.conf"]
