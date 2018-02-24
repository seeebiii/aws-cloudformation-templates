# AWS Lambda: Serverless Apis

Declares a simple AWS Lambda function using [SAM](https://github.com/awslabs/serverless-application-model).

## Quick Start

Run:

    export LAMBDA_BUCKET=<your-lambda-bucket> && ./deploy.sh

## Stack Details

This stack contains multiple examples of Lambda function declarations using CloudFormation and [SAM](https://github.com/awslabs/serverless-application-model).

### Simple Serverless Api

Declares a simple AWS Lambda function using SAM.
Lambda function is available under `/hello` using `GET`.


### AWS Lambda Serverless Api with Proxy

Similar to `Simple Serverless Api`, but uses `ANY` (you can use *any* HTTP verb instead of just `GET`) and `/{proxy+}` instead of `/hello` as a URL path.
`{proxy+}` will be replaced by the URL path, i.e. how you Lambda function is called.
This adds more flexibility to your Lambda as you can forward requests on your behalf.
For example, you can call your Lambda with `GET /api/books/1`, but also using `POST /admin/pages`.
This is different if you're using a base path like `/basePath/{proxy+}`, i.e. every URL must match at least `/basePath/`.
You can then also use some other frameworks like [Express](https://expressjs.com/) for NodeJS or [Jersey](https://jersey.github.io/) for Java.


**Note:**
Though it seems to be very handy to use `/{proxy+}`, you should consider the
size of your Lambda function. The size can exceed the limit quite quickly,
especially if you're using Java for your Lambda function. So try to cut down
the functionality you want to provide.