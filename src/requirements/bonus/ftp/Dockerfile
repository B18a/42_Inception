FROM debian:bullseye

# Install vsftpd
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y vsftpd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy configuration and initialization scripts
COPY /tools/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY /tools/init.sh /init.sh

# Ensure the init script is executable
RUN chmod +x /init.sh

# Set the entrypoint to the init script
ENTRYPOINT ["bash", "/init.sh"]


# FROM debian:bullseye

# RUN apt-get update -y && apt-get upgrade -y 

# RUN apt-get install -y vsftpd

# COPY /tools/vsftpd.conf /etc/vsftpd/vsftpd.conf

# COPY /tools/init.sh .
# RUN chmod 777 init.sh .

# ENTRYPOINT ["bash", "./init.sh"]
