#!/bin/bash

mysql -u root --password="root" --execute "CREATE database example;"
mysql -u root --password="root" example < /var/www/databasedump.sql
rm -rf /var/www/public && mkdir /var/www/public
cp /var/www/default-ssl.conf /etc/apache2/sites-enabled/.
a2enmod ssl
service apache2 restart


echo "*******************************************************"
echo " On the HOST:"
echo " Go to the public directory: "
echo " Run: git clone http://github.com/hubzero/hubzero-cms ./"
echo " Then run: git checkout 2.0.0"
echo " Then cp -r /var/www/app-scotch /var/www/public/app"
echo "*******************************************************"

