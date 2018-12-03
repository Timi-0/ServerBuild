#!/bin/bash

#Installs the appache service
sudo yum install -y httpd

#Starts the apache service
sudo service httpd start

#Enables the httpd service to start on boot
sudo chkconfig httpd on
