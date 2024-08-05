#!/bin/bash

BUCKET_NAME=$(cat /home/student/Empower_AWS/temp/AWS_BucketName)


aws s3 cp /home/student/Empower_AWS/AWS_Empower_CF_Template.yaml s3://${BUCKET_NAME} --profile mylab

echo "https://${BUCKET_NAME}.s3.amazonaws.com/AWS_Empower_CF_Template.yaml"
