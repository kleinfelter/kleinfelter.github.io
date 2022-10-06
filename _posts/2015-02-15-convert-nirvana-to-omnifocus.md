---
categories: []
layout: post
title: Convert Nirvana to OmniFocus
created: 1424052645
redirect_from: /content/convert-nirvana-omnifocus
---
I have been using Nirvana for my task list.  I'd like to try OmniFocus.  To get there, I had to convert my data.

First step is to export Nirvana data to CSV from their web site.  The export isn't perfect.  They don't identify which reference-items belong to which reference lists, for example.

Then import, using the following AppleScript.  IT isn't perfect, but it is a good start.

<code>
<pre>
set theFile to (choose file with prompt "Select input file:" of type {"csv"})

global myOnHold, myActive, myDone, singletonProject, whenCowsComeHome
set taskLimit to 99000
set whenCowsComeHome to date "Thursday, December 31, 2099 at 1:00:00 PM"

set RefListName to "Reference Lists"
set RefListManualName to "Reference Item to Manually Move to Reference List"
tell application "OmniFocus"
	set myOnHold to on hold
	set myActive to active
	set myDone to done
end tell

set progress total steps to 1
set progress additional description to "Starting up"
-- set progress completed steps to 1

-- First item is just column names, and it may contain a UTF BOM
set firstTime to true
set debugging to false
set myCounter to 1

set refList to mkFolder(RefListName)
set refListBad to mkProject(RefListManualName, myOnHold, "")
set singletonProject to mkProject("Miscellaneous", myActive, "")
tell application "OmniFocus" to tell default document to set singleton action holder of singletonProject to true
tell application "OmniFocus" to tell default document to set default singleton action holder of singletonProject to true

-- I use att and kpk as "Areas of Responsibility"
set kpkList to mkFolder("kpk")
set attList to mkFolder("att")

set csvText to csvToList(read theFile, {})
set progress completed steps to 1

set progress total steps to count of csvText
set progress additional description to "Projects"

with timeout of 300 seconds
	
	---------------------------------------------------------------------
	-- first time through, create projects
	---------------------------------------------------------------------
	repeat with anItem in csvText
		if not firstTime then
			set {aType, aParent, aState, aCompleted, aFocus, aName, aTags, aTime, aEnergy, aWaitingFor, aStartDate, aDueDate, aNotes} to text items of anItem
			if aType is "Project" and aState is not "Trash" then
				if aState = "" then
					-- these are reference lists (Standalone), or items within reference lists (Standalone*).
					if aParent = "Standalone" then
						set newProj to mkProject(aName, myOnHold, aNotes)
						-- handleFocus(aFocus, newProj)  -- I do not focus my reference lists
						-- handleCompleted(aCompleted, newProj)  -- reference lists never get marked complete!
						moveItemToFolderName(newProj, RefListName)
					end if
				else
					set newProj to mkProject(aName, nirvanaStatusToOmniFocus(aState), aNotes)
					handleFocus(aFocus, newProj)
					handleCompleted(aCompleted, newProj)
					
					-- I use att and kpk as "Areas of Responsibility"
					set splitTags to split(aTags, ",")
					if splitTags contains "att" then
						moveItemToFolderName(newProj, "att")
					else if splitTags contains "kpk" then
						moveItemToFolderName(newProj, "kpk")
					end if
				end if
			end if
		end if
		set firstTime to false
		set progress completed steps to myCounter
		set progress additional description to "Projects, record " & myCounter as text
		set myCounter to myCounter + 1
	end repeat
	
	-- display dialog "Completed projects.  Continue to Tasks?" giving up after 30000
	
	set firstTime to true
	set myCounter to 1
	set progress total steps to count of csvText
	set progress additional description to "Tasks"
	
	---------------------------------------------------------------------
	-- next time through, create tasks
	---------------------------------------------------------------------
	repeat with anItem in csvText
		if not firstTime then
			set {aType, aParent, aState, aCompleted, aFocus, aName, aTags, aTime, aEnergy, aWaitingFor, aStartDate, aDueDate, aNotes} to text items of anItem
			if aState is not "Trash" then
				if aType is "Project" and aState is "" and aParent is "Standalone*" then
					-- these are reference lists (Standalone), or items within reference lists (Standalone*).
					--				display dialog "adding reference item:" & aName giving up after 30000
					tell application "OmniFocus" to tell refListBad to set newTask to make new task with properties {name:aName, defer date:whenCowsComeHome}
					-- handleCompleted(aCompleted, newTask) -- do not "complete" reference list items.
					-- handleFocus(aFocus, newTask)  -- I do not focus my reference lists.
					moveTaskToProjectBasedOnTag(newTask, aTags)
					
				else if aType is equal to "Task" then
					set newTask to mkTask(aName, aParent, aState, aTags)
					handleFocus(aFocus, newTask)
					handleStartDate(aStartDate, newTask)
					handleDueDate(aDueDate, newTask)
					handleTaskNote(aNotes, newTask)
					if aState is "Someday" and aStartDate is "" then
						tell application "OmniFocus" to tell default document to set defer date of newTask to (current date) + weeks * 56 + (days * (random number from 1 to 30))
					end if
					if aState is "Inactive/Later" and aStartDate is "" then
						tell application "OmniFocus" to tell default document to set defer date of newTask to (current date) + (days * 14) + (days * (random number from 1 to 7))
					end if
					handleCompleted(aCompleted, newTask)
				end if
			end if
		end if
		set firstTime to false
		set progress completed steps to myCounter
		set progress additional description to "Tasks, record " & myCounter as text
		set myCounter to myCounter + 1
		if myCounter > taskLimit then
			display dialog "Quit early at task limit" giving up after 30000
			error number -128
		end if
	end repeat
	display dialog "Caution.  \nThe repeat pattern on repeating tasks is not exported by Nirvana, so I can't import that.  These items have had ' #REPEATING' appended  to the subject.\r\n\n* Nirvana does not export sequetian/parallel.  All projects have been marked sequential (because I'm feeling overwhelmed).\n* Tags have been dropped, because OmniFocus does not do tags.\n* Someday tasks are brought in with a start date of now + 13 months plus a random number of days (so you don't have to deal with them all at once)\n* 'Later' tasks come in as startDate of now + 2 weeks plus a small random number of days." giving up after 30000
end timeout

(* 
  From Nigel Garvey at http://macscripter.net/viewtopic.php?id=32322 ...
  Assumes that the CSV text adheres to the convention:
   Records are delimited by LFs or CRLFs (but CRs are also allowed here).
   The last record in the text may or may not be followed by an LF or CRLF (or CR).
   Fields in the same record are separated by commas (unless specified differently by parameter).
   The last field in a record must not be followed by a comma.
   Trailing or leading spaces in unquoted fields are not ignored (unless so specified by parameter).
   Fields containing quoted text are quoted in their entirety, any space outside them being ignored.
   Fields enclosed in double-quotes are to be taken verbatim, except for any included double-quote pairs, which are to be translated as double-quote characters.
       
   No other variations are currently supported. *)

on csvToList(csvText, implementation)
	-- The 'implementation' parameter must be a record. Leave it empty ({}) for the default assumptions: ie. comma separator, leading and trailing spaces in unquoted fields not to be trimmed. Otherwise it can have a 'separator' property with a text value (eg. {separator:tab}) and/or a 'trimming' property with a boolean value ({trimming:true}).
	set {separator:separator, trimming:trimming} to (implementation & {separator:",", trimming:false})
	
	script o -- Lists for fast access.
		property qdti : getTextItems(csvText, "\"")
		property currentRecord : {}
		property possibleFields : missing value
		property recordList : {}
	end script
	
	-- o's qdti is a list of the CSV's text items, as delimited by double-quotes.
	-- Assuming the convention mentioned above, the number of items is always odd.
	-- Even-numbered items (if any) are quoted field values and don't need parsing.
	-- Odd-numbered items are everything else. Empty strings in odd-numbered slots
	-- (except at the beginning and end) indicate escaped quotes in quoted fields.
	
	set astid to AppleScript's text item delimiters
	set qdtiCount to (count o's qdti)
	set quoteInProgress to false
	considering case
		repeat with i from 1 to qdtiCount by 2 -- Parse odd-numbered items only.
			set thisBit to item i of o's qdti
			if ((count thisBit) > 0) or (i is qdtiCount) then
				-- This is either a non-empty string or the last item in the list, so it doesn't
				-- represent a quoted quote. Check if we've just been dealing with any.
				if (quoteInProgress) then
					-- All the parts of a quoted field containing quoted quotes have now been
					-- passed over. Coerce them together using a quote delimiter.
					set AppleScript's text item delimiters to "\""
					set thisField to (items a thru (i - 1) of o's qdti) as string
					-- Replace the reconstituted quoted quotes with literal quotes.
					set AppleScript's text item delimiters to "\"\""
					set thisField to thisField's text items
					set AppleScript's text item delimiters to "\""
					-- Store the field in the "current record" list and cancel the "quote in progress" flag.
					set end of o's currentRecord to thisField as string
					set quoteInProgress to false
				else if (i > 1) then
					-- The preceding, even-numbered item is a complete quoted field. Store it.
					set end of o's currentRecord to item (i - 1) of o's qdti
				end if
				
				-- Now parse this item's field-separator-delimited text items, which are either non-quoted fields or stumps from the removal of quoted fields. Any that contain line breaks must be further split to end one record and start another. These could include multiple single-field records without field separators.
				set o's possibleFields to getTextItems(thisBit, separator)
				set possibleFieldCount to (count o's possibleFields)
				repeat with j from 1 to possibleFieldCount
					set thisField to item j of o's possibleFields
					if ((count thisField each paragraph) > 1) then
						-- This "field" contains one or more line endings. Split it at those points.
						set theseFields to thisField's paragraphs
						-- With each of these end-of-record fields except the last, complete the field list for the current record and initialise another. Omit the first "field" if it's just the stub from a preceding quoted field.
						repeat with k from 1 to (count theseFields) - 1
							set thisField to item k of theseFields
							if ((k > 1) or (j > 1) or (i is 1) or ((count trim(thisField, true)) > 0)) then set end of o's currentRecord to trim(thisField, trimming)
							set end of o's recordList to o's currentRecord
							set o's currentRecord to {}
						end repeat
						-- With the last end-of-record "field", just complete the current field list if the field's not the stub from a following quoted field.
						set thisField to end of theseFields
						if ((j < possibleFieldCount) or ((count thisField) > 0)) then set end of o's currentRecord to trim(thisField, trimming)
					else
						-- This is a "field" not containing a line break. Insert it into the current field list if it's not just a stub from a preceding or following quoted field.
						if (((j > 1) and ((j < possibleFieldCount) or (i is qdtiCount))) or ((j is 1) and (i is 1)) or ((count trim(thisField, true)) > 0)) then set end of o's currentRecord to trim(thisField, trimming)
					end if
				end repeat
				
				-- Otherwise, this item IS an empty text representing a quoted quote.
			else if (quoteInProgress) then
				-- It's another quote in a field already identified as having one. Do nothing for now.
			else if (i > 1) then
				-- It's the first quoted quote in a quoted field. Note the index of the
				-- preceding even-numbered item (the first part of the field) and flag "quote in
				-- progress" so that the repeat idles past the remaining part(s) of the field.
				set a to i - 1
				set quoteInProgress to true
			end if
		end repeat
	end considering
	
	-- At the end of the repeat, store any remaining "current record".
	if (o's currentRecord is not {}) then set end of o's recordList to o's currentRecord
	set AppleScript's text item delimiters to astid
	
	return o's recordList
end csvToList

-- Get the possibly more than 4000 text items from a text.
on getTextItems(txt, delim)
	set astid to AppleScript's text item delimiters
	set AppleScript's text item delimiters to delim
	set tiCount to (count txt's text items)
	set textItems to {}
	repeat with i from 1 to tiCount by 4000
		set j to i + 3999
		if (j > tiCount) then set j to tiCount
		set textItems to textItems & text items i thru j of txt
	end repeat
	set AppleScript's text item delimiters to astid
	
	return textItems
end getTextItems

-- From Nigel Garvey at http://macscripter.net/viewtopic.php?id=32322 ...
-- Trim any leading or trailing spaces from a string.
on trim(txt, trimming)
	if (trimming) then
		repeat with i from 1 to (count txt) - 1
			if (txt begins with space) then
				set txt to text 2 thru -1 of txt
			else
				exit repeat
			end if
		end repeat
		repeat with i from 1 to (count txt) - 1
			if (txt ends with space) then
				set txt to text 1 thru -2 of txt
			else
				exit repeat
			end if
		end repeat
		if (txt is space) then set txt to ""
	end if
	
	return txt
end trim

on mkFolder(fname)
	with timeout of 300 seconds
		tell application "OmniFocus"
			tell front document
				if not (folder fname exists) then
					make new folder with properties {name:fname}
				end if
				return first folder whose name is fname
			end tell
		end tell
	end timeout
end mkFolder

on mkProject(pname, pstatus, pnotes)
	with timeout of 300 seconds
		
		tell application "OmniFocus"
			tell front document
				if (flattened project pname exists) then
					return first flattened project whose name is pname
				end if
				set tmpProject to make new project with properties {name:pname, status:pstatus, note:pnotes}
				--				if pnotes is not "" then
				--					set note of tmpProject to pnotes
				--				end if
				
				set sequential of tmpProject to true
				return tmpProject
			end tell
		end tell
	end timeout
end mkProject

on nirvanaStatusToOmniFocus(aState)
	if aState is "Active" then
		return myActive
	else if aState is "Logbook" then
		return myDone
	else if aState is "Someday" then
		return myOnHold
	else
		display dialog "Unable to convert state:" & aState giving up after 30000
		error number -128
	end if
end nirvanaStatusToOmniFocus

on moveItemToFolderName(aProj, aFolder)
	with timeout of 300 seconds
		
		tell application "OmniFocus"
			tell front document
				move aProj to (end of sections of (first folder whose name is aFolder))
			end tell
		end tell
	end timeout
end moveItemToFolderName

on split(theString, theDelimiter)
	-- save delimiters to restore old settings
	set oldDelimiters to AppleScript's text item delimiters
	-- set delimiters to delimiter to be used
	set AppleScript's text item delimiters to theDelimiter
	-- create the array
	set theArray to every text item of theString
	-- restore the old setting
	set AppleScript's text item delimiters to oldDelimiters
	-- return the result
	return theArray
end split


on moveTaskToProject(aTask, aProjectName)
	with timeout of 300 seconds
		-- set progress additional description to aProjectName
		if isProjectName(aProjectName) then
			tell application "OmniFocus"
				tell default document
					set theProject to (first flattened project whose name is aProjectName)
					move aTask to end of tasks of theProject
				end tell
			end tell
		end if
	end timeout
end moveTaskToProject

on moveTaskToProjectBasedOnTag(aTask, aTags)
	with timeout of 300 seconds
		set myList to my split(aTags, ",")
		repeat with theItem in myList
			if isProjectName(theItem) then
				tell application "OmniFocus"
					tell default document
						set theProject to (first flattened project whose name is theItem)
						move aTask to end of tasks of theProject
					end tell
				end tell
				return
			end if
		end repeat
	end timeout
	display dialog "Nirvana does not identify the parent of a reference item in the export.  If you will tag the ITEMS (not the containing list) with the name of the reference list (exactly), that will also tag the items and  I can use that to put it in the right list." giving up after 30000
	error number -128
end moveTaskToProjectBasedOnTag


on isProjectName(aName)
	with timeout of 300 seconds
		-- handle the special case, testing for a literal, because it is faster than talking to OmniFocus
		if aName is "Standalone" then
			return false
		end if
		
		tell application "OmniFocus"
			tell default document
				if flattened project aName exists then
					return true
				else
					return false
				end if
			end tell
		end tell
	end timeout
end isProjectName

-- It is an active task if Parent is Standalone or project; state is Next or Inbox
on mkTask(aName, inParent, aState, aTags)
	with timeout of 300 seconds
		set tmpName to aName
		if aState is "Scheduled/Repeating" then
			set tmpName to aName & " #REPEATING"
		end if
		
		set aParent to inParent
		if aParent is "Standalone" or aParent is "Standalone*" then
			set aParent to "Miscellaneous"
		end if
		
		tell application "OmniFocus"
			tell default document
				if flattened project aParent exists then
					set interestingProject to first flattened project whose name is aParent
					if task tmpName of interestingProject exists then
						set interestingTask to first task of interestingProject whose name is tmpName
						delete interestingTask
					end if
				end if
				set newTask to make new inbox task with properties {name:tmpName}
			end tell
		end tell
		
		if aState is "Inbox" then
			-- nothing.  Leave it in Inbox, where it was created
		else if aState is "Next" or aState is "Scheduled" or aState is "Scheduled/Repeating" or aState is "Someday" or aState is "Inactive/Later" or aState is "Logbook" then
			moveTaskToProject(newTask, aParent)
		else
			display dialog "Unexpected state:" & aState & " for task:" & aName giving up after 30000
		end if
		
		if aState is "Logbook" then
			tell application "OmniFocus"
				tell default document
					set completed of newTask to true
				end tell
			end tell
		end if
		
	end timeout
	return newTask
end mkTask

--  convert yyyy-mm-dd to mm/dd/yyyy STRING
on parseNirvanaDate(nvDate)
	set yyyy to text 1 thru 4 of nvDate
	set mm to text 6 thru 7 of nvDate
	set dd to text 9 thru 10 of nvDate
	return date (mm & "/" & dd & "/" & yyyy & " 1:00:00 PM")
end parseNirvanaDate


on handleFocus(aFocus, aItem)
	with timeout of 300 seconds
		if aFocus is "Yes" then
			tell application "OmniFocus" to tell default document to set flagged of aItem to true
		end if
	end timeout
end handleFocus

on handleCompleted(aCompleted, aItem)
	-- if class of aItem as string is "project" then
	--	display dialog ("aCompleted:" & aCompleted & ", class:" & class of aItem as string) & ", " & name of aItem
	-- end if
	with timeout of 300 seconds
		if aCompleted is not "" then
			tell application "OmniFocus"
				tell default document
					if (class of aItem as string) is "project" then
						set status of aItem to done
					else
						set completed of aItem to true
					end if
					set completion date of aItem to my parseNirvanaDate(aCompleted)
				end tell
			end tell
			
		end if
	end timeout
end handleCompleted

on handleStartDate(aStartDate, aItem)
	with timeout of 300 seconds
		if aStartDate is not "" then
			tell application "OmniFocus" to tell default document to set defer date of aItem to my parseNirvanaDate(aStartDate)
		end if
	end timeout
end handleStartDate

on handleDueDate(aDueDate, aItem)
	with timeout of 300 seconds
		if aDueDate is not "" then
			set tmpDate to parseNirvanaDate(aDueDate)
			tell application "OmniFocus"
				tell default document
					set due date of aItem to tmpDate
				end tell
			end tell
		end if
	end timeout
end handleDueDate


on handleTaskNote(aNotes, aTask)
	with timeout of 300 seconds
		tell application "OmniFocus" to tell default document to set note of aTask to aNotes
	end timeout
end handleTaskNote

</pre>
</code>
