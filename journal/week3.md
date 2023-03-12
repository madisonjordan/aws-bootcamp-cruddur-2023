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
Getting the signin page and confirm the user pool so I could get past the "incorrect username and password" / "user not authenticated" was a very frustrating experience. I think I recreated the user pool 3 times before I got it. 

#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->
Debugging the cognito authentication was difficult, but once again going into developer tools and looking at the errors was mostly helpful. I hit a problem where my user was confirmed and the password was correct but still had an "not authenticated error" and later "exceeded password attempts" which was not fixed by deleting it and recreating a new user with the same username (when it was a required attribute) and email. I recreated the user pool again to remove the username as a required attribute so it would generate a unique user id as the username again and then it was fine.  


---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
Debugging:
 - In JavaScript, using `console.log()` can be useful to log values to the console in your docker image. For example `console.log('user', user)` to see what the status of the `user` object in your functions.
 - In Python, using `logger` can help show values in your app, such as `app.logger.info()` for `INFO` level logs or `app.logger.debug()` for `DEBUG` level logs. 

#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->


---

## Required Homework  

### Create Cognito User Pool 

required attributes:
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
<img width="1018" alt="Force Confirm User" src="https://user-images.githubusercontent.com/22087300/224421652-c84d359c-e102-4914-9e40-3a2c33ccdd82.png">

<img width="1108" alt="Signed in user" src="https://user-images.githubusercontent.com/22087300/224422057-0f2a12a5-7dce-4943-9c90-cf353b186da3.png">

manually updated name and preferred username:
<img width="1273" alt="Signed in user with preferred username and name atrributes" src="https://user-images.githubusercontent.com/22087300/224523375-d2143486-6acd-4201-8cc7-b598e7de1f3d.png">

reset password:
<img width="1027" alt="Successful password reset page" src="https://user-images.githubusercontent.com/22087300/224523413-6bd6a4a4-8b01-40ab-852c-f4152579bfd4.png">


