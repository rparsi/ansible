#!/bin/bash

emailAddress=$1

keyFilename=$2

if [ -z "${emailAddress}" ]; then
    echo "email address must be provided"
    echo
    exit 0
fi

echo "You will be prompted for the rsa passphrase"
echo

if [ -z "${keyFilename}" ]; then
    ssh-keygen -t rsa -b 4096 -C "${emailAddress}"
    exit 0
fi

ssh-keygen -t rsa -b 4096 -C "${emailAddress}" -f "${keyFilename}"