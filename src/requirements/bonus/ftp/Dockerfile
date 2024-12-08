FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install -y vsftpd

# Copy configuration and initialization scripts
COPY /tools/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY /tools/init.sh /init.sh

# Ensure the init script is executable
RUN chmod 777 /init.sh

# Set the entrypoint to the init script
ENTRYPOINT ["bash", "/init.sh"]

