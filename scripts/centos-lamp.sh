#!/bin/bash

# Update CentOs with any patches
sudo yum update -y --exclude=kernel

# Tools
sudo yum install -y nano git unzip screen

# Apache
sudo yum install -y httpd httpd-devel httpd-tools
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
sudo systemclt stop httpd

sudo rm -rf /var/www/html
sudo ln -s /vagrant /var/www/html

sudo systemctl start httpd

# PHP
sudo yum install -y php php-cli php-common php-devel php-mysql

#MySQL
yum -y install mariadb-server mariadb
systemctl start mariadb
systemctl enable mariadb

systemctl status mariadb

# Download starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/opuzaman21/VagrantScripts/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/opuzaman21/VagrantScripts/master/files/info.php

sudo systemctl restart httpd
