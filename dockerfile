FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    unzip libzip-dev libpng-dev libonig-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql gd zip

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80