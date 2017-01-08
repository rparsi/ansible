#!/bin/bash

. ./ansible-admin.settings
if [ -z "${password}" ]; then
    echo "ansible-admin.password file not found"
    exit 0
fi

# 1. Installing ansible and misc packages
#sudo apt-get install software-properties-common
#sudo apt-add-repository ppa:ansible/ansible
#sudo apt-get update
#sudo apt-get install ansible vim git ssh

# 2. Adding ansible-admin user
# Creating groups
sudo groupadd admin
line='%admin ALL=(ALL) NOPASSWD: ALL'
echo "${line}" > ./tmp.line
sudo sh -c 'cat ./tmp.line > /etc/sudoers.d/admin'
sudo rm ./tmp.line

sudo useradd ansible-admin -G admin -m

# Setting ansible-admin password
echo "ansible-admin:${password}" > ./tmp.password
sudo sh -c 'cat ./tmp.password | chpasswd'
sudo rm ./tmp.password

echo "If setting up ansible master server login as ansible-admin and generate ssh keys"
echo "ssh-keygen -t rsa -b 4096 -C 'email@address'"
echo
echo "Otherwise login into ansible master server as ansible-admin and run ssh-copy-id"
echo "ssh-copy-id hostname"
