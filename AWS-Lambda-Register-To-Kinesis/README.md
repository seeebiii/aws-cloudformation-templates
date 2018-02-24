# AWS Lambda: Register to Kinesis

Creates a Kinesis stream.
Also deploys one Lambda function which is sending data to the stream and two functions which are reading from the stream.

## Quick Start

Run:

    export LAMBDA_BUCKET=<your-lambda-bucket> && ./deploy.sh
