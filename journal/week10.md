# Week 10 & 11 — CloudFormation

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)

#### Weekly Outcome
Week 10
- 

Week 11
- 

---
## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->


#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->

I had a lot of difficulty deleting the ALB and the ALB Security Group from CloudFormation due to the tight coupling of the cluster stack with the networking one's subnets. The network interfaces were in use. I had to wait for the deletion to finally fail then manually delete the ALB. After it was deleted I had to wait for the interfaces to go from "in use" to available. 

---
## Knowledge Transfer

### CloudFormation Syntax
In CloudFormation templates:

YAML compiles down to JSON so,

```yaml
VPC: 
# ...

IGW:
  Type: AWS::EC2::InternetGateway
  Properties:
    VpcId:
      Ref: VPC
```

is equivalent to

```json
VPC: 
# ...

IGW:
  Type: AWS::EC2::InternetGateway
  Properties: {VpcId: {Ref: "VPC"}}
```

### Functions

You can also use CloudFormation's various functions to reference previously defined resources using `Ref`, `GetAtt`, etc
```
VPC: 
# ...

IGW:
  Type: AWS::EC2::InternetGateway
  Properties:
    Tags:
      - Key: Name
        Value: CruddurVPC

AttachIGW:
  Type: AWS::EC2::VPCGatewayAttachment
  Properties:
    VpcId:
    # Get ID from VPC 
      Ref: VPC
    # Get ID of previously defined Resource "IGW" using CloudFormation function `!Ref`
    InternetGatewayId: !Ref IGW
```
### Converting Manually Deployed Services

service-backend-flask.json
```
  "serviceConnectConfiguration": {
    "enabled": true,
    "namespace": "cruddur",
    "services": [
      {
        "portName": "backend-flask",
        "discoveryName": "backend-flask",
        "clientAliases": [{"port": 4567}]
      }
    ]
  }
```

```
ServiceConnectConfiguration:
  Enabled: true
  Namespace: "cruddur"
  # TODO - If you want to log
  # LogConfiguration
  Services:
    - DiscoveryName: backend-flask
      PortName: backend-flask
      ClientAliases:
        - Port: !Ref ContainerPort
```

#### Key Takeaways
<!-- Key takeaways for this week -->
- Check your Network ACLs have outbound routes if you're having issues
- Update Behavior, Modification vs Replacement, in CloudFormation causes a lot of unexpected issues
- Logical Names for resources have a length limit, so try to keep them short including when using `!Sub` to change them
- Dependencies of resources such as networking security groups makes it difficult to reduce coupling in CloudFormation

#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->

---

## Required Homework  


### Deploy CloudFormation 

#### Cluster
Delete previously manually configured:
- ALB (under EC2)
- Target Groups (under EC2)
- ECS cluster 'cruddur' and its services
- Cloud Map namespace 'cruddur'

#### RDS

After Deployment:
- update connection url var in parameter store

#### Service
Delete previously manually configured:
- IAM Role: CruddurServiceExecutionRole

Note: Health check fails if database is not on the same VPC

Configure:
- add load balancer `dualstack.CrdClusterALB` to Route53 "A" records, `api.domain` and `domain`

Fixes:
- HealthCheckPort in cluster template should be set to 4567, not 80. 

Port for health check wasn't updating in target group after update to changeset, so I deleted all the stacks. 

### DynamoDB

Delete previously manually configured:
- log group: `/aws/lambda/cruddur-messaging-stream`

```
sam build \
--use-container \
--config-file $CONFIG_PATH \
--template $TEMPLATE_PATH \
--base-dir $LAMBDA_DIR
```

Note:
- `--base-dir` is where the sam command is executed, so in the `template.yaml`, the `CodeUri` is a folder relative to this path
- e.g.) for the folder `./aws/lambdas/cruddur-messaging-stream` in the workspace:
    - `--base-dir` `$ABS_PATH/aws/lambdas/`
    - `CodeUri: cruddur-messaging-stream`

### CICD

after deployment:
- codepipeline > settings > "pending connection" > update connection

### Frontend

Delete previously manually configured:
- Route 53 > Hosted Zone > delete `A` Record for `kapingkaping.cloud`

After deployment:
- build static site
- upload `build/` contents into `kapingkaping.cloud` S3 bucket
  - make sure the `static/` sub-directory is uploaded in addition to the files
