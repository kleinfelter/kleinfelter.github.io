---
categories: []
layout: post
title: Make Evernote Copy a Classic Note Link As RTF With a Keystroke
created: 1424143441
redirect_from: /content/make-evernote-copy-classic-note-link-rtf-keystroke
---
When you have a huge Evernote library, it can be a bother to navigate to a desired note.  To ease this, you might use Note Links.  Evernote used to copy URLs that looked like evernote:///blah-blah.  Somewhere along the way, they changed this to https://www.evernote.com/blah2-blah2.

The new behavior is lovely except...

1. When you click on the link, it opens a browser page AND it opens an Evernote note.  Then you have to remember to find and close the extra browser tab.
1. If you aren't connected to the Internet, you aren't going to open anything but an error page.

They call the evernote:/// scheme "Classic Note Link" and the https:/// scheme a "Note Link".

I wanted to make Evernote copy a classic note link when I pressed Alt-Cmd-C.  Here's the recipe.

* Download https://dl.dropboxusercontent.com/u/7107976/Evernote/AppleScripts/Copy%20EN%20Note%20Link%20%28Classic%29.scpt.zip
    * I saved a copy as "Copy EN Note Link (Classic).scpt.zip", just in case the dropbox share goes down.  The code is also at the end of this posting.
* Open Automator, create a Service, and drag the "Run AppleScript" action into the right pane.
* Make the body of the AppleScript be the content of "Copy EN Note Link (Classic).scpt".
* At the top of the right panel, set "Service receives: No Input in Evernote.app"
* Save the workflow as Evernote-Copy-Classic-Link
* Confirm that the service is available on Evernote's Service menu.
* In Evernote go to Evernote >> Services >> Service Preferences
* Scroll down to near the bottom and click on Evernote-Copy-Classic-Link
* On the right-hand side of the Evernote-Copy-Classic-Link row, click on the spot to define a keystroke.
* Press Alt-Cmd-C


-----
<code>
<pre>
tell application "Evernote"
	
	set _sel to selection -- Gets the Note(s) Selected in Evernote
	if _sel ≠ {} then
		set aNote to first item of _sel -- Get ONLY the 1st Note
		set noteTitle to (get title of aNote)
		set noteLink to (get note link of aNote)
		my copyLinkToClipboardAsRTF(noteLink, noteTitle)
		
	end if
end tell

--=====================================
--	SUBPROGRAMS
--=====================================

on copyLinkToClipboardAsRTF(pURL, plinkText)
	
	
	(*
	------------------------------------------------------------------------------
	PURPOSE:  Creates click-able HTML Link and Copies to Clipboard as RTF
				A normal user paste should work into most, if not all, apps that support RTF
				
	DATE:	Sat, Jul 19, 2014		VER: 1.0
	
	COMMENTS:
		•  Can't use the AppleScript "set the clipboard to" command because it will just copy the link as plain text
		•  I don't understand the data in the "set cmd to" line, but it seems to work
		• The HTML version of this is:  <a href="url">Link text</a>
	REF:  
		• soboks post on MacScripter.net forum, 2008-07-24
			http://macscripter.net/viewtopic.php?pid=102416#p102416
	-------------------------------------------------------------------------------
	*)
	
	set cmd to "\"{\\rtf1\\ansi\\ansicpg1252\\cocoartf949\\cocoasubrtf270{\\fonttbl\\f0\\fswiss\\fcharset0 Helvetica;}{\\colortbl;\\red255\\green255\\blue255;}\\margl1440\\margr1440\\vieww9000\\viewh8400\\viewkind0\\pard\\tx720\\tx1440\\tx2160\\tx2880\\tx3600\\tx4320\\tx5040\\tx5760\\tx6480\\tx7200\\tx7920\\tx8640\\ql\\qnatural\\pardirnatural{\\field{\\*\\fldinst{HYPERLINK \"" & pURL & "\"}}{\\fldrslt\\f0\\fs24 \\cf0 \"" & plinkText & "\"}}}\""
	
	do shell script "/bin/bash -c 'echo " & cmd & " | pbcopy -Prefer rtf'"
	
	return
	
end copyLinkToClipboardAsRTF
</pre>
</code>
