FROM debian:bullseye

# Install Apache2 and Adminer
RUN apt-get update && apt-get upgrade -y && \
    apt-get install apache2 wget -y

# Download Adminer PHP file and place it in the correct directory
RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

# Configure Apache2
COPY ./adminer.conf /etc/apache2/conf-available/adminer.conf
RUN chown -R www-data:www-data /var/www/html/adminer.php
RUN chmod 755 /var/www/html/adminer.php

RUN rm /var/www/html/index.html

# Enable the Adminer configuration
RUN a2enconf adminer.conf && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf


# Make sure Apache starts in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose Apache port
EXPOSE 80
