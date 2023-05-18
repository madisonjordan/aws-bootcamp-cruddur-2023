# Week 6 — Deploying Containers

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)

#### Weekly Outcome
- Being able to push and tag container images to remote repository 
- Practical knowledge of deploying, configuring and updating a serverless container
- Basic knowledge of working with a cloud CLI


---

## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->
This week was okay. I didn't have any trouble with the bash scripts. I changed them to be more modular so I didn't have to use seperate utility scripts for frontend and backend.


#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->

I had a problem in Gitpod where the frontend and backend ports upon a docker-compose would be stuck on "detecting." 
I attempted to use an earlier gitpod workspace image, but the issue persisted. I looked at the Gitpod docs on ports [here](https://www.gitpod.io/docs/references/gitpod-cli#ports) and ran the command `gp ports list`. It showed the frontend and backend ports listed as "open on localhost" instead of "open (public)". 
I used a command to open the preview url `gp preview $(gp url 3000) --external`, as shown in the Gitpod docs [here](https://www.gitpod.io/docs/references/gitpod-cli#preview), and was able to continue with development. 

---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
- It's better to use the ECR for pulling images than DockerHub when launching services from a container registry.


#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->
Q. Why does X-Ray need to be on both services?

---

## Required Homework  

### ECR Repo
I created a repo for cruddur-python, but I didn't want to add my account id in the commited dockerfile and I was concerned about having to maintain that container myself to periodically update security vulnerabilities since the last pushed tag.

Instead, I used the [Docker's official images in the public registry on ECR](https://gallery.ecr.aws/docker/).
It appeared to build correctly and work with the health-check. 

I still created and pushed the private repo for backend-flask. 

### Deploy Services on Cruddur ECS Cluster
<img width="1001" alt="Backend Container Deployed on ECS" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/685bbf83-f228-4429-b80d-fa0b2074223b">

### Configure Application Load Balancer

<img width="1001" alt="Configured ALB for Cruddur" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/4d42a2a6-3367-4c86-915e-f3d2d68a7659">
<img width="1001" alt="ALB Target Groups" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/d90f5227-d342-4faf-b384-d89e1ee1acda">

<img width="785" alt="Connected through ALB" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/23143cea-8c8c-484b-ab66-4b700aea9eec">

### Configure Task Definitions for X-Ray

<img width="1020" alt="Backend Service with X-Ray Task" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/c3820ae9-422c-4751-8440-8e247900b96e">

<img width="1020" alt="Frontend Service with X-Ray Task" src="https://github.com/madisonjordan/aws-bootcamp-cruddur-2023/assets/22087300/398f7732-2ef4-44d0-a435-b7dd1c9847ee">

