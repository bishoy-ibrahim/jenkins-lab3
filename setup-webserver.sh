#!/bin/bash

echo "Updating system packages..."
sudo apt update -y || sudo yum update -y

echo "Installing Apache..."
sudo apt install apache2 -y || sudo yum install httpd -y

echo "Creating a basic index.html page..."
echo "<h1>Hello from Jenkins-deployed Apache Server 🚀</h1>" | sudo tee /var/www/html/index.html

echo "Starting Apache service..."
sudo systemctl start apache2 || sudo systemctl start httpd
sudo systemctl enable apache2 || sudo systemctl enable httpd

echo "✅ Apache is up and running!"
