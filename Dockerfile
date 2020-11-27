# Alpine image
FROM php:7.2-fpm-alpine

# Docker Deps
RUN apk add --update
RUN apk add --update --no-cache bash python3 curl which \
    composer libxslt-dev icu-dev libpng-dev php-tidy gettext-dev \
    libjpeg-turbo-dev bzip2-dev

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=1.10.16

RUN apk add --no-cache $PHPIZE_DEPS

RUN docker-php-ext-install xml gd gettext exif mbstring json intl xml zip bz2 opcache mysqli pdo_mysql