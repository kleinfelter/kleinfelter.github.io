---
categories: []
layout: post
title: How to Create a Bell Curve (Frequency Distribution) Chart in Excel 2010
created: 1374517603
redirect_from: /content/how-create-bell-curve-frequency-distribution-chart-excel-2010
---
##Assumptions for this walk-through:

* You've got a list of hundreds of values (e.g. 200).
* You want to see those values in a small number of buckets (e.g. 10)
* Your data actually fits a bell curve, where there are a few items in the lowest bucket, a few items in the largest bucket, and lots of items in the middle buckets.

##High-level Strategy:

1. Get a column in Excel with your 200 numbers
1. Decide how many buckets
1. Get Excel to tell you the bucket boundaries (e.g. Values 1-14 go into bucket 1, values 15-29 go in bucket 2, etc.)
1. Get Excel to give you the frequency distribution //as numbers//.
1. Turn the distribution //numbers// into a distribution chart (histogram).

##Get a column in Excel with your 200 numbers

* This is your job.  You go get the data you want to chart, put it in a column, and come back to these instructions when you're ready to proceed.  I'm going to assume that you put this data into column A, beginning with row 2 (with a title in A1).

##Decide how many buckets

* Statistics people call these buckets/chunks "bins".
* This walk-through will assume you want 9 bins.  (Yeah, I said "10" up above.  It is easiest to use an **odd** number of bins.)
* Answer the question, "How many bins do you want below the mid-point?"  With our example of 9 bins:
    * The 5th bin is the mid-point.
    * There are 4 bins below the middle bin and 4 bins above the middle bin.

##Get Excel to tell you the bucket boundaries (e.g. Values 1-14 go into bucket 1, values 15-29 go in bucket 2, etc.)

* You need a list of the bins to be in a column.  Excel will do this for you, using these instructions.
* Calculate the average.  Think about this first.  You you really want to use average (i.e. the mean), or do you want to use median (the middle value).  I'm going to use median, but if mean better suits your needs, use average where I've used median.
    * Assuming that your data is in A2:A201, and that nothing is in column B:
        * Put `Average` in B1.
        * Put `=median(A2:A201)` in B2.  This will be the middle of your bell curve.
        * Name this cell 'Average'.
            * See [Name an Excel Cell](/content/how-name-cell-excel) for instructions on how to name a cell.
* Calculate the Standard Deviation.  If you're not a statistics guru, Standard Deviation answers the question, "How wide is each bin?" or "What's the distance between the smallest value in bin 1 and the smallest value in bin 2?"
    * Assuming that your data is in A2:A201, and that nothing (other than what I've said above) is in column B:
        * Put `Std Dev` in B3.
        * Put `=STDEV(A2:A201)` in B4.  This will be your standard deviation (the width of your bins).
        * Name this cell StdDev.
* Put your bin count in column B:
    * Put `Bin Count` in B5.
    * Put your bin count in B6.  In our example, it is 9.
    * Put `Half Count` in B7.
    * Put `=FLOOR(B6/2,1)` in B8.
    * Name this cell HalfCount

* We're going to put a list of your bins in column C.  I assume you've got nothing else in column C.
    * Put `Bins` in C1.
    * In C2, put `=Average-HalfCount*StdDev`.  This is your lowest bin.
    * In C3, put `=C2+$B$4`.
    * Copy C3 and paste it into C4 through [enough rows so that you have a value for each bin].  
        * In our case, this would be 7 more rows (i.e. through row 10), giving us our total of 9 bins.  
        * In **your** spreadsheet, if you copy from row 3, you'll copy to row n+1, where n is **your** bin count.
    * Note: If your data is such that you don't like the bins this gives you, make up your own bin limits, and override these.  You just need the bottom value of each bin in a column.

##Get Excel to give you the frequency distribution //as numbers//.

* If you don't have it installed, install the Analysis ToolPak Excel Add-in.  For Excel 2010:
    * File/Options/Add-ins.  Manage: Excel Add-Ins.  Press "Go..."
* From the Data ribbon, in the Analysis panel (or the Tools menu, on older versions of Excel):
    * Choose //Data Analysis//.
    * Choose //Histogram//.
    * In the Input Rage, enter the range for your source data.  (e.g. `A2:A201`, for our example).
    * In the Bin Range, enter the range for our bin values (e.g. `C2:C10`, for our example).
    * In Output Range, enter the name of the first cell where you'd like you histogram values to be written.  (e.g. `E2`, if column E is empty, and you're going to put "Histogram" as a title in E1.)

##Turn the distribution //numbers// into a distribution chart (histogram).
    * Select the cells of your histogram both the Bin and the Frequency columns. Include the "Bin" and "Frequency" titles and all the value cells.
    * From the Insert ribbon (or the Insert Menu on older versions of Excel), choose Scatter, then //Scatter with Smooth Lines and Markers// or //Scatter with Straight Lines and Markers//, depending upon your preference.
