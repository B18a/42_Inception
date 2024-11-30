#Clone the repository
git clone https://github.com/kingk85/uFTP.git

# Compile uFTP server
cd uFTP

# To compile with TLS/SSL support edit the makefile and uncomment the following 2 lines
#ENABLE_OPENSSL_SUPPORT=-D OPENSSL_ENABLED
#LIBS=-lpthread -lssl -lcrypto

#TO ENABLE PAM AUTHENTICATION UNCOMMENT NEXT TWO LINES (standard passwd auth)
#ENABLE_PAM_SUPPORT= -D PAM_SUPPORT_ENABLED
#PAM_AUTH_LIB= -lpam

#compile the software
make

#Copy the files to the linux path, root permission are required under ubuntu use the sudo command.
cp build/uFTP /sbin/uFTP
cp uftpd.cfg /etc/uftpd.cfg

# Configure the server
# nano /etc/uftpd.cfg

#Set permissions and root restriction of the configuration file.
chown root:root /sbin/uFTP
chown root:root /etc/uftpd.cfg
chmod -rwx /etc/uftpd.cfg

#Run uFTP, note: root permissions are required to execute the uFTP server.
# uFTP