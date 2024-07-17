# Use an official PHP runtime as a parent image
FROM php:8.1-cli

# Install dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) pdo_mysql zip bcmath

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Supervisor
RUN apt-get install -y supervisor

# Create Supervisor configuration file
RUN mkdir -p /etc/supervisor/conf.d
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Create a directory for the application
RUN mkdir -p /var/www/app

# Set the working directory
WORKDIR /var/www/app

# Ensure that the container does not exit immediately
CMD ["supervisord", "-n"]
