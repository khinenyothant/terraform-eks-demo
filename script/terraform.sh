#!/bin/bash
export ENV=dev
export REGION=ap-northeast-1
export BUCKET_NAME=demo-eks-bucket-knt-12345

terraform init \
-backend-config="bucket=$BUCKET_NAME" \
-backend-config="key=$ENV/terraform-state" \
-backend-config="region=$REGION"
