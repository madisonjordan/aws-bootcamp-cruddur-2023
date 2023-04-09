# Week 5 — DynamoDB and Serverless Caching

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
This week I was ready to throw my computer out the window getting the dynamodb seed to run properly through the local postgres connection. In a final attempt after trying several things on stackoverflow, I decided to change localhost to 127.0.0.1 in the postgres connection url and it worked. I can't say I'm happy about it, but at least it works now. 


<img width="854" alt="dynamodb seed error in postgres" src="https://user-images.githubusercontent.com/22087300/229407466-39edb6eb-7797-4a4a-8bcb-96995693d6bf.png">
<img width="951" alt="dynamodb seed working after postgres url change" src="https://user-images.githubusercontent.com/22087300/229407478-9ed35b46-8060-4ae4-9c91-c359c7779d47.png">

I couldn't get my backend to find the `boto3` module without running `pip install -r requirements.txt` from the development environment first. But it showed up as installing in the build logs in docker compose. I searched through stackoverflow to see if I had done it incorrectly and tried to install the requirements using the `--user` flag and also specifying python3 / pip3. It didn't work so I was starting to look into using Poetry `pyproject.toml`  for managing dependencies in the multi-stage build. 
After a couple hours I decided that I should take the L and just manually run `pip install -r requirements.txt` from the development environment every time until I learn more about building python docker images and have more time. I should probably focus on the actual content of the course, but the dependency management offered by Poetry looks interesting and I've seen it elsewhere, so I'll have to look more into that later.

Another problem I had was having new messages add to the existing message group. It would throw no errors because it was posting to a new message group. Changing the seed data so the seeded messages were from the past instead of showing up as a created at date in the future (incorrect timestamps) fixed the issue.

Also the token expiring for my user made it a bit difficult when I thought something wasn't working, but it was. I have to more carefully read the backend logs to find the line if the token had expired. 


---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->


#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->

---

## Required Homework  
