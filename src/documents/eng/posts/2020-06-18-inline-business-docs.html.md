---
name: Documenting business logic in your code
date: 2020-06-18T07:14:00+01:00
layout: post.jade
description: How to combine business documentation and code in a developer friendly way
tags:
- system design
- markdown
- documentation
---

Code documentation has always been a controversial topic. You've probably heard "Code is documentation" mantra, and I 80% agree with it. As long as this is just about the code, and just for the coders. This mantra quickly breaks when you have business logic in your code, which needs to be read and understood by, well, business.

A natural timeline of events might look something like this. A logic is designed and a JIRA ticket is created for implementation. While implementing it, a developer discovers a bunch of edge cases. Logic is refined accordingly and evolved to work flawlessly. Code is tested and deployed to production. A shiny set of unit tests provide an insight into how the logic is supposed to work.

6 months later a product manager tries to understand how the feature is functioning. Remember, it's been in production for a while now. The original spec was never updated, and the only place where business logic is described is code itself. A PM needs to have a deep understanding of the current state of things, however, they can't read code. In some instances, they might not even have access to Github.

At this point, a current developer is asked to document the logic in Confluence. A new shiny page is created where behaviour is described and all is well for now. At least for the next few months.

Engineers are a lazy bunch. We like to do things once and let computers do the rest. Doing documentation feels like doing the same job twice - and in many cases it is. First, you tell a computer what to do, then you explain to a human what you just said to a computer. Can these two things somehow be combined? Well, here's my best shot.

Let's imagine we have a web service for buying cinema tickets.

```
/**
* # Cinema Tickets Service
* ## Buying tickets
* 
* A successful booking will be made of charging a credit card
* and booking seats. If any of that fails, we skip sending
* email confirmation and refund a possibly successful charge.
*/
const buyTickets = (customerData: Customer) => {
  Promise.all([
    chargeCreditCard(),
    bookSeats(),
  ])
  .then(results => sendConfirmation())
  .catch(error => report(error));
}

```

This looks sort of like jsdoc, but instead of describing input arguments of a given function here, we have a human-readable documentation of the business logic. In markdown.

Since we can't have code as documentation, here's the next best thing - having documentation next to the actual code. This way it can be written and updated as part of the same PR changing the code. It will also help a new dev on the team to understand the _context_ of the code. This is not about the _what_ this code is doing - it is about _why_ this code is doing what it's doing.

![](https://alexsavin.me/photos/2020-06-18-vscode-markdown.png)

A nice perk of VSCode is that it will render markdown into a human-looking rich text when you are going to use this function elsewhere.

Sharing context is an undervalued problem - many things are assumed as obvious - generally by people gained context while spending years in a given company or a project.

In the next part of this series, we are going to talk about how to generate documentation from the blocks of markdown comments scattered around the codebase. Stay tuned!