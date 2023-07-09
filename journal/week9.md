# Week 9 — CI/CD with CodePipeline, CodeBuild and CodeDeploy

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)

#### Weekly Outcome
- Configuring and running a build server to bake container images and push to private repo
- Configure deployment controller for server containers
- Implement Continuous Deployment for backend and frontend applications


---
## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->
I think I'm getting better and reading the logs and creating policies to have the proper permissions. Debugging the permission errors in the CodeBuild failures didn't take as long as it has for me in previous weeks.


#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->

---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
- Using a VPC and the private subnets in CodeBuild can cause issues if it cannot access outside to pull the code.


#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->

---

## Required Homework  


### Configure Build Action in CodeBuild
I added my AWS Account ID as a variable in parameter store. I had to add a policy to read from parameter store `ssm:GetParameters` as described in the [buildspec docs](https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html).

As described in the [CodeBuild sample docker docs](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html), the other policies I had to add were:
```
"ecr:BatchCheckLayerAvailability",
"ecr:CompleteLayerUpload",
"ecr:GetAuthorizationToken",
"ecr:InitiateLayerUpload",
"ecr:PutImage",
"ecr:UploadLayerPart"
```

### Configure CodePipeline

The build stage deployed twice so I had to remove the optional webhook from the CodeBuild project we configured in isolate. 
