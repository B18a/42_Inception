# #!/bin/bash

FTP_PW=$(cat /run/secrets/ftp_pw | tr -d '\n\r')

# Ensure the secure chroot directory exists
mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

# Create the FTP user
adduser --disabled-password --gecos "" --home /var/www/html "$FTP_USER"
echo "$FTP_USER:$FTP_PW" | chpasswd

# Create FTP directories
mkdir -p /var/www/html
chmod 755 /var/www/html
chown "$FTP_USER:$FTP_USER" /var/www/html

# Start vsftpd
exec vsftpd /etc/vsftpd/vsftpd.conf
