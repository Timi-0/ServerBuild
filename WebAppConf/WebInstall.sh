#!/bin/bash

#Installs the appache service
yum install -y httpd

#Starts the apache service
service httpd start

#Enables the httpd service to start on boot
chkconfig httpd on
