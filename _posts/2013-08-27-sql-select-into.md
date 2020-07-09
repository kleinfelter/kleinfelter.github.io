---
categories: []
layout: post
title: SQL Select Into
created: 1377634050
redirect_from: /content/sql-select
---
I never can remember the syntax for these:

    INSERT INTO Table2 (col1, col2)
    SELECT col_a, col_b
    FROM Table1
    WHERE where_clause_here

or

    SELECT col1, col2
    INTO newtable
    FROM table1
    WHERE where_clause_here
