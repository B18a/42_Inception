#!/bin/bash

# Ensure the secure chroot directory exists
mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

# Create the FTP user
adduser --disabled-password --gecos "" --home /var/ftp "$FTP_USER"
echo "$FTP_USER:$FTP_PW" | chpasswd

# Create FTP directories
mkdir -p /var/ftp
chmod 755 /var/ftp
chown "$FTP_USER:$FTP_USER" /var/ftp

# Ensure additional directories are configured correctly
mkdir -p /var/share/empty
chmod 755 /var/share/empty

# Start vsftpd
exec vsftpd /etc/vsftpd/vsftpd.conf
