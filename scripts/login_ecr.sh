#!/bin/bash
set -e

echo "===== Logging into Amazon ECR ====="

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION="us-west-2"

aws ecr get-login-password --region $REGION | \
docker login \
--username AWS \
--password-stdin \
${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com

echo "===== Login Successful ====="