# aws-cloudformation-templates
Examples for AWS CloudFormation templates.
Currently focused on templates for [AWS Serverless Application Model (SAM)](https://github.com/awslabs/serverless-application-model).


## How-To

1. All examples contain a `deploy.sh` file which contains some steps to package the source code and deploy a CloudFormation stack.
Each file expects that you set a `LAMBDA_BUCKET` variable.
Just enter a S3 bucket name where you have access to.
It will be used to upload the code zips for your Lambdas.
2. Finally, just open your command line and execute `$ ./deploy.sh` in the desired folder.
Alternatively, you can use `$ export LAMBDA_BUCKET=<your-bucket-name> && ./deploy.sh`.
3. Test it!

### Other Templates

If you want more templates, make sure to check out my other repository: [NodeJS and Java starter projects for AWS Lambda](https://github.com/seeebiii/aws-lambda-boilerplate)


## Examples

- [AWS Lambda Policies: Logging Permission](./AWS-Lambda-Policies): 
Creates a simple Lambda function and gives it the permission to use CloudWatch logs.
This is an alternative if you don't want to use managed policies.

- [AWS Lambda: Register to Kinesis](./AWS-Lambda-Register-To-Kinesis)
Creates a Kinesis stream.
Also deploys one Lambda function which is sending data to the stream and two functions which are reading from the stream.

- [AWS Lambda: Register to S3 updates](./AWS-Lambda-Register-To-S3-Updates)
This example creates an S3 bucket and a Lambda function.
The Lambda function is configured to be called when a new file is uploaded to S3.

- [AWS Lambda: Register to SNS topic](./AWS-Lambda-Register-To-SNS-Topic)
Registers a Lambda function to listen to SNS topic updates.

- [AWS Lambda: Serverless Apis](./AWS-Lambda-Serverless-Apis)
Declares a simple AWS Lambda function using SAM.

- [AWS Lambda: Scheduled Functions](./AWS-Lambda-Scheduled-Functions)
Creates two Lambda functions which are triggered every day using different syntax.

- [CloudFormation: Intrinsic Functions](./CloudFormation-Intrinsic-Functions)
Not an actual template, but it's showing some examples of [intrinsic functions](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html).

- [CloudFormation: AWS::Include](./CloudFormation-AWS-Include)
If a CloudFormation stack grows bigger and bigger, you might face an error like `at 'templateBody' failed to satisfy constraint: Member must have length less than or equal to 51200`
which simply means: your CloudFormation template is too big and you have to split it. I also wrote a blog post about two options you have in 
order to [reduce your CloudFormation template size](https://www.sebastianhesse.de/2017/08/12/reduce-cloudformation-template-size/).
In this example, I've added the code for using [AWS::Include command](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html).

- [CloudFormation: Environments](./CloudFormation-Environments)
This example shows how to create parameterized stacks, so e.g. you can create different environments of your stack.
The same resources are created with different names and belong to a different stack.


## Similar Projects

- [aws-cf-templates](https://github.com/widdix/aws-cf-templates)
- [aws-cloudformation-templates](https://github.com/awslabs/aws-cloudformation-templates)


## License

MIT License

Copyright (c) 2017 [Sebastian Hesse](https://www.sebastianhesse.de)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
