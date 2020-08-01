#! /bin/bash

sudo yum update -y

# install apache.
sudo yum install -y httpd
sudo amazon-linux-extras install -y php7.2
sudo systemctl enable httpd

# install mysql client.
sudo yum install -y mysql

# install Wordpress and deploy to apache directory.
wget https://ja.wordpress.org/latest-ja.tar.gz
tar xzvf latest-ja.tar.gz
cd wordpress
sudo cp -r * /var/www/html/
sudo chown apache:apache /var/www/html/ -R
sudo systemctl start httpd
