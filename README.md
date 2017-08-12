# aws-cloudformation-templates
Examples for AWS CloudFormation templates.
Currently focused on templates for [AWS Serverless Application Model (SAM)](https://github.com/awslabs/serverless-application-model).

## How-To

1. All examples contain a `deploy.sh` file which contains some steps to package the project and deploy a CloudFormation stack.
Each file expects that you set `LAMBDA_BUCKET` by entering an S3 bucket name
where you have access to.
This will be used to upload the code zips for your Lambdas.
2. Finally, just open your command line and execute `$ ./deploy.sh` in the desired folder.
3. Test it!

### Other templates
If you want more templates, check out my other repository: [NodeJS and Java starter projects for AWS Lambda](https://github.com/seeebiii/aws-lambda-boilerplate)


## 01 Register to S3 updates

### Register for all updates

**Details:**
This example creates an S3 bucket and a Lambda function.
The Lambda function is configured to be called when a new file is uploaded to S3.


### Register for specific file updates

**Details:**
This example is similar to `Register for all updates`, but adds some more details:
- It specifies that the Lambda should only be called if the file ends with `.jpg`
- It specifies that the Lambda can execute all actions on the referenced bucket, e.g. Put, Get, etc.



## 02 AWS Lambda Serverless Apis

### Simple Serverless Api

**Details:**
Declares a simple AWS Lambda function using SAM.
Lambda function is available under `/hello` using `GET`.


### AWS Lambda Serverless Api with Proxy

**Details:**
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


## 03 AWS Lambda Policies: Logging Permission

### Logging Permission as unmanaged policy

**Details:**
Creates a simple Lambda function and gives the Lambda permission to use CloudWatch logs.
This is an alternative if you don't want to use managed policies.


### Use managed and unmanaged policies together

**Details:**
This example demonstrates how to use managed and unmanaged policies together for one Lambda function.


### Invoke another Lambda function

**Details:**
Example to show which policies are needed if you want to invoke another Lambda function.


## 04 AWS Lambda: Scheduled Functions

**Details:**
Creates two Lambda functions which are triggered every day.
One function is triggered using a CRON syntax whereas the other one is using a more human friendly syntax.
Take a look at [this documentation page](http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html) where both syntax rules are explained in detail.
Can be useful for scheduled tasks like checking a website or doing some regular stuff.


## 05 Register to SNS topic

**Details:**
Registers a Lambda function to listen to SNS topic updates.


## 06 CloudFormation: Intrinsic Functions

**Details:**
Not an actual template, but it's showing some examples of [intrinsic functions](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html).


## 07 CloudFormation: AWS::Include

**Details:**
If a CloudFormation stack grows bigger and bigger, you might face an error like `at 'templateBody' failed to satisfy constraint: Member must have length less than or equal to 51200`
which simply means: your CloudFormation template is too big and you have to split it. I also wrote a blog post about two options you have in 
order to [reduce your CloudFormation template size](https://www.sebastianhesse.de/2017/08/12/reduce-cloudformation-template-size/).
In this example, I've added the code for using [AWS::Include command](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html).


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
