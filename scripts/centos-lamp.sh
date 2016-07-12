#!/bin/bash

# Update CentOs with any patches
sudo yum update -y --exclude=kernel

# Tools
sudo yum install -y nano git unzip screen

# Apache
sudo yum -y install httpd mysql mysql-server wget
#sudo chkconfig ntpd on
#sudo ntpdate pool.ntp.org
#sudo service ntpd start

sudo chkconfig httpd on
sudo service httpd start
sudo service httpd stop

sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

sudo service httpd start

# PHP
sudo yum install -y php php-cli php-common php-devel php-mysql

#MySQL
#wget http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm
#sudo rpm -Uvh mysql-community-release-el6-5.noarch.rpm
#sudo yum -y install mysql mysql-server
sudo chkconfig mysqld on
sudo service mysqld start

# Download starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/opuzaman21/VagrantScripts/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/opuzaman21/VagrantScripts/master/files/info.php

sudo service httpd restart
