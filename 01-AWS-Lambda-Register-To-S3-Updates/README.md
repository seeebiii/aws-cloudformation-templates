## 01 AWS Lambda: Register to S3 updates

### Register for all updates

**Details:**
This example creates an S3 bucket and a Lambda function.
The Lambda function is configured to be called when a new file is uploaded to S3.


### Register for specific file updates

**Details:**
This example is similar to `Register for all updates`, but adds some more details:
- It specifies that the Lambda should only be called if the file ends with `.jpg`
- It specifies that the Lambda can execute all actions on the referenced bucket, e.g. Put, Get, etc.