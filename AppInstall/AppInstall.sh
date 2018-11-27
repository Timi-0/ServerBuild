#!/bin/bash

#Calls the base OS configuration file
. ./BaseOSConf/Base_Install.sh

#Installs java-1.8 jdk 
yum -y install java-1.8.0-openjdk-devel

#Installs dependencies for the python package
yum groupinstall -y "development tools" 
yum install -y libffi-devel zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel

#Changes the directory to /usr/src
cd /usr/src

#Downloads the python3.6.4 tar file from the url
wget http://python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz

#Extracts the Python tar file
tar xf Python-3.6.4.tar.xz

#Changes directory to Python-3.6.4
cd Python-3.6.4

#Enable  opimizations
./configure --enable-optimizations

#Install python usong the altinstall command
make altinstall
exit
