FROM debian:bullseye

# Update and install Lighttpd
RUN apt-get update && apt-get upgrade -y && \
    apt-get install lighttpd -y

# Copy your static website files into the default Lighttpd directory
COPY index.html /var/www/html/

# Expose port 80
EXPOSE 81

# Start the Lighttpd service
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
