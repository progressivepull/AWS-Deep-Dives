const cdk = require('aws-cdk-lib');
const s3 = require('aws-cdk-lib/aws-s3');
const sqs = require('aws-cdk-lib/aws-sqs');


//S3
//https://docs.aws.amazon.com/cdk/api/v2/docs/aws-cdk-lib.aws_s3.Bucket.html
//SQS:
//https://docs.aws.amazon.com/cdk/api/v2/docs/aws-cdk-lib.aws_sqs.Queue.html
//Duration:
//https://docs.aws.amazon.com/cdk/api/v2/docs/aws-cdk-lib.Duration.html

class CdkDemoStack extends cdk.Stack {
  constructor(scope, id, props) {
    super(scope, id, props);

    const adguBucket = new s3.Bucket(this, 'adgucdkbucket', {
      versioned: false,
      bucketName: "adgucdkbucket"
    });

    const adguQueue = new sqs.Queue(this, 'adgucdkqueue', {
      deliveryDelay: cdk.Duration.seconds(15),
      queueName: "adgucdkqueue"
    });

  }
}

module.exports = { CdkDemoStack }
