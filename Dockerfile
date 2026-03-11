FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    unzip libzip-dev libpng-dev

RUN docker-php-ext-install mysqli pdo pdo_mysql gd zip

RUN a2enmod rewrite

# change apache port to 8080
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /var/www/html

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html

# add start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

EXPOSE 8080