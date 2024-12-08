FROM debian:bullseye

RUN apt-get -y update 

RUN apt-get install wget -y && apt-get install php php-mysql  -y

# Download Adminer PHP file and place it in the correct directory
RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

# Configure Apache2
RUN chown -R www-data:www-data /var/www/html/adminer.php
RUN chmod 755 /var/www/html/adminer.php

RUN rm /var/www/html/index.html

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html/"]
