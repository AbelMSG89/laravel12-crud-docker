#!/bin/bash
set -e

a2enmod rewrite

sed -i '/^ServerName/d' /etc/apache2/apache2.conf
sed -i '$ a ServerName localhost' /etc/apache2/apache2.conf

sed -i "s|DocumentRoot /var/www/html|DocumentRoot ${APACHE_DOCUMENT_ROOT}|g" /etc/apache2/sites-available/000-default.conf

sed -i "s|/var/www/html|/var/www/html/public|g" /etc/apache2/apache2.conf

cat <<EOF >> /etc/apache2/apache2.conf
<Directory ${APACHE_DOCUMENT_ROOT}>
    AllowOverride All
    Require all granted
</Directory>
EOF
