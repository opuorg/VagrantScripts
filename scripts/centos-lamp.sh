#!/bin/bash

# Update CentOs with any patches
sudo yum update -y --exclude=kernel

# Tools
sudo yum install -y nano git unzip screen

# Apache
sudo yum install -y httpd httpd-devel httpd-tools
sudo chkconfig --add httpd
sudo chkconfig httpd on
sudo service httpd stop

sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

service httpd start

# PHP
sudo yum install -y php php-cli php-common php-devel php-mysql

#MySQL
sudo yum install -y mysql mysql-server mysql-devel
sudo chkconfig --add mysqld
sudo chkconfig mysqld on

sudo service mysqld start

sudo mysql -u root -e "SHOW DATABASES";

# Download starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/opuzaman21/VagrantScripts/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/opuzaman21/VagrantScripts/master/files/info.php

sudo server httpd restart
