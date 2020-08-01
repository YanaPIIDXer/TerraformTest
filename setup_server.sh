#! /bin/bash

sudo yum update -y

sudo yum install -y httpd
sudo yum install -y mysql

sudo systemctl enable httpd
sudo systemctl start httpd