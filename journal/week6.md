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


#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->

I had a problem in Gitpod where the frontend and backend ports upon a docker-compose would be stuck on "detecting." 
I attempted to use an earlier gitpod workspace image, but the issue persisted. I looked at the Gitpod docs on ports [here](https://www.gitpod.io/docs/references/gitpod-cli#ports) and ran the command `gp ports list`. It showed the frontend and backend ports listed as "open on localhost" instead of "open (public)". 
I used a command to open the preview url `gp preview $(gp url 3000) --external`, as shown in the Gitpod docs [here](https://www.gitpod.io/docs/references/gitpod-cli#preview), and was able to continue with development. 

---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->


#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->


---

## Required Homework  

### ECR Repo
I created a repo for cruddur-python, but I didn't want to add my account id in the commited dockerfile and I was concerned about having to maintain that container myself to periodically update security vulnerabilities since the last pushed tag.

Instead, I used the [Docker's official images in the public registry on ECR](https://gallery.ecr.aws/docker/).
It appeared to build correctly and work with the health-check. 

I still created and pushed the private repo for backend-flask. 
