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

I then pushed the built image using the Docker Desktop application while logged in instead of using the cli commands for `docker login` and `docker push`. 


Dockerhub:

<img width="680" alt="Image pushed on Dockerhub" src="https://user-images.githubusercontent.com/22087300/221384977-e7d802c9-d4ca-433e-bf68-9848f4d0304c.png">


### Multi-Stage Build

| Image | Original | New | 
| ------| ---------: | ----: |
| Frontend |   1.19 GB |   |
| Backend |    129.48 MB  |     |

### Vulnerability Scanning

| Image | Original | New |
| --- | ---| ---- |
|Frontend | <img width="842" alt="Screenshot 2023-02-25 at 3 08 00 PM" src="https://user-images.githubusercontent.com/22087300/221383780-758c2429-8d81-42e1-ad0a-1203206ffd12.png"> | |
|Backend | <img width="842" alt="Screenshot 2023-02-25 at 3 08 25 PM" src="https://user-images.githubusercontent.com/22087300/221383768-d014f688-a5f0-41d0-8b49-05c0384afbfa.png"> |



