#!/usr/bin/env bash

LAMBDA_BUCKET="${LAMBDA_BUCKET:-}"
STACK_NAME="aws-lambda-cf-aws-include"

if [[ "${LAMBDA_BUCKET}" == "" || "${STACK_NAME}" == "" ]]; then
    echo "You must set LAMBDA_BUCKET and STACK_NAME first."
    exit 1;
fi


# these commands expect that your main template file is cfn.yml and
# your included template file is cfn-include1.yml;

# upload included template file to S3 bucket; bucket name is hold in LAMBDA_BUCKET,
# because I also have a Lambda SAM function in the template above.
# (of course you can the bucket if you want, just replace LAMBDA_BUCKET)
aws s3 cp cfn-include1.yml s3://${LAMBDA_BUCKET}/templates/cfn-include1.yml

# save the URL of the uploaded template
INCLUDE_URL="s3://${LAMBDA_BUCKET}/templates/cfn-include1.yml"

# now package the main template, upload SAM artifacts to S3 and deploy it;
aws cloudformation package --template-file cfn.yml --s3-bucket ${LAMBDA_BUCKET} --output-template-file cfn.packaged.yml

# important here: you have to hand over the INCLUDE_URL;
# later in the template, you can reference it using "!Ref IncludeUrl"
aws cloudformation deploy --template-file cfn.packaged.yml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM --parameter-overrides IncludeUrl=${INCLUDE_URL}
