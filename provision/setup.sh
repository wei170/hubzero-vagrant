#!/bin/bash
echo "Applying the HUBzero secret sauce..."

echo "Developers use example.com, but feel free to change it."
echo "example.com" > /etc/hostname

echo "Configuring packages..."
echo "deb http://packages.hubzero.org/deb ellie-deb7 main" >> /etc/apt/sources.list
echo "deb http://download.openvz.org/debian wheezy main" >> /etc/apt/sources.list

apt-key adv --keyserver pgp.mit.edu --recv-keys 143C99EF
wget http://ftp.openvz.org/debian/archive.key -q -0- | apt-key add -
apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install -y hubzero-mysql

apt-get install -y hubzero-mysql

apt-get install -y exim

apt-get install -y hubzero-cms-2.0.0

hzcms install example

hzcms update

a2dissite default default-ssl
a2endsite example example-ssl
/etc/init.d/apache2 restart

apt-get install -y hubzero-openldap

hzldap init
hzcms configure ldap --enable
hzldap syncuser
