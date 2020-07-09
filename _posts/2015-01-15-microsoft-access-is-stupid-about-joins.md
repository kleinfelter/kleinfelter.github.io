---
categories: []
layout: post
title: Microsoft Access Is Stupid About Joins
created: 1421346411
redirect_from: /content/microsoft-access-stupid-about-joins
---
UPDATE: 

* "Parameters" (and "Parameter") are reserved words in Access.  I had been using a table named "Parameters".  Changing to "[Parameters]" (surrounding the table name with square braces) seems to have helped.  Access was complaining about the join expression when the real problem was an illegal table name.  Ultimately, I renamed my table to "Parms".
* Better solution -- Instead of doing the join, use:
    * Select * from a where exists (select 1 from parms where a.currentdate between parms.startdate and parms.enddate)
        * Note that Access typically is very slow for nested queries, but this one runs very quickly.

This is an interesting, non-intuitive technique, so I'd like to explore it a bit further, to cement it into my mind.  To me, I want records from A where the A record meets the criteria.  The nested query asks for Parms records that meet the criteria.  

There are a couple of cases where I use JOIN: One is to 'extend' records (make them wider) and the other is to 'select' records (reduce the set of records).  When using join-as-select, you can replace it with a subquery that tests for the existence of records in the table you are using to 'reduce' your primary table.  (After all, this is really what the join does, if you return no fields from the parms table.)

----- 

Microsoft Access sometimes says "JOIN expression not supported" when you try to join on an expression more complex than an equijoin.  I often use a Parameters table, with a single record, to choose the range of data that other queries return.  This allows me to create views/queries that return ranges of data where the range is data driven (instead of hard-coding the range criteria).

Basically, I want to say "select data between these start/end dates" and put the dates in a Parameter table.

Access has a nervous breakdown when my join looks like:

SELECT * FROM SourceTable INNER JOIN ParameterTable ON SourceTable.TimeStamp > ParameterTable.StartDate and SourceTable.TimeStamp < DayAfterEndDate;

My solution is to add a new virtual field to the query, which returns true/false if the record meets the criteria.  Then I can avoid the problematic join.

i.e. If it won't join, and you're using a join to select records, define a function to return true for desired records and select those records where the function returns true.

Since we'll be calling this function a lot, we'll want to cache the DB lookup.  Since we might come along and alter the values in Parameters, we want our cache to time-out quickly, so that the query picks up new values when we enter them.

	' Is the value between the Parameter start and end dates
	Function BetweenParameterStartEnd(ByVal t As Variant) As Boolean
		Dim db As Database
		Dim rs As Recordset
		Static StartDate As Date
		Static EndDate As Date
		Static CachedAt As Date
		Dim s As String
		
		BetweenParameterGenericStartEnd = False
		
		' IF the cache is old, re-cache it.
		If DateDiff("s", CachedAt, Now()) > 60 Then
			CachedAt = Now
			Set db = CurrentDb
			s = "select StartDate, DayAfterEnd from Parameters"
			CachedAt = Now
			Set rs = db.OpenRecordset(s, dbOpenSnapshot, dbReadOnly)
			rs.MoveLast: rs.MoveFirst
			If rs.RecordCount <> 1 Then
				MsgBox "The Parameters table should always have 1 record in it."
				Stop
				End
			End If
			GenericStartDate = rs("StartDate")
			GenericEndDate = rs("DayAfterEnd")
		End If
		
		If t >= StartDate And t < EndDate Then
			BetweenParameterStartEnd = True
		End If
		
	End Function
