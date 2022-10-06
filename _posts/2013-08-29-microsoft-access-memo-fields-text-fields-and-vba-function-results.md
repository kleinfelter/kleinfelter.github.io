---
categories: []
layout: post
title: Microsoft Access - Memo Fields, Text Fields, and VBA Function Results
created: 1377806248
redirect_from: /content/microsoft-access-memo-fields-text-fields-and-vba-function-results
---
Microsoft Access has its good points and its bad points.  One mostly nice point is that you can use a Visual Basic function to calculate a query result.  For example:

    Select Field1, Field2, MyVbaFunction(Field3)

But I wanted to do a "select into" and to have MyVbaFunction return a long string.  Something like

    SELECT col1, col2, MyVbaFunctionReturning1000ByteString(Field3)
    INTO newtable
    FROM table1

The trouble is, Access assumes field types.  It assumes type of text(255) for any function which returns a string.  So my 1000 byte result was getting truncated to 255 characters.

There really is no good work-around.  You can't tell a VBA function to return a memo.  VBA doesn't know about 'memo.'  My hack was to do this in multiple steps.

First, run the query in a simplified form:

    SELECT col1, col2, "dummy" as dummy
    INTO newtable
    FROM table1

Then edit the field definitions for table1 and change the 3rd column into a Memo column.  

Finally, run this SQL:

    update table1 set dummy = MyVbaFunctionReturning1000ByteString(Field3)

But... If you copy/paste this data from Access into Excel, it still gets truncated in Excel!

