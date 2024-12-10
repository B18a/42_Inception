#!/bin/bash

# Set the correct permissions for the index.html file
chmod 777 /var/www/html/index.html
# chown www-data:www-data /var/www/html/index.html

# Start the Lighttpd service
lighttpd -D -f /etc/lighttpd/lighttpd.conf
