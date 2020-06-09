---
name: Idempotency
date: 2020-06-03T07:14:00+01:00
layout: post.jade
description: What is idempotency and how is it useful for reliability of your scheduled jobs
tags:
- system design
---

"Idempotency is the property of certain operations in mathematics and computer science whereby they can be applied multiple times without changing the result beyond the initial application." - Wikipedia

This might not sound particularly exciting, but it is one of the fundamental tools when building fault-tolerant systems.

I believe the very first time I've heard about idempotency was when reading through Stripe API documentation. Stripe is dealing with financials, which is a very sensitive topic. One of the most common issues on backend systems is when a given operation seems to fail, then it is automatically retried, and suddenly you have performed the same operation twice. This might not be a big deal when you are trying to write a log or send a message - but it is a big deal when you are charging someone's bank card.

Stripe has a whole chapter on [Idempotent requests](https://stripe.com/docs/api/idempotent_requests). The way they do it is each request gets assigned an idempotency key - a random-looking alphanumeric combination that is attached to this particular request to perform this particular action. Once you have this key, you are free to retry the same operation as many times as you want - the result will always be the same. Also, a bank card would only be charged once.

## Example

If you are dealing with automated jobs charging people millions of dollars on every run - or maybe you are writing software for controlling nuclear reactors - a concept of idempotency has value for you.

Let's say you have a job that would charge a list of accounts late fees on a given day. 

<figure>
  <img src="https://alexsavin.me/photos/idempotency.png">
</figure>

It could look something like this.

```
// pseudo code
lateFeesDailyJob() {
  todaysAccounts = getTodaysAccounts()
  
  todaysAccounts.forEach(account => {
    accountDetails = fetchAccountDetails(account)
    accountMissedPayment = getMissedPayment(accountDetails)
    
    if (accountMissedPayment) {
      // is it time to charge a late fee?
      if (accountMissedPayment.date + two_weeks === today) {
        chargeLateFees(accountDetails)
      }
    }
  })
}
```

This function would be part of a cronjob which is triggered daily. This is all fine, until one day this cronjob fails halfway through the run. Some accounts get processed successfully, while the rest of them never get to be processed. Now you are in trouble - you'd probably want to process the rest of the accounts. However, simply restarting the job would also charge accounts in the first part of the list twice.

You can increase fault tolerance here by modifying the date comparison slightly:

```
if (accountMissedPayment.date + two_weeks <= today)
```

This way even if your job misses a day or two, it can still catch up the next day and process all the accounts that were skipped the day before.

But what if you _have_ to re-start the job on the same day as soon as the run failure detected? With the current implementation, the same accounts will get processed twice, or even more if you have multiple retries.

Let's make this function more _idempotent_. To do that we are going to mark an account as _charged_ after we have taken their money.

```
if (accountMissedPayment.date + two_weeks <= today) {
    chargeLateFees(accountDetails)
    markAccountAsCharged(accountDetails) // mark record in db
}
```

We will also modify the original function that fetches a list of accounts to be processed to only return uncharged accounts.

```
todaysAccounts = getTodaysUnchargedAccounts()
```

The whole implementation would look like this:

```
// pseudo code
lateFeesDailyJob() {
  todaysAccounts = getTodaysUnchargedAccounts()
  
  todaysAccounts.forEach(account => {
    accountDetails = fetchAccountDetails(account)
    accountMissedPayment = getMissedPayment(accountDetails)
    
    if (accountMissedPayment) {
      // is it time to charge a late fee?
      if (accountMissedPayment.date + two_weeks <= today) {
        chargeLateFees(accountDetails)
        markAccountAsCharged(accountDetails)
      }
    }
  })
}
```

This way a given account can only be charged once doesn't matter how often you retry this job on the day.

You might also want to combine this approach with atomicity - to make sure that charging late fees and marking an account is reflecting the success of the charge.

```
result = chargeLateFees(accountDetails)
if (result === SUCCESS) {
    markAccountAsCharged(accountDetails)
}
```

At this point, we are in a pretty good place. A cronjob can now be safely restarted multiple times on failure, and each account would only get processed once. A job is well done as I call it.