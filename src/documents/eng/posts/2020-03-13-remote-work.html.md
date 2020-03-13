---
name: Remote Work
date: 2020-03-13T07:14:00+01:00
layout: post.jade
description: Building remote first culture in an office first company
tags:
- remote work
---

My current company - a UK energy startup - has always had this ongoing remote work mindset. I thought I'd share a thing or two how we made it work for us. 

In short - although we are mostly a traditional "work from office" company, for a software developer there's nothing that would stop you from being 100% productive while working remotely.

## Step 1: No meetings Wednesdays

This was a tiny idea that quickly became integrated into our culture. On Wednesdays we have no meetings. This also means you can from from anywhere. You can come and work from the office. You can fly to Budapest and work from there. Whatever works for you.

Most of our product teams are working from home on Wednesdays, and this has created an environment where we had to test and maintain our toolset and best practices. Our VPN has failed a couple of times, issues were addressed and now it is in a great shape and I haven't had a connectivity issue in ages.

## Step 2: VPN

As a fundamental security precaution, connectivity to business critical resources should be limited to the office network or a VPN. This means a reliable VPN setup, able to handle a load of every developer, QA and data scientist connected to it simultaneously. Load testing a VPN before going 100% remote is a great idea.

## Step 3: Culture

Work from home is not the same as remote work. This has been highlighted a few times now in HackerNews discussions. We are not really doing remote work, but more like enabling office type of work from any chosen location. This means most of the teams are starting work at 9am and finishing at 6pm. This means we don't do async work, but instead everyone are more or less synchronised even on WFH days.

This is not neccessarily a bad thing.

Synchronisity allows interoperability. It means you can easily switch between working in the office and working remotely at any given day, not just on Wednesdays. It allows pretty good flexibility in terms of when you need to work from home - you don't have to adjust your working patterns, everything mostly stays the same.

This means, there is no effect on your personal productivity. Things continue the usual way.

So yes, morning standups happen every day, everyone turns up - on site or online, and we plan together the new day ahead.

## Step 4: Meetings and informal catch ups

Slack and Google Hangouts are all the tools you need really. But you have to build a culture of using them in the most efficient way.

### Slack

Have a channel dedicated just to your immediate team. Encourage ongoing chat about who is doing what and if there are there any blockers. This is like a sound of an engine - you know it's working when there is rumbling going on.

An alternative would be to periodically ask everyone who is doing what right now. This is counter productive and can be perceived as annoying micro management.

### Hangouts

Every meeting should be available on Hangouts by default. Ideally, every meeting should also be recorded and available to view later, but there might be some privacy concerns there. At the very least, you should be able to join every meeting via a phone line.

Hangouts are pretty handy also when you want to have a quick informal catch up. Those are irreplaceble - and often are an argument for working from office. When everyone are in the office, you can interrupt and talk to any of your co-workers at any moment, right?

Not really. Even in the office, even when sitting side by side there are good and bad times of interrupting your teammate. We try to indicate those moments by having a headphones on policy - when I have my headphones on, treat this as a do-not-disturb sign.

Now when it is a good moment to catch up, you might as well use Hangouts to do a bit of pairing, discuss a particular feature detail or do a mob review of a particularly challenging pull request. Reviews over Hangouts work equally well, if not better - no need to lean over each other around a laptop screen, you can hear everyone well (especially true when your office is a huge open space), and there are clear turns when it comes to providing feedback.

## Step 5: Team autonomy

Team autonomy is probably the single most important enabler of remote work efficiency. Every team member should be able to deliver features either independently, or with the minimum interaction with the rest of the team.

This doesn't mean everyone decides for themselves what they are working on. In a traditional setup you would have sprints, goals and pre-defined tickets that are commited for delivery. Each team would hold refinement sessions when tickets would be created, fleshed out and readied for implementation. Dependencies would be highlighted and resolved. Once the sprint starts, you can pick up a ticket from the sprint backlog and start cracking.

At this point there shouldn't be much stopping you from delivering a ticket all the way to production. There might be some gates to open - QA would potentially be one of them. You might want to implement automatic pipelines for QA, or you might be lucky enough to have a dedicated QA engineer on your team. However the case, each engineer should be in a position to pick right tools for the job, do the job, test it and ship to production. And then verify it on production. And maybe create some alerts for a business critical feature.

There is a danger of siloing here when every team does things in their own way. You can easily mitigate this with a good open engineering culture. 

## Good engineering culture

Have a tech guild wide presentation on the things you've been shipping and challenges you've been solving recently. Extrapolate good solutions into easily reusable libraries, and encourage others do the same. Have an ongoing company-wide tech chat on Slack. Once a month we also do a mini tech conference in the company when anyone can come up and talk about practices they'd like to spread across the company.

## Coffee

Most importantly, don’t forget to get out of home for a nice walk to support your local coffee provider. Not every area of London is equally well covered with fancy cafes, but I feel like this situation has improved significantly in the past years. Keep your steps count up, even when your office is 5 steps from your bed. 
