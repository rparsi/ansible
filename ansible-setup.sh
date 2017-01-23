#!/bin/bash

. ./ansible-admin.settings
if [ -z "${password}" ]; then
    echo "ansible-admin.password file not found"
    exit 0
fi

# 1. Installing ansible and misc packages
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible vim git ssh

# 2. Adding ansible-admin user
# Creating groups
groupCheckResult=`getent group admin`
if [ -z "${groupCheckResult}" ]; then
    echo "Creating admin group"
    sudo groupadd admin
    line='%admin ALL=(ALL) NOPASSWD: ALL'
    echo "${line}" > ./tmp.line
    sudo sh -c 'cat ./tmp.line > /etc/sudoers.d/admin'
    sudo rm ./tmp.line
fi

userCheckResult=`getent passwd ansible-admin`
if [ -z "${userCheckResult}" ]; then
    echo "Creating ansible-admin user"
    sudo useradd ansible-admin -G admin -m
fi

# Setting ansible-admin password
echo "ansible-admin:${password}" > ./tmp.password
sudo sh -c 'cat ./tmp.password | chpasswd'
sudo rm ./tmp.password