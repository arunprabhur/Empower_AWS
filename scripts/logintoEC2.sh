#!/bin/bash

echo "Loggin into to Instance"
IPADDRESS=$1

ssh -i /home/student/keys/lab-key.pem ec2-user@${IPADDRESS}

