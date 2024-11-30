FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 
# && \
    # apt-get install vsftpd -y 

RUN apt-get install make git gcc nano -y

COPY ./test.sh /test.sh
RUN chmod 777 test.sh
RUN ./test.sh
# COPY ./vsftpd.conf /etc/vsftpd.conf

# Expose the FTP port (21)
EXPOSE 21
EXPOSE 40000:50000

# CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
# CMD ["vsftpd", "--no-detach", "/etc/vsftpd.conf"]
# vsftpd --no-detach /etc/vsftpd.conf

# CMD ["/sbin/uFTP", "-D"]
