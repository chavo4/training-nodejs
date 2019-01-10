# Pillars of the AWS Well-Architected Framework

## Operational Excellence

- The ability to run and monitor systems.
- To continually improve supporting processes and procedures.

### Some Principles:

-  Perform operations as code
- Make frequent, small, reversible changes etc.

### Some Services:

- AWS CloudFormation / Terraform - to provision resources
-  Amazon CloudWatch - monitor the operational health and workload.

## Security

- Protect information, systems etc.
- Risk assessments and mitigation strategies

### Some Principles:

- Implement a strong identity foundation
-  Automate security best practices.
- Protect data in transit and at rest

### Some Services:

- Identity and Access Management (IAM) - control access to AWS services.
- AWS CloudTrail - records AWS API calls.
- Amazon CloudWatch - it is a monitoring service for AWS resources which can trigger CloudWatch Events to automate security responses.

## Reliability

- Ability to recover from infrastructure or service failures
- Dynamically acquire computing resources to meet demand
- Mitigate disruptions such as misconfigurations or transient network issues

### Some Principles:
- Test recovery procedures
- Stop guessing capacity
- Manage change in automation

### Some Services:
- Amazon CloudWatch - monitors runtime metrics.
- The areas of reliability:
a. Change Management - AWS CloudTrail records AWS API calls for your account and
b. Foundations - AWS IAM enables you to securely control access to AWS services.
c. Failure Management - AWS CloudFormation provides templates for the creation of AWS resources and provisions them in an orderly and predictable fashion and resources.

## Performance Efficiency

- The ability use computing resources efficiently to meet system requirements.
- Mintain efficiency as demand changes and technologies evolve.

### Some Principles:
- Go global in minutes -  deploy a system in multiple Regions around the world with just a few clicks in a minutes.
- Use serverless architectures - serverless architectures remove the need to run and maintain servers to carry out traditional compute activities.
- Experiment more often - With virtual and automatable resources, you can test different types of instances, storage, or configurations.

### Some Services:
- Compute - Auto Scaling is key to ensuring that you have enough instances to meet demand and maintain responsiveness.
- Monitoring - Amazon CloudWatch provides metrics, alarms, and notifications that you can integrate with your existing monitoring solution, and that you can use with AWS Lambda to trigger actions.

## Cost Optimization

1.  The ability to avoid or eliminate unneeded cost or suboptimal resources. 

### Some Principles:

- Stop guessing capacity needs
- Test systems at production scale
- Lower the risk of architecture change
- Automate to make architecture experimentation easier
### Some Services:

- AWS Cost Explorer -  view and track the resource usage in details, used it for Reserved Instance recommendations.
- Auto Scaling - It allows you to add or remove resources to match demand without overspending.
