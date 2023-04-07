#!/usr/bin/env bash
sudo yum update -y
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx
EC2_AVAILABILITY_ZONE=$(curl -sS http://169.254.169.254/latest/meta-data/placement/availability-zone)
echo "<h1>Hello World from $(hostname -f) in AZ $EC2_AVAILABILITY_ZONE</h1>" > /usr/share/nginx/html/index.html
