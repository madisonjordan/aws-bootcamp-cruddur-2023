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



#### Next Steps
TBD

---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->

#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->


---

## Required Homework 


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

Dockerhub:

<img width="680" alt="Image pushed on Dockerhub" src="https://user-images.githubusercontent.com/22087300/221384977-e7d802c9-d4ca-433e-bf68-9848f4d0304c.png">

### Dockerfile Best Practices

- [X] Use multi-stage build
- [X] Reduce vulnerabilities in built image
- [X] Create non-root user in Dockerfile

Updating for the Dockerfile best practices so I could get the backend image to work while using a small base image with less vulnerabilities was harder than expected. I spent a few hours more than I had hoped to.

References:
- [TestDriven.io - Dockerfile Best Practices ](https://testdriven.io/blog/docker-best-practices/)


#### Multi-Stage Build

| Image | Original | New | 
| ------| ---------: | ----: |
| Frontend |   1.19 GB |   |
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
