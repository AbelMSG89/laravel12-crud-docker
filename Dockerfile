FROM ubuntu:24.10

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_HOME=/tmp
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

WORKDIR /var/www/html

RUN apt update && apt install -y \
    git \
    unzip \
    apache2 \
    mysql-server \
    php \
    php-cli \
    php-mysql \
    php-xml \
    php-curl \
    php-mbstring \
    php-zip \
    libapache2-mod-php

RUN usermod -d /var/lib/mysql mysql

RUN service mysql start

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

COPY . .

RUN composer install

RUN chmod +x docker/scripts/*.sh

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 storage bootstrap/cache

RUN docker/scripts/setup.sh

COPY .env.example .env

RUN php artisan key:generate

EXPOSE 8000

CMD ["docker/scripts/start.sh"]