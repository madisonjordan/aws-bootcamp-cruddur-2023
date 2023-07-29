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

---
## Knowledge Transfer

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





#### Key Takeaways
<!-- Key takeaways for this week -->
- Check your Network ACLs have outbound routes if you're having issues

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

#### Service
- IAM Role: CruddurServiceExecutionRole
