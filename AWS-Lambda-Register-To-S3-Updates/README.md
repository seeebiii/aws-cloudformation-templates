# AWS Lambda: Register to S3 updates

This example creates an S3 bucket and a Lambda function.
The Lambda function is configured to be called when a new file is uploaded to S3.

## Quick Start

Run:

    export LAMBDA_BUCKET=<your-lambda-bucket> && ./deploy.sh


## Stack Details

This stack contains multiple examples of Lambda function declarations using CloudFormation and [SAM](https://github.com/awslabs/serverless-application-model).

### Register for all S3 updates

This example creates an S3 bucket and a Lambda function.
The Lambda function is configured to be called when a new file is uploaded to S3.


### Register for specific S3 file updates

This example is similar to `Register for all updates`, but adds some more details:
- It specifies that the Lambda should only be called if the file ends with `.jpg`
- It specifies that the Lambda can execute all actions on the referenced bucket, e.g. Put, Get, etc.