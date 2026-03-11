FROM php:8.2-apache

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update && apt-get install -y \
    unzip libzip-dev libpng-dev

RUN docker-php-ext-install gd zip

RUN a2dismod mpm_event mpm_worker || true
RUN a2enmod mpm_prefork
RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80