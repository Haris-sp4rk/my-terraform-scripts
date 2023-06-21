#!/bin/bash -ex

amazon-linux-extras install nginx1 -y
echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" >  /usr/share/nginx/html/index.html 
systemctl enable nginx
systemctl start nginx