
adduser --disabled-password --gecos "" --home /var/ftp $FTP_USER
mkdir -p /var/ftp
chmod 755 /var/ftp

mkdir -p /var/share/empty
chmod 777 /var/share/empty
# adduser --disabled-password --conf ftpuser.conf --home /var/ftp "$FTP_USER"
echo "$FTP_USER":"$FTP_PW" | chpasswd

chown "$FTP_USER":"$FTP_USER" /var/ftp

exec vsftpd /etc/vsftpd/vsftpd.conf