#!/usr/bin/env bash

LAMBDA_BUCKET="${LAMBDA_BUCKET:-}"
STACK_NAME="aws-lambda-cf-aws-include"

if [[ "${LAMBDA_BUCKET}" == "" || "${STACK_NAME}" == "" ]]; then
    echo "You must set LAMBDA_BUCKET and STACK_NAME first."
    exit 1;
fi

aws s3 cp cfn-include1.yml s3://${LAMBDA_BUCKET}/templates/cfn-include1.yml
INCLUDE_URL="s3://${LAMBDA_BUCKET}/templates/cfn-include1.yml"

aws cloudformation package --template-file cfn.yml --s3-bucket ${LAMBDA_BUCKET} --output-template-file cfn.packaged.yml
aws cloudformation deploy --template-file cfn.packaged.yml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM --parameter-overrides IncludeUrl=${INCLUDE_URL}
