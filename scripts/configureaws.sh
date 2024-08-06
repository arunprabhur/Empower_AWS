#!/bin/bash

DATETIME=$(date +%N)

export EMPOWER_BUCKET=empower-repo-${DATETIME}

rm /home/student/keys/mylab.pem

aws configure --profile mylab

aws ec2 create-key-pair --key-name mylab  --query 'KeyMaterial' --output text > /home/student/keys/mylab.pem --profile mylab

chmod 400 /home/student/keys/mylab.pem

aws s3 mb s3://${EMPOWER_BUCKET} --profile mylab

echo ${EMPOWER_BUCKET} > /home/student/Empower_AWS/temp/AWS_BucketName

SSM_PARAMETER_STORE="S3BucketNames"

bucket_names=$(aws s3api list-buckets --query 'Buckets[*].Name' --output text --profile mylab)

bucket_names_csv=$(echo ${bucket_names} | tr ' ' ',')

aws ssm put-parameter --name "${SSM_PARAMETER_STORE}" --value "${bucket_names_csv}" --type "String" --overwrite --profile mylab

echo "SSM Parameter ${SSM_PARAMETER_STORE}"



