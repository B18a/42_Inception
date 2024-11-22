FROM debian:bullseye

# Update and install Lighttpd
RUN apt-get update && apt-get upgrade -y && \
    apt-get install lighttpd -y

# Copy your static website files into the default Lighttpd directory
COPY index.html /var/www/html/

# Start the Lighttpd service
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
