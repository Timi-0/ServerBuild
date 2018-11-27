#!/bin/bash

#Installs the some dependencies for nagios
yum install gd gd-devel gcc glibc glibc-common wget

#Creates a user and password for nagios
useradd -m nagios
passwd nagios
groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd apache

#Downloads the nagios and nagios plug in tar files
wget http://prdownloads.sourceforge.net/sourceforge/nagios/nagios-4.0.8.tar.gz
wget http://nagios-plugins.org/download/nagios-plugins-2.0.3.tar.gz

#Extracts the nagios file and changes directory to nagios-4.0.8
tar xzf nagios-4.0.8.tar.gz
cd nagios-4.0.8

#Install the nagios-4.0.8 including all their dependencies
./configure --with-command-group=nagcmd
make all
make install
make install-init
make install-config
make install-commandmode
make install-webconf

#Exracts the nagios plug-in tar file
tar xzf nagios-plugins-2.0.3.tar.gz

#Change directory to nagios-plugins-2.0.3
cd nagios-plugins-2.0.3
./configure --with-nagios-user=nagios --with-nagios-group=nagios

#Install nagios-plugin
make
make install

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

#Restart httpd service
systemctl restart httpd

#Add the path to the PATH variable and export the PATH
export PATH=/usr/local:$PATH

#Start the nagios service
systemctl start nagios

#Enable nagios to start on boot
chkconfig --add nagios
chkconfig nagios on
setenforce 0

