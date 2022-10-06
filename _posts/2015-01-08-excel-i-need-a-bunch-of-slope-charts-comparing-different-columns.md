---
categories: []
layout: post
title: Excel - I Need a Bunch of Slope Charts Comparing Different Columns
created: 1420742703
redirect_from: /content/excel-i-need-bunch-slope-charts-comparing-different-columns
---
From time to time, I get a worksheet full of data.  There's one column with a measurement.  There are several other columns with different attributes.  I want to find out whether any of these other attributes correlate with the measurement.

Here's an example:

| Score | Name | Shoe Size | Age |
|--------|--------|-------------|------|
|    12   | Jim    | 6               | 33   |
|    15   | Jim    | 8               | 14   |
|    33   | Joe    | 7               | 6 |
|  2       | Fred  | 6               | 5  |

We might want to answer the questions:

* Is there a relationship between Score and Age?
* Is there a relationship between Score and Name?   (Maybe people who are named Jim do better that people who are named Joe.)
* Is there a relationship between Score and Shoe Size?

I call these "slope charts" because you'll typically have a lot of rows, you'll sort the rows from small to large (or vice versa), and you'll create a column chart that has a slope from one side to the other.

This is a job for Pivot Tables!  I'll tell you how to do one column (Name), and you'll easily figure out how to do other columns.

1. Select the Score column.
1. Add the Name column to the selection (via Control-click on the column header).
1. Click Insert (on the menu), Recommended Pivot Table, and insert a pivot table to a new worksheet.
1. Change the Pivot Table settings (for <sigma> Values) from Sum to Average (or not, if you really want to use Sum).
1. Sort the table by the Average column (by way of the drop-down in the Row Labels column -- use More Sort Options).
1. Select the entire table.
1. Insert a clustered column chart.
1. Give your worksheet a good name, because you'll probably be adding more tables/charts.
