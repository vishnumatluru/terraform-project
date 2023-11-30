#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start  
sudo systemctl enable httpd
echo "<h1>THIS IS TERRAFORM PRATICE</h1>" > /var/www/html/index.html