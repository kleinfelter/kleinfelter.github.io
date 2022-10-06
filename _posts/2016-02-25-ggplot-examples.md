---
categories: []
layout: post
title: ggplot examples
created: 1456452124
redirect_from: /content/ggplot-examples
---
ggplot a data frame with two series mixed together:

ggplot(df, aes('x-column-name','y-column-name',color='column-with-value-that-distinguishes-the-two-series')) + geom_point() + geom_line() + ggtitle('title') + xlab('xlab') + ylab('ylab')

e.g. For a data frame with a farmer's data for  count of apples and pears grown in each year, with columns year, count, fruit

ggplot(df, aes('year','count',color='fruit')) + geom_point() + geom_line() + ggtitle('McDonald Farm Fruits') + xlab('Year') + ylab('Bushels')
