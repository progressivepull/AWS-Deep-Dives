**Demo Outline for Lesson 8.3: Cost Optimization with Auto Scaling and SageMaker Savings Plans**

----------

**Objective:**

This demo will teach students how to optimize costs when running SageMaker workloads using **Auto Scaling** and **SageMaker Savings Plans**. Students will learn how to set up auto scaling for real-time endpoints and understand the cost-saving benefits of committing to SageMaker Savings Plans.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   A deployed SageMaker endpoint from previous lessons
-   Basic understanding of SageMaker workloads (real-time inference and training jobs)

**Tools and Resources:**

-   SageMaker Auto Scaling
-   SageMaker Savings Plans
-   Amazon CloudWatch for monitoring

----------

**2. Step-by-Step Demonstration**

----------

**Part 1: Setting Up Auto Scaling for Real-Time Endpoints**

----------

**Step 1: Introduction to Auto Scaling**

[https://docs.aws.amazon.com/sagemaker/latest/dg/endpoint-auto-scaling-policy.html](https://docs.aws.amazon.com/sagemaker/latest/dg/endpoint-auto-scaling-policy.html)


1.  **What is Auto Scaling in SageMaker?**

-   Automatically adjusts the number of instances running behind an endpoint based on traffic or other metrics.

2.  **Why use Auto Scaling?**

-   Scale up during peak demand and scale down during idle times to save costs.
-   Ensure high availability without over-provisioning.

3.  **Key metrics for scaling:**

-   Invocation count
-   Model latency
-   CPU utilization

----------

**Step 2: Configure Auto Scaling Policy**

1.  **Identify the SageMaker endpoint:** Ensure you have a real-time endpoint deployed (e.g., purchase-prediction-endpoint).
2.  **Define scaling metrics and policies:**

-   Use Amazon CloudWatch metrics to trigger scaling.

3.  **Python code example to enable auto scaling:**

```
import boto3

# Create an auto-scaling client
autoscaling = boto3.client('application-autoscaling')
# Register the SageMaker endpoint
response = autoscaling.register_scalable_target(
  ServiceNamespace='sagemaker',
  ResourceId='endpoint/purchase-prediction-endpoint/variant/AllTraffic',
  ScalableDimension='sagemaker:variant:DesiredInstanceCount',
  MinCapacity=1,
  MaxCapacity=5
)

print("Auto scaling target registered:", response)
```

----------

**Step 3: Create a Scaling Policy**

1.  **Set a target tracking policy** to scale the number of instances based on a target metric, such as InvocationsPerInstance.
2.  **Example scaling policy:**

```
response = autoscaling.put_scaling_policy(
  PolicyName='InvocationScalingPolicy',
  ServiceNamespace='sagemaker',
  ResourceId='endpoint/purchase-prediction-endpoint/variant/AllTraffic',
  ScalableDimension='sagemaker:variant:DesiredInstanceCount',
  PolicyType='TargetTrackingScaling',
  TargetTrackingScalingPolicyConfiguration={
    'TargetValue': 50.0,  # Target invocations per instance
    'PredefinedMetricSpecification': {
      'PredefinedMetricType': 'SageMakerVariantInvocationsPerInstance'
    },
    'ScaleInCooldown': 60,
    'ScaleOutCooldown': 60
  }
)

print("Scaling policy created:", response)
```

3.  **Verify the scaling configuration:** Use **Amazon CloudWatch > Alarms** to monitor scaling events.

----------

**Step 4: Test Auto Scaling**

1.  Simulate high traffic by sending multiple requests to the endpoint:

```

import boto3
import json

# Initialize SageMaker runtime client
runtime = boto3.client('sagemaker-runtime')

# Simulate multiple invocations
for i in range(100):
  response = runtime.invoke_endpoint(
    EndpointName='purchase-prediction-endpoint',
    ContentType='application/json',
    Body=json.dumps({"features": [25, 50000, 2]})
  )

print(response['Body'].read().decode('utf-8'))
```

2.  Observe the scaling behavior using **Amazon CloudWatch > Metrics** to see the changes in instance count.

----------

**Step 5: Scale Down to Save Costs**

1.  After testing, reduce the traffic and observe the **scaling down of instances** to the minimum capacity.
2.  Discuss how this prevents over-provisioning and optimizes costs.

----------

**Part 2: Understanding SageMaker Savings Plans**

----------

**Step 1: Introduction to SageMaker Savings Plans**

1.  **What are SageMaker Savings Plans?**

-   A commitment-based discount program where you commit to a fixed usage of SageMaker instances for 1 or 3 years in exchange for lower rates.

3.  **Benefits of Savings Plans:**

-   Up to **64% cost savings** compared to on-demand pricing.
-   Flexibility to apply savings across multiple SageMaker services, including **training, endpoints, and processing jobs**.

5.  **Example Scenario:**

-   If you frequently run SageMaker training jobs or maintain real-time endpoints, committing to a Savings Plan can significantly reduce costs.

----------

**Step 2: View and Purchase a SageMaker Savings Plan**

1.  Navigate to **AWS Billing > Savings Plans** in the AWS Management Console.
2.  Select **SageMaker Savings Plans**.
3.  Choose a commitment option:

-   **1-year or 3-year plan**
-   Select a **monthly commitment amount** based on your projected SageMaker usage.

5.  Confirm and purchase the plan.

----------

**Step 3: Monitor Savings with AWS Cost Explorer**

1.  Use **AWS Cost Explorer** to track savings over time.
2.  Filter by the **SageMaker service** to see how much you’re saving on training jobs, endpoints, and other services.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   Auto scaling helps optimize costs by scaling SageMaker instances up or down based on real-time demand.
-   SageMaker Savings Plans provide long-term savings for committed usage.
-   Combining auto scaling with Savings Plans maximizes cost efficiency while ensuring scalability.

