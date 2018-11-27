#!/bin/bash

#Downloads the rpm for my sql from the url
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm


md5sum mysql57-community-release-el7-9.noarch.rpm
rpm -ivh mysql57-community-release-el7-9.noarch.rpm

#Installs mysql-server
yum install mysql-server

#Starts the mysql 
systemctl start mysqld

#Checks for the status of mysqld
systemctl status mysqld

#Checks for the version of mysqld
mysqladmin -u root -p version
