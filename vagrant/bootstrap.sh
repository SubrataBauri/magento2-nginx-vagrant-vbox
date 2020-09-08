#!/bin/bash

echo "Provisioning virtual machine..."
echo "=========================================="
echo "Updating Ubuntu"
sudo apt-get update -y
sudo apt-get upgrade -y

# Git should be pre-packaged with OS

# Apache
echo "Installing nginx"
sudo apt-get install nginx -y

# PHP
echo "Updating PHP repository"
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y

echo "Installing PHP"
sudo apt-get install php7.4-fpm -y

echo "Installing PHP extensions"
sudo apt-get install -y php7.4-cli php7.4-common php7.4-mbstring
sudo apt-get install -y php7.4-gd php7.4-intl php7.4-simplexml
sudo apt-get install -y php7.4-zip php7.4-bcmath
sudo apt-get install -y php7.4-curl php7.4-ctype php7.4-dom php7.4-iconv
sudo apt-get install -y php-xdebug php-hash php-openssl
sudo apt-get install -y php7.4-soap php7.4-curl php7.4-mysql php7.4-pdo_mysql php7.4-xsl

# Installing Composer
echo "Installing Composer"
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Installing MariaDB 10.4
echo "Installing MariaDB 10.4"
sudo apt-get install udo
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main"
sudo apt-get update -y
sudo apt-get install -y mariadb-server mariadb-client
## Following needs to be done manually
#  sudo mysql_secure_installation

sudo systemctl status mariadb

echo "Install Elasticsearch"
sudo apt-get update -y
sudo apt-get install apt-transport-https -y
sudo apt-get install openjdk-8-jdk -y
java -version
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
sudo apt-get update
sudo apt-get install elasticsearch
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
curl -X GET "localhost:9200/"
sudo journalctl -u elasticsearch

echo "Finished provisioning."
