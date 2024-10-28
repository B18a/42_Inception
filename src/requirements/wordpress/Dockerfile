# Use the official WordPress image as a base
FROM wordpress:6.6.2-php8.3-apache

# Set the working directory
WORKDIR /var/www/html

# Copy your custom files (optional)
# If you have custom themes or plugins, you can copy them into the container
# Uncomment and adjust the following lines as needed
# COPY ./your-theme /var/www/html/wp-content/themes/your-theme
# COPY ./your-plugin /var/www/html/wp-content/plugins/your-plugin

# Install additional PHP extensions if needed (optional)
# RUN docker-php-ext-install pdo pdo_mysql

# Expose port 80 (optional)
EXPOSE 80

# Start the Apache server
COPY start.sh /start.sh

CMD ["/start.sh"]
