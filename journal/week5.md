# Week 5 — DynamoDB and Serverless Caching

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)

#### Weekly Outcome
- Be able to data model using single table design
- Basic knowledge of working with a cloud SDK
- Basic implementation of read-aside cache in front of a database
- Interact with a production NoSQL database
- Basic knowledge of working with an OLTP

---

## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->
I thought the content about DynamoDB was really interesting. I enjoyed the concepts and learning about how to do data modelling for dynamodb. There's so much to information there that I'm not really sure how to summarize it, but I think I understand the basics. 

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
- The primary key can be a single or composite key. The composite key is formed of a partition key (pk) and a sort key (sk). 
- The items within the PK/SK don't have to follow the same data format/type as the other items in their field. Such as strings, uuids, numbers, etc. e.g) you can store message group ids '`GRP#message_group_uuid`' and message ids '`MSG#message_uuid`' in the partition key.   
- Local Secondary Indexes must be created at the time of database creation.  
- It's important to know what data you are accessing and how you want it returned before implementing patterns and tables in Dynamodb.
- Consider which data will be accessed most frequently when designing your data model.
- Sometimes storing json in a field in a NoSQL database and accessing that is faster than building that data from a query.


#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->
Q. What is a transaction in DynamoDB?

---

## Required Homework  

### Listing Messages in a Message Group
<img width="895" alt="Local - List Messages from Message Group" src="https://user-images.githubusercontent.com/22087300/230806091-dbe42794-797c-4974-a253-23ca1c2f3f23.png">


### Creating New Messages to add to a New Message Group

local:

<img width="895" alt="Local - New Message" src="https://user-images.githubusercontent.com/22087300/230805919-7636c2f0-9d52-4542-bd39-9968526ab3ad.png">

production with DynamoDB streams:

<img width="895" alt="Producation - New Message" src="https://user-images.githubusercontent.com/22087300/230805956-47c0ed2a-f08a-4fb4-b2be-f3cf1514ef77.png">

