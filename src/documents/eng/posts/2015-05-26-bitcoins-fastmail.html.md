---
name : Bitcoins and moving off the GMail
date: Tue 26 May 21:52:02 2015 (UTC+0000)
layout: post.jade
description: “Fastmail, bitcoins and Gmail alternatives“
tags:
- bitcoins
- email
---

I've been using Fastmail for a bit, and it's amazing how fast webmail can be. Simple, nothing extra, shortcuts throughout the app. Current incarnation of Gmail feels like behemoth - takes ages to get it all loaded.

Also Fastmail is not free. Are you ok being a product? Somehow it feels that dedicated paid service will always beat free ad-powered one. Fastmail comes with a number of different price points, and what's best - they accept bitcoins. I'm paying with bitcoins for my VPN provider, domains, and now - email provider. A little bit of privacy here and there.

What about second factor authentication? Fastmail natively supports Yubikey generated one time passwords. Plug the key and press a button.

There is a little bit of setup if you want to integrate Fastmail with a custom domain. Receiving mail is easy - just get your MX records for the domain in place. Sending email is slightly trickier. In a modern world of email there is lots of spam. To combat this issue, email providers came up with a technology called DKIM or Domain Keys Identified Mail. It is basically HTTPS in the world of email - a way of signing each email message with an authorized signature, which can be checked by receiving server and sent to spam folder in case of failure. Fastmail got you covered there too - they provide a signature which you add to a special TXT domain record. After that your custom domain is all set.

Drop me a line on [hello@alexsavin.me](mailto:hello@alexsavin.me) if you feel like it.

And yeah, I was not paid by Fastmail. Quite the opposite.
