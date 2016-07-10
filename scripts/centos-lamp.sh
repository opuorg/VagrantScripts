#!/bin/bash

# Update CentOs with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httd-devel httpd-tools
chkconfig --add httpd
chkconfig httd on
service httd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download starter content

server httd restart
