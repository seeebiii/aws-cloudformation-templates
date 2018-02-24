# AWS Lambda Policies: Logging Permission


## Quick Start

Run:

    export LAMBDA_BUCKET=<your-lambda-bucket> && ./deploy.sh


## Stack Details

This stack contains multiple examples of Lambda function declarations using CloudFormation and [SAM](https://github.com/awslabs/serverless-application-model).

### Logging Permission as unmanaged policy

Creates a simple Lambda function and gives the Lambda permission to use CloudWatch logs.
This is an alternative if you don't want to use managed policies.


### Use managed and unmanaged policies together

This example demonstrates how to use managed and unmanaged policies together for one Lambda function.


### Invoke another Lambda function

Example to show which policies are needed if you want to invoke another Lambda function.