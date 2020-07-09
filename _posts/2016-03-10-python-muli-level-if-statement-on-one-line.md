---
categories: []
layout: post
title: 'Python: Muli-level if statement on one line'
created: 1457629969
redirect_from: /content/python-muli-level-if-statement-one-line
---
I saw an answer for this on StackExchange, but nobody seemed to understand why it was desirable...  (I'm not enough of a participant in StackExchange to have enough reputation points to post a comment there.)

How can I combine multiple if statements onto a single line?  I want

    if x > 89:
        y = 'A'
    elif x > 79:
       y = 'B'
    ...
    else:
       y = 'F'

on a single line.

Yes, it can be done.  Yes, it doing so does serve a purpose.  Consider the lambda.

    lambda x: 'A' if x>89 else 'B' if x>79 else 'C' if x > 69 else 'D' if x > 59 else 'F'
