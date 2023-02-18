# Week 0 — Billing and Architecture

>__Quick Links__
> - [Weekly Summary](#weekly-summary)
> - [Key Takeaways](#key-takeaways)
> - [Required Homework](#required-homework)
>    - [Use Cloudshell](#use-cloudshell)
>    - [Install AWS CLI](#install-aws-cli)
>    - [Create Budget](#create-budget-and-billing-alarm)
>    - [Create Billing Alarm](#create-budget-and-billing-alarm)
>    - [Conceptual Design](#conceptual-design)
>    - [Logical Design](#logical-design)

#### Weekly Outcome
- Gain confidence when working meter-billing with a Cloud Service Provider (CSP)
- To understand how to build useful architecture diagrams
- To gain a general idea of the cost of common cloud services
- To ensure we have a working AWS account

---

## Weekly Summary
<!--Summary Journal Entry-->
- Read outline
- Organized course on Notion for tracking

#### Reflection
<!--Thoughts/Feelings so far.-->
I feel a bit anxious about starting the course and figuring out what to do first, but setting up my tasks and the calendar on Notion has helped feel like it's more manageable. I feel the content is within my abilities and I'll have to let go of my perfectionism and do my best. I think I know enough to get started with everything despite not being an expert in all of the concepts. 
I don't want to spend excessive amounts of time working on prequisites out of fear that I won't be able to succeed if I don't know everything. I'm hoping to become more flexible in that respect and make an attempt to see if tasks are within my abilities and discovering what further information I will need to succeed if not. 

I successfully redeemed the AWS credit voucher from the student portal, so I'm pretty pleased with myself. 

#### Challenges
<!-- Challenges you've had this week in completing your tasks. How you might solve them or what you did to solve them. -->
I was slightly concerned about the spending but the costs were broken down really well in the docs and I also successfully added a prepaid gift card to my AWS account for billing.


#### Next Steps
TBD

---
## Knowledge Transfer

#### Key Takeaways
<!-- Key takeaways for this week -->
- Understand the business concerns before deciding on technical solutions
   - requirements, risks, assumptions, constraints
   - "Iron Triangle" - (pick 2) fast, good, or cheap
- Be able to communicate across teams and stakeholders
   - have a "common dictionary". see TOGAF and AWS Well-Architectured Tool Framework
   - documentation to be able to communicate key features to laymen
   - architectural diagrams help communicate with almost anyone  
- Setup billing alarms and budget in AWS

#### Questions
<!-- Questions on the materials or concepts with their answers, if available.-->
Q. What is the difference between the different architectural designs? e.g. conceptual, logical, physical

---

## Required Homework 

## AWS

### Use CloudShell

At first I had trouble figuring out how to find the cloudshell for my region, but then I went back in the video and it said that the console doesn't appear for every region. Apparently us-west-1 doesn't have one, but us-west-2 does. Also I couldn't change the region while I was on the billing page. 

us-west-1:<br>
<img width="290" alt="AWS us-west-1 screenshot" src="https://user-images.githubusercontent.com/22087300/219837830-6cfedd8c-0c73-44e4-b81b-f686f8fd38b7.png">

us-west-2:<br>
<img width="290" alt="AWS us-west-2 screenshot" src="https://user-images.githubusercontent.com/22087300/219837720-d2907546-ebcc-492c-b5d0-bfde066ee3ec.png">


### AWS CLI

#### Install AWS CLI

I didn't have any issues generating the IAM or access key for AWS and installing the CLI by pasting the tasks into the `gitpod.yml` from the week0 branch instructions, which were very helpful. However, I did have minor issues with pushing the `gitpod.yml`, which I fixed through changing the public repo permissions for the GitHub integration. After that, it gave another error when I pushed my changes (which I don't recall what it said), but I checked my repo on GitHub and it seemed to push fine anyway. When I started it up, it automatically ran all the commands defined in the tasks within the yaml that I had commited.

While I was watching the video I forgot to put the environment variable for the secrets and was stuck for a minute on being able to figure out how to relaunch gitpod since it didn't close the workspace (it complained that the workspace was still open and I didn't want to launch a 2nd one) after I used the `gp env` command and closed the tab. I figured it out from somewhere in the menu where it said "stop workspace." It was fine after that and gave the expected response from the `aws sts get-caller-identity` command. 

<img width="590" alt="Screenshot 2023-02-17 at 8 32 50 PM" src="https://user-images.githubusercontent.com/22087300/219834854-ea7bb764-ea27-4414-bced-c6bb59f2b92a.png">

#### Create Budget and Billing Alarm

I thought it how you could still create a billing alarm from the AWS CLI since from the AWS website, you have to be in N Virgina (us-east-1) to create billing. Or that's what I thought. 

Creating the budget from the UI was much easier. 

I had to remember not to commit my TopicARN and email since I saw everyone was having issues with that. 

<img width="279" alt="Screenshot 2023-02-18 at 6 53 18 AM" src="https://user-images.githubusercontent.com/22087300/219874761-e431dc0a-3d59-4fe2-8bf2-62c861c34b36.png">
<img width="789" alt="Screenshot 2023-02-18 at 6 58 24 AM" src="https://user-images.githubusercontent.com/22087300/219874794-31788397-6016-4b0c-90bf-3dbc78d19419.png">
<img width="545" alt="Screenshot 2023-02-18 at 6 59 02 AM" src="https://user-images.githubusercontent.com/22087300/219874808-bbad514d-ba7c-4934-b8bd-77c4942a0b38.png">
<img width="800" alt="Screenshot 2023-02-18 at 7 33 09 AM" src="https://user-images.githubusercontent.com/22087300/219874873-1d694d52-223d-4ec4-b0c3-7b5064ce2cfd.png">


### Conceptual Design

![cruddur conceptual diagram](/journal/assets/cruddur_conceptual_diagram.svg)

[lucidchart link](https://lucid.app/lucidchart/e62e6674-d758-4eed-a5be-3e7a600d8e61/edit?viewport_loc=-545%2C-100%2C1871%2C800%2C0_0&invitationId=inv_4c1d8683-a850-401f-a5c7-09f72ddaaf50)


### Logical Design
I did the napkin for the wrong one but I spent so long on it that I'm just going to put it here anyway. 

Apparently I don't understand the difference between the conceptual design and logical design otherwise I would have noticed much earlier that the video was for the logical one and the instructions said to do the napkin for the conceptual one. 

![cruddur logical diagram - napkin](/journal/assets/cruddur_logical_diagram-napkin.jpg)

![cruddur logical diagram](/journal/assets/cruddur_logical_diagram.png)

[lucidchart link](https://lucid.app/lucidchart/2100e5e2-157b-4ccf-a314-8f4d9d5f369c/edit?viewport_loc=228%2C219%2C1579%2C835%2C0_0&invitationId=inv_e5abeba3-1738-4591-bc58-338c71636f34)

