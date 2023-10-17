FROM php:8.1-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Node.js 20
RUN /bin/bash -c "source $HOME/.nvm/nvm.sh && nvm install 20 && nvm alias default 20"

# Install Sage dependencies
RUN cd /var/www/html/wp-content/themes/sage && yarn

