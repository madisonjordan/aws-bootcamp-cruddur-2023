# Week 2 — Distributed Tracing

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)

#### Weekly Outcome
- The fractional CTO has suggested that we implement distributed tracing first so because as we begin to add cloud services it will become difficult to pinpoint issue and we want to keep pace with the (probably unrealistic) development timeline

---

## Weekly Summary
<!--Summary Journal Entry-->


#### Reflection
<!--Thoughts/Feelings so far.-->
I think Rollbar is really cool for it to show errors. Also this week I learned how important knowing how to debug by using devtools in the web browser and clicking the errors and checking the docker logs are. 


#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->
Had trouble hitting the backend `/api/activities/home` endpoint on port 4567 even though the data was showing up properly on 3000 on the website. I removed the dynamodb-local and postgres services from the docker-compose file and it was working, but it might have been a coincidence.  


---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
Tracing:
- In Honeycomb, the `OTLPSpanExporter()` function is responsible for parsing the configuration for where to send the send the spans used such as the Endpoint and Headers that contain the Honeycomb API key, which we have set as environment variables for it to parse instead of setting explicitly in the code.
   - In general, it might be better to explictly set your configuration in the code rather than have it read from the environment variables in case the environment variables are not set and will fail to provide your intended traces. 
- Better NOT to set a universal service name and have names for each service to see which service is not functioning as intended when data is sent. 

Docker:
- When using Docker containers in an enterprise setting, you often have a development image, which has all the tools you need for development in it (e.g. one based of Ubuntu for a full operating system), and a slimmer production image, which has only what is necessary and removes tools that you don't need that could make the image less secure (e.g. one based on alpine). They are optimized for different purposes. 

#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->
Q. What is middleware?<br>
A. It allows for filtering, post-processing, formatting, etc. of requests before they are passed to the application. 

---

## Required Homework 

### Configure Honeycomb

I had to look up how to remove the env variable we set for honeycomb service names before Jessica mentioned that we'd want separate service names to get more meaningful data than if all the services were named "Cruddur"

remove universally set honeycomb service name:
```
gp env -u HONEYCOMB_SERVICE_NAME
```
<br>

**Error:**

I was having another issue where my console honeycomb span was complaining that my Header wasn't set, but it turns out I had a typo in my env variable for my API key.

<img width="793" alt="Error Honeycomb Header" src="https://user-images.githubusercontent.com/22087300/223022012-5676530c-fefa-4b32-99fc-ce9031867fb3.png">

<br><br>

### Create a Span for Tracing on Honeycomb

<br>

Home Activites Mock Data Trace:

<img width="918" alt="mock data trace" src="https://user-images.githubusercontent.com/22087300/223268319-5df5b834-cb09-43de-9c5f-35813965e919.png">

### Create Queries on Honeycomb

<br>

Duration and 90th Percentile Heatmap Queries:

<img width="1313" alt="Duration and 90th Percentile Heatmap Queries" src="https://user-images.githubusercontent.com/22087300/223268758-bb9cc5e0-1557-42b0-88b7-cfc52249c8b5.png">

<br><br>

Mock Data Length Query:

<img width="1199" alt="Mock Data Length Query" src="https://user-images.githubusercontent.com/22087300/223268836-d4781969-e216-47fa-a55d-9c2fded4fe2d.png">

<br><br>

### Setup X-Ray

<br>

#### Finding the x-ray group dashboard

From CloudWatch:
1. Click "settings" on the left sidebar
2. Click the "traces" tab at the top
3. Under "X-Ray traces", click "view settings" under "groups"

<br>

#### Configure X-Ray

<br>

Create X-Ray Group:

```
 aws xray create-group --group-name "Cruddur"  --filter-expression "service(\"backend-flask\")"
```

<br>

Create Sampling Rule:
```
aws xray create-sampling-rule --cli-input-json file://aws/json/xray.json
```

<br><br>

#### Create Trace in X-Ray

<br>

X-Ray Daemon Log:

<img width="991" alt="X-Ray Daemon Log" src="https://user-images.githubusercontent.com/22087300/223820944-5097aa32-8ad3-4f00-b5ad-e784796feca4.png">

<br><br>

X-Ray Trace Dashboard:

<img width="1182" alt="X-Ray Trace Dashboard" src="https://user-images.githubusercontent.com/22087300/223863672-882b11cd-f8c2-45fe-95fe-a8ae5f764a11.png">

<br><br>

X-Ray Subsegment Trace:

<img width="1396" alt="X-Ray Subsegments" src="https://user-images.githubusercontent.com/22087300/223863562-6a2c58d3-69a6-4ab8-8f75-c6fe8a7770f3.png">

I changed the `dynamic_url` in the x-ray `configure` function in `app.py` so it would use the name "backend-flask" instead of the url with the port. Based on the [AWS documentation on configuring the global recorder](https://docs.aws.amazon.com/xray-sdk-for-python/latest/reference/configurations.html#segment-dynamic-naming) that shows that the `dynamic_url` is the name of the segment. This also allows the x-ray group to label the segments properly under the "Cruddur" group from the x-ray trace dashboard. 

<br><br>

### Configure CloudWatch Logging

<br>

Home Activities CloudWatch Log:

<img width="1142" alt="Home Activities CloudWatch Log" src="https://user-images.githubusercontent.com/22087300/223883200-c3cf1ee0-b2c8-4e54-816a-d16bb631f747.png">

### Configure Rollbar Error Logging


Rollbar Error Logs:

<img width="1368" alt="Rollbar Log" src="https://user-images.githubusercontent.com/22087300/223886923-df5b5965-bc94-497a-889d-fccc229e2281.png">

The previous two errors shown were from forgetting to comment out some X-Ray decorators and the middleware. Other than commenting that out, it worked the first time. 
