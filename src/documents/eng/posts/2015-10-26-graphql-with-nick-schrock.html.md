---
name : GraphQL with Nick Schrock
date: Mon Oct 26 22:00:28 2015 (UTC+0000)
layout: post.jade
description: GraphQL co-creator Nick Schrock did a talk recently on history of this project. This post is a summary of this talk and some thoughts on GraphQL / React ecosystem
tags:
- GraphQL
- React
- dev
---

<img src="https://alexsavin.me/photos/2015-10-graphql/IMG_0211.jpg" class="featured" alt="GraphQL talk with Nick Schrock">

During our recent London React meetup co-creator of GraphQL Nick Schrock did an hour long talk on how they came up with this idea (together with Lee Byron), and why you should use it too. This post will be mostly bulletpoints on his talk, with some pics and my thoughts mixed together. Full talk should be available soon online - Facebook AV team records everything in amazing quality.

#### What

GraphQL. Have you ever used SQL? Same idea, but so much better. It’s not a storage, despite the `graph` in the name. It’s a query language. You compose queries and get responses in return.

Not only queries. Also mutations. You can compose a mutation to change something on the backend and send it to the GraphQL endpoint. In return you get a response of the thing you wanted to change, with your changes applied.

On the Web we usually use REST. It’s a standard that each of us interprets differently. During my years of web dev I haven’t met a person that would understand and use REST in precisely same way as myself. Reason might be with me, but apparently I’m not along - lots of people are struggling with REST.

If you’re developing a RESTful API endpoint, you’d usually aim to:

<ol type="a">
<li>make it highly intuitive and easy to use by clients</li>
<li>alight with Web standards</li>
<li>allow clients to make as little requests as possible to retrieve all data they need</li>
</ol>

These things often contradict each other. Not to mention that without good documentation it’s almost impossible to start using any RESTful endpoint.

GraphQL allows you to create nested queries of unlimited complexity that are in turn sent to GraphQL server. You can have multiple queries in the same request too. In the ideal world your React application would contact GraphQL endpoint, which would resolve the query and respond with the data of exact shape as the original query. No more fixed inflexible JSON responses that you need to decode and reshape. You request the data in the shape you need, and this is exactly what you get in response.

#### History

It all started when FB realised that their HTML5 based mobile app doesn’t work. If you remember, there was a period when Zuck proclaimed that well made web app can perform as fast as native mobile app. This all happened around 2012. Didn’t worked out. So Facebook quickly admitted failure and started working on native mobile apps for iOS and Android.

Obviously these apps needed a reliable API. They also turned out   to be first clients (in addition to the website) to consume that API. One option would be to create RESTful endpoints. Because of the earlier mentioned reasons that was not the best thing in the world. This is when Nick and Lee started thinking about GraphQL.

You see, if you don’t adapt to the new world fast enough, you can die. Even if you’re a huge and successful company. Try, fail fast, learn, adapt and retry.

GraphQL turned out to be the answer they were looking for. A highly flexible way of requesting data for your client app, which constantly evolves. It’s not 100% perfect, but combined with things like Relay it is quite revolutionary.

#### Back to the real world

Facebook open sourced GraphQL standard and reference implementation this summer. Turned out that it is highly useful also outside of FB infrastructure. Namely for frontend web developers. You see, we are highly dependent on what is going on with backend. Most often backend is not something we control. Quite often it is something that’s developed by people in a different country, and provided AS IS. You must deal with it. The answer in this situation, surprisingly, is GraphQL.

<img src="https://alexsavin.me/photos/2015-10-graphql/IMG_0240.jpg" class="featured" alt="GraphQL talk with Nick Schrock">

This was one of the slides in Nick’s presentation. In the ideal world you’d want to:

<ol type="a">
<li>implement a GraphQL enabled API serverside</li>
<li>adapt your React app to request GraphQL queries</li>
</ol>

While b) is something in control of front end dev, a) can very well be out of reach. Meanwhile you can implement a GraphQL endpoint yourself, have your React app consuming it, and have resolvers in that endpoint pointing at the legacy RESTful API(s). Yes, all RESTful endpoints are legacy from now on.

#### Mobile

One of the things Nick mentioned was React Native apps. You see, FB started using React Native for mobile apps this year. You can use React Native with Relay and GraphQL. Here’s where things start to be interesting - for their Ads Manager app on iOS and Android they were able to re-use 87% of the code. Thanks to React components that are wrapped into Relay containers with data requirements in GraphQL.

This obviously is not limited to just iOS and Android. You can re-use same code for Web too.

87%.

#### Introspection

I mentioned earlier about need for documentation for any RESTful endpoint. About a week after releasing Relay, FB also released a tool called GraphiQL. It’s a visual tool that hooks to your GraphQL endpoint and allows anyone to explore it. Anyone without a slightest clue about your endpoint can start typing queries, which is surprisingly easy since there is autocomplete feature. You can also ask endpoint for what you can request from it, and get a full schema in return.

This leads to interesting things. GraphiQL is easy enough to be used by UI designers. They can play with queries and see what kind of data can be acquired from the server. Later they can design features based on this real world experience. No more guesses, no lengthy conversations with remote teams on breaking lines. Try, explore, see, learn.

GraphiQL allows you not only provide self describing queries, but also give feedback to developers that some features are deprecated. This will be displayed within the tool itself.

In short, GraphiQL will help you to convince anyone on the idea of GraphQL.

#### Ecosystem

FB is pushing their vision for web apps of the future. It is React apps, with Relay and GraphQL. Interestingly there are implementation of GraphQL in other languages too, most notably - [Scala](http://sangria-graphql.org/). This stack makes most sense when you’re tasked with creation of native clients too. React Native currently targets iOS and Android, but you can imagine this spreading to desktop OS:s too in the very near future. Learn once, use everywhere.

#### Conclusion

In many ways Nick’s talk was a sales pitch, but the audience was right. In the world full of inconsistence RESTful interfaces, that are clunky, inflexible, unintuitive and hard to evolve GraphQL is a breeze of fresh air. Obviously not everyone needs it. But tools are evolving, as well as cloud services. GraphQL backend as a service is already a [thing](https://www.reindex.io/) - currently in beta. Tools like this will enable a new generation of apps, and reduce amount of grumpy developers.

<img src="https://alexsavin.me/photos/2015-10-graphql/IMG_0247.jpg" class="featured" alt="GraphQL talk with Nick Schrock">

Looking forward to it.
