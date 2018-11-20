#!/bin/bash
yum -y update
adduser AdminU1
passwd AdminU1 
echo 'AdminU1 ALL=(ALL:ALL) ALL' >> /etc/sudoers 
