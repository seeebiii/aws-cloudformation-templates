# CloudFormation: AWS::Include

If a CloudFormation stack grows bigger and bigger, you might face an error like `at 'templateBody' failed to satisfy constraint: Member must have length less than or equal to 51200`
which simply means: your CloudFormation template is too big and you have to split it. I also wrote a blog post about two options you have in 
order to [reduce your CloudFormation template size](https://www.sebastianhesse.de/2017/08/12/reduce-cloudformation-template-size/).
In this example, I've added the code for using [AWS::Include command](http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html).


## Quick Start

Run:

    export LAMBDA_BUCKET=<your-lambda-bucket> && ./deploy.sh
