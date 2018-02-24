# AWS Lambda: Scheduled Functions

Creates two Lambda functions which are triggered every day.
One function is triggered using a CRON syntax whereas the other one is using a more human friendly syntax.
Take a look at [this documentation page](http://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html) where both syntax rules are explained in detail.
Can be useful for scheduled tasks like checking a website or doing some regular stuff.

## Quick Start

Run:

    export LAMBDA_BUCKET=<your-lambda-bucket> && ./deploy.sh
