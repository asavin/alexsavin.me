---
name: Reactive Conf 2017 takeaways - Datomic, Logux and CSS with Elm
date: 2017-11-12T07:14:00+01:00
layout: post.jade
description: 
tags:
- react
- conference
- webdev
---

<img src="https://alexsavin.me/photos/2017-10-26-reactive-conf.jpg" class="featured" alt="Reactive Conf 2017">

Some of my highlights and notes on the recent conference in Bratislava. 3 days, 2 tracks, lots of cake and some Angular.

## @swannodette on Datomic

David Nolen of Cognitec and Clojure gave a good overview of issues we're experiencing today when implementing mid to large scale apps, before explaining how Datomic database might solve some of them. Some of my thoughts here inspired by his talk.

If you have a choice of investing into tests vs investing into a simpler system, latter is always better. Less moving parts mean fewer things to break and less time for debugging issues. You still have to invest time into designing simpler systems though. Making large and complicated systems is easy and straightforward in a short term, this is what we're all doing after all.

PLOP aka place-oriented programming - a term Rich Hickey used in his classic talk to describe our traditional approach to mutable programming. Originally was required by limitations of old computers with little memory available. Things have changed quite a bit since then.

Conventional databases in the system are effectively huge mutable variables with all the applicable consequences. Debugging large systems is hard because it is impossible to replicate the exact state of it during the issue. We've figured this quite some time ago for React - if the state of the app is immutable things become much easier to control. We haven't transcended, however (for the most part) beyond just the apps - our systems are still full of mutable parts making a life of a developer hard and miserable. Datomic is effectively an immutable database, like a huge Redux store.

I've tried setting up Datomic in the past though, and it was not an easy task. It is also not free, although they do have a free tier. It was also only useful for Clojure apps. Things are getting better, however - Datomic JS client is coming, and you'll be able to start a Datomic instance from AWS Marketplace in a couple of clicks soon. Even today people manage to run it for their Node.js apps, but that does require some setup.

Homework:
* Couple of true classics - Rich Hickey - [Value of Values](https://www.infoq.com/presentations/Value-Values) and also [Hammock driven development](https://www.youtube.com/watch?v=f84n5oFoZBc)
* [Out of the Tar Pit](https://www.goodreads.com/book/show/18395310-out-of-the-tar-pit) book
* [How to solve it](https://en.wikipedia.org/wiki/How_to_Solve_It)  book by mathematician George Pólya describing methods of problem-solving


## Focal from Grammarly

Neat [FRP UI library](https://github.com/grammarly/focal) from Grammarly and also used by them in web and desktop apps. Written in TypeScript.

## Jest as a platform by Rogelio Guzman

Apparently, Jest is becoming a full-fledged platform. The good news is that gives us some neat customisation options, as well as allows to peek inside Jest itself. 

As of today most of our unit tests are quite a mess of libraries and conventions. Sometimes it is Jest. Sometimes it is Mocha + Sinon. Add a bunch of extra tools for better mocking, reporting results, linting the code. What Jest is trying to do is to pick and swap parts of itself to other things you prefer. Will we ever end up with a perfect testing setup working with all apps? Probably not. But you could have conditions in that setup.

A basic lifecycle of a Jest run consists of
* Finding all the relevant files
* Running tests
* Reporting results

Jest contains tools for achieving that, quite [a few](https://github.com/facebook/jest/tree/master/packages) of them. What you can do today is to pick the tools you need, leave out the tools you don't need, and replace some default parts with other alternatives. You can swap test runner to Mocha, or even [write your own](https://github.com/Rogeliog/create-jest-runner).

Jest used to be a highly opinionated test framework that made choices for you, but they are opening the hood now for everyone to tinker with. 

## Sean Larkin on Webpack and OSS community

I've missed the 2 hours long workshop on Webpack but managed to attend an AMA with Sean Larkin. The good stuff:

* There is a [SurviveJS Webpack](https://survivejs.com/webpack/foreword/) book, free to use.
* A fascinating insight into how community influences feature picking decisions and the overall development of the project. Also how to deal with frustrated members of the community. Apparently, you have to show them love <3. In the words of Sean "The best weapons against trolls is show that you care". The general idea is transparency of the backlog. Another important influencing factor is potential sponsors of the OSS project. A company might decide to sponsor your OSS so they could get a preferential treatment, which is totally fair.
* OSS is done best when done full time, but that's not really the news - and that's why sponsors are important.

## Richard Feldman on CSS as byte code

This talk might've been also titled "Why you should use Elm for CSS", but we'll get there in a moment.

"CSS was never meant to be used for creating user interfaces"

Not really. Back in 1990:s HTML was conceived as a content-only language, but users wanted to make the content look pretty. So around 1996 CSS started to happen so that users could write it in the browser and format the content the way they wanted it to look. Yep, CSS was meant to be written by users. This explains my long-standing question on why there is default CSS in each browser - because this is where _all_ of the CSS where suppose to be by design.

Things are rarely used the way they are originally designed. Well, most of the time, but not always. Today Web is the biggest user interface delivery platform.

We're quite used to JS transpilers as of 2017. Yes, we have a bunch of browsers with different implementations of the new ECMAScript features, but this is why we have handy tools to make the shiny modern code we write compatible with every outdated browser there is. Most of this today is done automatically. Compiled JS is effectively today's bytecode.

You could draw some parallels into the CSS world - there are PostCSS and LESS and SASS, and CSS3 is sort of happening. But the vertical positioning of a content is still a tricky thing (unless you're all flexbox that is). There's room for more effective tools offering more powerful features and transpiling it all into browser compatible CSS. Hence [Elm-CSS](https://github.com/rtfeldman/elm-css). It doesn't just build on top of existing CSS conventions maintaining the old mindset of "oh well it's still CSS", but tries to invent a new UI building language, evolved from CSS but not inheriting any of its bad parts. You also get full benefits of this being written in Elm - all CSS in JS ideas work here too, but the code looks much prettier.

## Igor Minar and Evan You on client side app optimisations

Make the client side app as light and fast as you can they say. The art of optimising frontend bundles slowly moves towards the dark arts - and both Igor and Evan did a great job at demystifying it. Most of the job is done by Webpack anyway.

Today there are [handy tools](https://medium.com/@joeclever/three-simple-ways-to-inspect-a-webpack-bundle-7f6a8fe7195d) allowing you to peek into the compiled Webpack bundle and see what's really going on in there. Source-map-explorer got a special recommendation, I've tried it - it totally deserves its reputation. You have to have a certain understanding of the needs of your code in order to use it effectively - but even deep diving into the unknown codebase might give you some insights. The trick is to look at the way the modules are imported and question the need to import the whole module or only the necessary parts.

There's also a flip side - when writing a module, make sure it is, well, modular. Allow clients to pick what they need instead of dumping everything into `export default`.

Webpack is capable of concatenating modules, but not by default.  For that, you have to enable `moduleConcatenationPlugin`.

"In the past, one of the webpack’s trade-offs when bundling was that each module in your bundle would be wrapped in individual function closures. These wrapper functions made it slower for your JavaScript to execute in the browser. In comparison, tools like Closure Compiler and RollupJS ‘hoist’ or concatenate the scope of all your modules into one closure and allow for your code to have a faster execution time in the browser."

Code splitting is still a good idea. My general argument about it was the speed of HTTP requests on slow mobile networks - but this is where http/2 comes in handy - and you can totally use it today. Code splitting is very effective for single page apps where your landing page does not necessarily need the rest of the app straight away - something we still do almost always, letting our users wait for the whole thing to load before anything meaningful can happen.

Honorable mention - [Webpack Dashboard](https://github.com/FormidableLabs/webpack-dashboard) from Formidable. "Now when you run your dev server, you basically work at NASA".

## Prop based testing by Gave Scholz

"So much of JavaScript unit testing is ineffective against preventing bugs."

[Randomized Testing in JavaScript](https://medium.com/@gabescholz/randomized-testing-in-javascript-without-lifting-a-finger-8d616d7048af)

When testing things we need test data. Most often than not the data would be hardcoded. Sometimes (if we feel generous enough) we might write a generator. The idea of randomised prop testing is to use generators that understand _types_ of the objects and can generate unique objects every time within the set type.

Why would this be possibly a good idea? This is effectively introducing entropy into your otherwise perfectly isolated test environment. That's exactly why. To design a fail-proof system you have to define boundaries of it, and let the robots test those boundaries properly. An average unit test will perform a very niche scenario with a single given value out of sometimes millions of possible values. Sometimes it is possible to test all of them for every build. Sometimes not. Randomisation is a middle ground.

JavaScript is a dynamically typed language, but nowadays we have FlowType or even TypeScript. Once you do have type definitions, making randomised test data generators becomes possible. Here's a Babel plugin for [transforming FlowType into generators](https://github.com/unbounce/babel-plugin-transform-flow-to-gen).

## Andrey Sitnik on Logux in production

We're notoriously bad at handling errors when it comes to the client side. Well, maybe also server side. But mostly client side. The forgiving nature of an app in the browser is that once a user is frustrated, they can always hit a reload button.

This was not always the case - in a native app, there is an option of hanging helplessly and hoping a user knows how to kill an app that is stuck. Or throwing the whole OS into a BSOD state. 

But I digress.

Single page apps are easy to get into a stuck state because they rely on a good network connection. Which is rarely the case. Andrey brings an example of the internet in China where packet loss can reach 40%. It's just the way it is, there is no way around. Network connection is actually mostly bad in most parts of the world. Africa, New Zealand and Bethnal Green are among these places. You have to face the fact and address it as a web developer.

[Logux](https://github.com/logux/logux-client) is a solution to synchronise app state with a server in a reliable, fault-tolerant way. You could _sort of_ compare it to Apollo and Relay Modern in a way - but it is much more minimalistic, relies on WebSockets and doesn't force you to use GraphQL or wrap your React components into containers. Its API is Redux compatible. It allows you to define app actions and have central app state, parts of which are automatically synced to a server side.

The secret sauce is The Log (hence, LOGux). The log is timestamped and allows to figure out the ultimate state of the app at a given time. Logux also implements its own timestamping, since you can't really rely on clients, or, in some cases - even servers. All it is, in the end, is the log of actions, coming from either client or server. Once the actions are received and reduced to the app state, all of that is rendered and presented to a user.

Logux has grown to a version 0.2 since its announcement on React  London conflict in March 2017 and is used today by Evil Martians in production.

## Bonus track

* Did a vlog on the conference - check it out

<iframe width="560" height="315" src="https://www.youtube.com/embed/mShuHy5ACTw?rel=0" frameborder="0" allowfullscreen></iframe>
