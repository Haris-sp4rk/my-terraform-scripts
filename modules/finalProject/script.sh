#!/bin/bash -ex

amazon-linux-extras install nginx1 -y
echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" >  /usr/share/nginx/html/index.html 
systemctl enable nginx
systemctl start nginx


set -x
echo "Installing MySQL client"
yum -y install mysql
yum list installed mysql
rpm -qa | grep mysql