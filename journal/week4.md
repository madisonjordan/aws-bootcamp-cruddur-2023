# Week 4 — Postgres and RDS

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)

#### Weekly Outcome
- Be able to data model using 3rd normal forms
- Practical working knowledge of utilizing a Postgres database
- Basic knowledge of working with an Online Analytical Processing (OLAP)

---

## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->
I really liked using the [coloring for the terminal print statements](https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux). I'm going to use that in the future for readability.
Postgres wasn't that different from what I remember using sqlite, so the concepts weren't that difficult for me. 

#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->
Connecting to the RDS was somewhat challenging, but I figured it out quickly enough. I wasn't able to connect at first because I didn't create the inbound security group rule for postgres. 


---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
Creating a Database:
- explicitly set both the character set and the timezone


#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->
Q. How do SQL injections work and how do sanitized SQL statements help?

---

## Required Homework  

Added [precompiled psycopg2 lambda layer](https://github.com/jetbridge/psycopg2-lambda-layer) for my region.

```
arn:aws:lambda:us-west-2:898466741470:layer:psycopg2-py38:1
```

### Connect to RDS
<img width="740" alt="Connection from Gitpod to RDS" src="https://user-images.githubusercontent.com/22087300/227080900-be26f52a-8d3b-4bd1-9ece-593c1fd370e9.png">

### Register Cognito User Into Database
<img width="511" alt="User in Postgres Database" src="https://user-images.githubusercontent.com/22087300/227080404-09833ebc-ccdc-4424-9c25-88772adb1c61.png">

### Create Activity 
<img width="971" alt="New User Activity" src="https://user-images.githubusercontent.com/22087300/227080318-da4008d3-dc66-4f04-bd4b-17be1d3d9713.png">
