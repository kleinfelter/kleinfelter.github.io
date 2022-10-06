---
categories: []
layout: post
title: The Monte Hall Problem
created: 1476912803
redirect_from: /content/monte-hall-problem
---
I was struggling to understand the [Monte Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem).  [This explanation](https://vwo.com/blog/the-monty-hall-problem/) helped.

I think the confusion is between dependent and independent probability.  Ironically, I dropped my first course in Statistics because the prof was confusing the two.

Here's the explanation that makes sense to me:

* If you choose the correct door and you switch, you lose.
* If  you choose incorrect door-a and you switch, you win.
* If you choose incorrect door-b and you switch, you win.

Ergo, in 2 of 3 cases you win by switching.

Now consider:

* If you choose the correct door and you don't switch, you win.
* If  you choose incorrect door-a and you don't switch, you lose.
* If you choose incorrect door-b and you don't switch, you lose.

Ergo, in 2 of 3 cases you lose by not switching.  (That's logically equivalent to saying that in 1 of 3 cases you win by not switching.)

The thing is, this is **dependent **probability, but it is dependent upon whether you picked correctly on the FIRST guess, not on where the win is.

There are two possibilities for your first choice: You picked a winner or you picked a loser.

* **Given** that you picked a winner, what is the probability that switching will win?  Zero
* **Given** that you picked one loser, what is the probability that switching will win? 50%
* **Given** that you picked the other loser, what is the probability that switching will win? 50%
* What is the probability that your initial pick was a loser?  2 in 3.
* What is the probability that your initial pick was a winner? 1 in 3.

By not switching, you are betting that your initial pick was right, which has only a 1 in 3 probability.
