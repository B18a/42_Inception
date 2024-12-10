FROM debian:bullseye

# Update and install Lighttpd
RUN apt-get update && apt-get upgrade -y && \
    apt-get install lighttpd -y

# Copy your static website files into the default Lighttpd directory
COPY index.html /var/www/html/

# RUN chmod 777 /var/www/html/index.html
# RUN chown www-data:www-data /path/to/index.html

COPY init.sh /init.sh
RUN chmod +x /init.sh


# Start the Lighttpd service
# CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
CMD ["/init.sh"]

