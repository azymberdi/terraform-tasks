#!/bin/bash
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd

echo "please stay home, stay safe for the frontline workes" > /var/www/html/index.html