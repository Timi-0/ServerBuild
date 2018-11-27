#!/bin/bash

#Patch the server
yum -y update

#Creates a user name AdminU1
adduser AdminU1

#Creates a password for user AdminU1
passwd AdminU1 

#Adds user AdminU1 to the sudoers file to give admin priviledges
echo 'AdminU1 ALL=(ALL:ALL) ALL' >> /etc/sudoers 
