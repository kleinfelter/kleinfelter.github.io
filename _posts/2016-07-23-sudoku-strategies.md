---
categories: []
layout: post
title: Sudoku Strategies
created: 1469321103
redirect_from: /content/sudoku-strategies
---
Term
* row - a single row
* column - a single column
* square - a single cell
* 3Row - a group of 3 rows; rows 1-3, 4-6, or 7-9
* 3Column - a group of 3 columns; columns 1-3, 4-6, or 7-9
* 9Square - a square of 9 cells with a bold border

* Pair-across
    * Find 2 rows in a 3Row with a shared value. Check the 3rd row of the 3Row in all its 3Squares to see if you can find a square for the 3rd instance of the shared value.
    * Repeat for all 3Row and 3Column.

* 2 squares remain
    * In a 3Square, when only two empty squares remain, ask yourself what 2 values remain.  See if only one legit mapping of those values to empty squares exists.
    * Ditto for a row with only two squares remaining.
    * Ditto for a column with only two squares remaining.



