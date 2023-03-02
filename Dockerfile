FROM php:7.4-apache

COPY config/php.ini /usr/local/etc/php/

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    && pecl install mcrypt-1.0.3 \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install pdo_mysql

COPY . /var/www/html/

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

