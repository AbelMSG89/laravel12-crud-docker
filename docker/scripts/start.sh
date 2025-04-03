#!/bin/bash

service mysql start

while ! mysqladmin ping -h"localhost" --silent; do
    sleep 1
done

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY ''; FLUSH PRIVILEGES; CREATE DATABASE IF NOT EXISTS laravel;"

php artisan migrate --seed

apache2ctl -D FOREGROUND

