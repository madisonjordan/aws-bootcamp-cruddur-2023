# Week 8 — Serverless Image Processing

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)

#### Weekly Outcome
- Basic knowledge of writing, deploying and logging serverless functions
- Basic knowledge of working with serverless object storage
- Basic knowledge of working with event-bus actions


## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->
This week was extremely difficult. Once again many of my issues were from old environment variables and incorrect policies. 


#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->
The lambdas were initially not triggering. I thought it might have been an issue with the ProfileForm.js, but it was an issue with the S3 bucket cors policy and an old gitpod origin in the lambda. The token was not valid and the upload would not start. I looked at the cloudwatch logs for both and attempted to correct the ambiguous errors about "nil class not being defined"/"authorization". I think this was an processing error on the JWT in the authorizer causing the downstream upload to fail.  

---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
- [AWS CDK API reference guide](https://docs.aws.amazon.com/cdk/api/v2/docs/aws-construct-library.html) for examples and usage
- Use the CloudFormation L2 constructs whenever possible
- CDK is built on top of CloudFormation and will show up in CloudFormation in the AWS Console
- You only have to cdk bootstrap once for an account for each region


#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->
Q. Is there any purpose to `cdk synth` other than checking the CloudFormation template before deploying? 

---

## Required Homework  


### Implement CDK Stack
<img width="1103" alt="Created CDK Stack" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/325446c8-91a7-4d0b-bd0d-129fc04f89aa">

From the `thumbing-serverless-cdk` directory:
```bash
npm install
cdk synth
cdk deploy
```

### Serve Avatars via CloudFront
<img width="1103" alt="Process Image Lambda" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/6113a024-cf03-4014-9c44-b5d0f6524366">

<img width="983" alt="Screenshot 2023-06-11 at 5 40 51 PM" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/a43a283d-35e7-4c78-bbe9-6f8b98f63b23">

### Implement Users Profile Page
<img width="983" alt="Profile Page with Bio" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/b8c5716f-c607-4b9a-aa97-7b31da5050b2">

Add `bio` column to database in a migration script:
`./bin/db/migrate`

### Presigned URL generation via Ruby Lambda

I added the route `/avatars/key_upload` to the API Gateway created under the name `api.kapingkaping.cloud` in the AWS console. I added the Lambda Authorize to this route. 

I had a lot of trouble getting the lambdas working for this week. It took awhile to figure out that I was missing the `https://` in my cors policy on my S3 bucket. I shouldn't watch the video from so far away next time. 

### HTTP API Gateway with Lambda Authorizer
I added `/{proxy+}` to the API Gateway as a route and added the authorizer as an "integration" on it. 

### Render Avatars in App via CloudFront
<img width="727" alt="Render User's Uploaded Avatar" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/03d18136-7d00-47fd-8616-a5fd3927fa78">

