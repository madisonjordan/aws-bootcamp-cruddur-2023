# Week 1 — App Containerization

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)
> - [Homework Challenges](#homework-challenges)

#### Weekly Outcome
- Gain practical knowledge working with common docker command and running container images for the purpose of local development
- Gain practical knowledge of working within a Cloud Development environment
- Be able to navigate a backend and front web-application and generally understand how they work 


---

## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->
 I definitely spent more time on the challenges for Docker than I had hoped to. I should have worked on the required homework more first. 


#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->



---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
- dynamodb-local emulates a database and is good for testing
- use docker-compose to use docker containers with shared environment variables, databases, and networks

#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->
> Q. Why are commands in docker specified as a list instead of a string?

&emsp; A.

> Q. What is the difference between using ENTRYPOINT and CMD in docker?

&emsp; A. CMD can be more easily overriden to use another command instead. 

---

## Required Homework 


Join Cruddur:

<img width="877" alt="Join Cruddur" src="https://user-images.githubusercontent.com/22087300/221727213-6d824075-71b7-435c-b4f6-d01da4310778.png">


Notifications Page:

<img width="877" alt="Notifications Page" src="https://user-images.githubusercontent.com/22087300/221727250-fee03bd0-5e90-45b0-b7ee-26b1fb5f00b5.png">


## Homework Challenges

### Run Docker Images on Local Machine

Installed Docker Desktop:

<img width="779" alt="Docker Desktop on Mac" src="https://user-images.githubusercontent.com/22087300/221375115-3eca61fd-262c-4c0c-9efe-b47cf19d5b70.png">

Built Docker Images: 

<img width="1040" alt="Docker Images on Local Machine" src="https://user-images.githubusercontent.com/22087300/221383386-a8d6d071-c15c-40b8-b18c-8c5265b4b91e.png">

### Pushing an Image to a Container Registry

Build image to push to `madisonjordan` account on Dockerhub:
```
docker build -t madisonjordan/crudder-backend:1.0.0 .
```

I then pushed the built image using the Docker Desktop application while logged in. Used instead of using the CLI commands for `docker login` and `docker push`. 

I just realized I spelled "cruddur" wrong for this version and later had to update the tag. 

```
docker tag cruddur-backend:1.0.0 madisonjordan/cruddur-backend:1.0.0 
```

<img width="877" alt="Correct Dockerhub Image name" src="https://user-images.githubusercontent.com/22087300/221389661-d49a7101-f000-4be5-8285-4513d180af18.png">



### Dockerfile Best Practices

- [X] Use multi-stage build
- [X] Reduce vulnerabilities in built image
- [X] Create non-root user in Dockerfile

Updating for the Dockerfile best practices so I could get the backend image to work while using a small base image with less vulnerabilities was harder than expected. I spent a few hours more than I had hoped to.

References:
- [TestDriven.io - Dockerfile Best Practices ](https://testdriven.io/blog/docker-best-practices/)
- [hackernoon - Create Lean Node.js image with Docker multi-stage build](https://medium.com/hackernoon/create-lean-node-js-image-with-docker-multi-stage-build-252e927cbf3e)


#### Multi-Stage Build

| Image | Original | New | 
| ------| ---------: | ----: |
| Frontend |   1.19 GB | 432.77 MB  |
| Backend |    129.48 MB  |  120.28 MB  |

Not a huge difference in the size of the backend final image when switching to Ubuntu:20.04 as the base image, but it was already pretty small to begin with. 

#### Vulnerability Scanning

scanning from docker CLI using Snyk
```
docker scan -f Dockerfile cruddur-backend:1.0.0     
```

| Image | Original | New |
| --- | ---| ---- |
|Frontend | <img width="842" alt="Original Frontend Dockerfile" src="https://user-images.githubusercontent.com/22087300/221383780-758c2429-8d81-42e1-ad0a-1203206ffd12.png"> | |
|Backend | <img width="842" alt="Original Backend Dockerfile" src="https://user-images.githubusercontent.com/22087300/221383768-d014f688-a5f0-41d0-8b49-05c0384afbfa.png"> | <img width="877" alt="Modified Backend Dockerfile" src="https://user-images.githubusercontent.com/22087300/221389059-5f96dbb8-57b1-437e-86d8-ac91d6cb20b9.png">|


I ran out of scans for the month and I don't want to sign up for Snyk right now.  
