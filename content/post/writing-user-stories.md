+++
date = "2013-07-01"
title = "Write user stories"
description = "Write good user stories"
categories = ["bdd"]
keywords = ["bdd", "user stories"]
+++

# Story always involve a User/Customer

A story is associated to a clearly defined user/customer. If not, maybe this
feature will benefit nobody and should not be implemented

Before writing stories, we can define
[personas](http://www.romanpichler.com/blog/agile-product-innovation/persona-template-for-agile-product-management/).
that will represent our customers. Then we connect each story to the right
persona.

# Level of details

It's hard to get stories's details correcly. A story should not be too vague and
shoud not prescribe the solution because of too much details (should answer
*what* and not *how*).

Steps to define details:

- Start new features with **[epics](http://www.romanpichler.com/blog/user-stories/epics-and-ready-stories/)**:
coarse-grained stories. **Epics** capture an idea.
- Split epic into more detailed user stories.
- When picking stories for a sprint, these stories should be **[ready stories](http://www.romanpichler.com/blog/user-stories/epics-and-ready-stories/)** that are clear, feasible and testable.

Iteratively refining stories keeps your backlog concise which will help you add
new insights.

# Involve the team

The team should be involved in writing story details in order to get them ready
for the next sprint.

# Acceptance and testing

Every story should contain **[acceptance criteria](http://www.romanpichler.com/blog/user-stories/agile-nonfunctional-requirements/)**
that will describe the conditions needed to validate a story. The criteria
make it more precise and testable.

Example:

    As a conference attendee
    I want to be able to register online
    In order to register quickly
    And cut down on paperwork

For the above example, the acceptance criteria could include:

 - A user cannot submit a form without completing all the mandatory fields
 - Information from the form is stored in the registrations database
 - Protection against spam is working
 - Payment can be made via credit card
 - An acknowledgment email is sent to the user after submitting the form.


**Epics** do not need acceptance criteria but **ready stories** should. Defining
acceptance criteria with the team during scrums will help them understand the
feature from the user's point of view/perspective.

### Note

I write this post after reading this [article](http://java.dzone.com/articles/5-common-user-story-mistakes) from [Roman Pichler](http://www.romanpichler.com/blog/).
