# Week 2 — Distributed Tracing

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
Had trouble hitting the backend `/api/activities/home` endpoint on port 4567 even though the data was showing up properly on 3000 on the website. I removed the dynamodb-local and postgres services from the docker-compose file and it was working, but it might have been a coincidence.  


---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
Honeycomb:
- In Honeycomb, the `OTLPSpanExporter()` function is responsible for parsing the configuration for where to send the send the spans used such as the Endpoint and Headers that contain the Honeycomb API key, which we have set as environment variables for it to parse instead of setting explicitly in the code. 
- Better NOT to set a universal service name for Honeycomb and have names for each service to see which service is not functioning as intended when data is sent. 

Docker:
- When using Docker containers in an enterprise setting, you often have a development image, which has all the tools you need for development in it (e.g. one based of Ubuntu for a full operating system), and a slimmer production image, which has only what is necessary and removes tools that you don't need that could make the image less secure (e.g. one based on alpine). They are optimized for different purposes. 

#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->


---

## Required Homework 

### Setup Honeycomb

I had to look up how to remove the env variable we set for honeycomb service names before Jessica mentioned that we'd want separate service names to get more meaningful data than if all the services were named "Cruddur"

remove universally set honeycomb service name:
```
gp env -u HONEYCOMB_SERVICE_NAME
```


**Error:**

I was having another issue where my console honeycomb span was complaining that my Header wasn't set, but it turns out I had a typo in my env variable for my API key.

<img width="793" alt="Error Honeycomb Header" src="https://user-images.githubusercontent.com/22087300/223022012-5676530c-fefa-4b32-99fc-ce9031867fb3.png">



**Home Activites Mock Data Trace:**

<img width="918" alt="mock data trace" src="https://user-images.githubusercontent.com/22087300/223268319-5df5b834-cb09-43de-9c5f-35813965e919.png">


**Duration and 90th Percentile Heatmap Queries:**

<img width="1313" alt="Duration and 90th Percentile Heatmap Queries" src="https://user-images.githubusercontent.com/22087300/223268758-bb9cc5e0-1557-42b0-88b7-cfc52249c8b5.png">


**Mock Data Length Query:**

<img width="1199" alt="Mock Data Length Query" src="https://user-images.githubusercontent.com/22087300/223268836-d4781969-e216-47fa-a55d-9c2fded4fe2d.png">

