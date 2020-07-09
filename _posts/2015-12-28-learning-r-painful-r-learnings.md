---
categories: []
layout: post
title: Learning R - Painful R Learnings
created: 1451343018
redirect_from: /content/learning-r-painful-r-learnings
---
I'm learning programming/analysis with R.  Here are a few things I've learned that were more painful than necessary.

* Suppose you have a formula such as `fol <- formula(response ~ a + b + c)`.  Every one of those values must be defined in your data frame -- including the left-hand side ('response' in this case).  This means you must add a column to your data frame for the left-hand side.  You'll probably do that with df$response<-rep(0,row_count_goes_here).
* If you call rpart with something like  `model <- rpart(fol, method="class", data=training)`, you might get `Error in cbind(yval2, yprob, nodeprob) :  number of rows of matrices must match (see arg 2)`.  If all of your left-hand side values are the same, rpart throws this unhelpful message as its way of saying, "Hey!  I can't make a decision tree where all of the records ('response', in this case) have the same value!  The decision is too easy."
    * You'll have to put the calculated value for the left-hand side into the table.  Try something like `training$response <- training$a + training$b + training$c`
* to get the first 5 rows of a data frame with 13 columns use either:
    * df[c(1:5),1:13]
    * df[c(1:5,]
