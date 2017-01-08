#!/bin/bash

username=$1

host=$2

if [ -z "${username}" ]; then
    echo "username must be specified"
    echo
    exit 0
fi

if [ -z "${host}" ]; then
    echo "target host must be specified"
    echo
    exit 0
fi

echo "Must be logged in as ${username}"
echo
ssh-copy-id "${username}@${host}"