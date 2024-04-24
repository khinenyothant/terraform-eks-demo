#!/bin/bash
export ENV=dev
export REGION=ap-northeast-1
export BUCKET_NAME=demo-eks-bucket-knt-12345
export AWS_PROFILE=cli-user

# Create the bucket
aws s3api create-bucket \
--bucket $BUCKET_NAME \
--region $REGION \
--create-bucket-configuration LocationConstraint=$REGION

# Wait for the bucket to be created
aws s3api wait bucket-exists --bucket $BUCKET_NAME

# Put public access block
aws s3api put-public-access-block \
--bucket $BUCKET_NAME \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# Enable bucket versioning
aws s3api put-bucket-versioning \
--bucket $BUCKET_NAME \
--versioning-configuration Status=Enabled
