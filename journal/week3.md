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

required attributes:
- username
- email

additional attributes:
- name
- preferred_username

### Manually Add User

force confirm user and set permanent password:
```
aws cognito-idp \
admin-set-user-password \
--user-pool-id us-west-2_YGbwJ7zfY \
--username juliasugarbaker \
--password r5hEZmw#$4#Y2YdC \
--permanent
```

_note: this will not work without `username` as a required attribute._
