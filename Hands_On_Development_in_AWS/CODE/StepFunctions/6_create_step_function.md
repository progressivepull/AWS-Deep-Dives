# Create Step Function

## Definition:  
```
{
  "Comment": "ADGU IOT Ingestion State Machine",
  "StartAt": "Lambda Invoke",
  "States": {
    "Lambda Invoke": {
      "Type": "Task",
      "Resource": "arn:aws:states:::lambda:invoke.waitForTaskToken",
      "OutputPath": "$.Payload",
      "Parameters": {
        "Payload": {
          "input.$": "$",
          "taskToken.$": "$$.Task.Token"
        },
        "FunctionName": "arn:aws:lambda:us-east-2:146868985163:function:ADGUIOT_Ingest:$LATEST"
      },
      "Retry": [
        {
          "ErrorEquals": [
            "Lambda.ServiceException",
            "Lambda.AWSLambdaException",
            "Lambda.SdkClientException",
            "Lambda.TooManyRequestsException"
          ],
          "IntervalSeconds": 2,
          "MaxAttempts": 6,
          "BackoffRate": 2
        }
      ],
      "Next": "Choice"
    },
    "Choice": {
      "Type": "Choice",
      "Choices": [
        {
          "Variable": "$.isVio",
          "BooleanEquals": true,
          "Next": "SNS Publish Violation"
        },
        {
          "Variable": "$.isError",
          "BooleanEquals": true,
          "Next": "SNS Publish Error"
        }
      ],
      "Default": "Success"
    },
    "SNS Publish Violation": {
      "Type": "Task",
      "Resource": "arn:aws:states:::sns:publish",
      "Parameters": {
        "Message.$": "$",
        "TopicArn": "arn:aws:sns:us-east-2:146868985163:adguiot_notify"
      },
      "End": true
    },
    "Success": {
      "Type": "Succeed"
    },
    "SNS Publish Error": {
      "Type": "Task",
      "Resource": "arn:aws:states:::sns:publish",
      "Parameters": {
        "TopicArn": "arn:aws:sns:us-east-2:146868985163:adguiot_notify",
        "Message": {
          "uuid.$": "$.uuid",
          "error.$": "$.error"
        }
      },
      "End": true
    }
  }
}
```


## Test Data
```
{"uuid":"123","tc":35,"rh":88}
{"uuid":"123","tc":24,"rh":44}
{"uuid":"123","tc":36,"rh":40}
{"uuid":"123","tc":22,"rh":88}
{"uuid":"3123","tc":22,"rh":88}

```
