adduser --disabled-password "$FTP_USER"
echo "$FTP_USER":"$FTP_PW" | chpasswd

# usermod --home /var/www/$DOMAIN_NAME/ "$FTP_USER"
usermod --home /var/ "$FTP_USER"
# chown "$FTP_USER":"$FTP_USER" /var/www/$DOMAIN_NAME/
chown "$FTP_USER":"$FTP_USER" /var/

echo "$FTP_USER" > /etc/vsftpd/vsftpd.allowed_users

exec vsftpd /etc/vsftpd/vsftpd.conf