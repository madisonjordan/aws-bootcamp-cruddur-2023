# Week 3 — Decentralized Authentication

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)

#### Weekly Outcome


---

## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->


#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->



---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->


#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->


---

## Required Homework  

### Create Cognito User Pool 

required attributes:k
- email

additional attributes:
- name
- preferred_username

### Manually Add User from Cognito User Pool

force confirm user and set permanent password:
```
aws cognito-idp \
admin-set-user-password \
--user-pool-id <user_pool_id> \
--username 232186d6-b9ff-42f7-8d1b-389f36c1a646 \
--password VYEwG2LPPZga$ \
--permanent
```
