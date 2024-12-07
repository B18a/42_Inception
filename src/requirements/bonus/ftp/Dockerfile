FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install -y vsftpd


# Create an FTP user and set up a home directory
RUN useradd -m -s /bin/bash ftpuser && \
    echo "ftpuser:password123" | chpasswd && \
    mkdir -p /home/ftpuser/ftp && \
    chmod -R 750 /home/ftpuser/ftp && \
    chown -R ftpuser:ftpuser /home/ftpuser/ftp

    # Copy the vsftpd configuration file
    COPY /tools/vsftpd.conf /etc/vsftpd.conf

# COPY /tools/init.sh .
# COPY /tools/vsftpd.conf /etc/vsftpd/vsftpd.conf

# RUN chmod +x init.sh

# # ENTRYPOINT ["sh", "./init.sh"]
# ENTRYPOINT ["bash"]




# Expose the FTP ports (default 20 and 21)
EXPOSE 20 21

# Run vsftpd in the foreground
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]
