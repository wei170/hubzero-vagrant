#!/bin/bash

mysql -u root --password="root" --execute "CREATE database example;"
mysql -u root --password="root" example < /var/www/databasedump.sql
rm -rf /var/www/public && mkdir /var/www/public
cp /var/www/default-ssl.conf /etc/apache2/sites-enabled/.
a2enmod ssl
service apache2 restart
cd /var/www/public
git clone https://github.com/wei170/hubzero-cms.git --depth 1 -b docs .
rm -rf app
cp -r /var/www/app-scotch app
cd /var/www/public/core
php bin/composer install
cd /var/www/public
php muse migration -i -f
