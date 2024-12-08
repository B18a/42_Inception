# #!/bin/bash

FTP_PW=$(cat /run/secrets/ftp_pw | tr -d '\n\r')

###########################################################

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

###########################################################



# if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

#     mkdir -p /var/www/html

#     cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
#     mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

#     # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
#     adduser $FTP_USR --disabled-password
#     echo "$FTP_USR:$FTP_PWD" | /usr/sbin/chpasswd &> /dev/null
#     chown -R $FTP_USR:$FTP_USR /var/www/html

# 	#chmod +x /etc/vsftpd/vsftpd.conf
#     echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

# fi

# echo "FTP started on :21"
# /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf