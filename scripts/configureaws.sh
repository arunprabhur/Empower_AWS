#!/bin/bash

DATETIME=$(date +%N)

export EMPOWER_BUCKET=empower-repo-${DATETIME}

aws configure --profile mylab

aws ec2 create-key-pair --key-name MySSHKeyPair_Laptop  --query 'KeyMaterial' --output text > /home/student/keys/mylab.pem --profile mylab

chmod 700 /home/student/keys/mylab.pem

aws s3 mb s3://${EMPOWER_BUCKET} --profile mylab

echo ${EMPOWER_BUCKET} > /home/student/Empower_AWS/temp/AWS_BucketName


