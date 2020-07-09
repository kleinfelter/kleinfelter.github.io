---
categories: []
layout: post
title: Export Everything From Evernote
created: 1489248016
redirect_from: /content/export-everything-evernote
---
I'm [leaving Evernote](/content/leaving-evernote).  Here's a script I wrote to export everything from Evernote.

    -- Evernote-Export-All: Export everything from Evernote.
    -- Copyright (c) 2017 by Kevin P. Kleinfelter

    -- **********************************************************
    -- Assumptions:
    --   * If you have notes with PDF attachments, they have only one PDF attachment and no body. (Error message if not true.)
    --      If this isn't the case, edit your notes to make it the case.  ENML editor is helpful.
    --      You could print the note body to PDF, then combine the body-PDF with the attached PDF into a 
    --      new single PDF, but many of my notes-with-PDF had a body with a blank line.  (You might
    --      think you could delete the blank line with Evernote, but EN adds a bunch of markup
    --      which it does not remove when you delete the blank line, so use ENML editor.)
    --      For notes where you really want the note body followed by PDF attachment(s),
    --      print the note to PDF, which will produce multiple PDFs, and then manually combine
    --      the PDFs into  a single PDF.
    --   * Must copy your TagLibrary.scptd source file (which was in my ~/Documents/code/AppleScripts folder, 
    --      as of December 2016) to "~/Library/Script Libraries".  You may have to mkdir "Script Libraries"
    --
    -- Learnings/disappointments:
    --   * AppleScript does not have access to Evernote Stacks.  "Use the full API" says Support.
    -- **********************************************************

    -- **********************************************************
    use tagLib : script "TagLibrary"
    use scripting additions

    -- ************************************************************

    -- Dev and Debug options
    set limitToNotebook to ""
    set scanOnly to false -- don't write anything.  Just report metrics and problems.
    set ensureDataQuality to true
    -- ************************************************************

    set exportFolder to "/Users/kevin/Temp/Evernote-export"
    set totalNoteCount to 0
    set onePdfCount to 0 -- Notes with a single PDF attached.
    set oneImageCount to 0 -- Notes with a single image attached and no body.
    set htmlCount to 0 -- Notes exported as HTML
    set simpleCount to 0 -- Notes exported as single file
    set newline to "
    "

    -- **********************************************************


    -- **********************************************************
    -- **********************************************************
    set kount to 0
    display dialog "Have you cleared the old export folder and are you showing log messages?"

    with timeout of (1000 * 60) seconds
        if ensureDataQuality then
            fixBadNoteNames()
            findDuplicateNoteNames()
        else
            display dialog "Re-enable data quality checks"
        end if
    
        tell application id "com.evernote.evernote"
        
            if notebook named "temp_export_notebook" exists then delete notebook "temp_export_notebook"
            create notebook "temp_export_notebook" with type local only
        
            if my limitToNotebook = "" then
                set allNotebooks to every notebook
            else
                display dialog "limited to notebook " & limitToNotebook
                set allNotebooks to notebook named limitToNotebook
            end if
        
            repeat with currentNoteBook in allNotebooks
                set notebookName to (the name of currentNoteBook)
                log "0, NOTEBOOK, " & notebookName
            
                set allNotes to every note in notebook notebookName
                repeat with currentNote in allNotes
                    set totalNoteCount to (totalNoteCount + 1)
                    set theHtml to HTML content of currentNote
                    set noteTitle to (the title of currentNote)
                
                    if (count of attachments of currentNote) = 0 then
                        my exportSingleFile(currentNote, notebookName)
                    else if (count of attachments of currentNote) = 1 then
                        set myMime to mime of first attachment of currentNote
                    
                        if myMime = "application/pdf" then
                            if (my countSubstring(theHtml, "</div>")) > 1 then
                                log "Notes with PDF attachments must have no body. Violation:" & noteTitle
                                display dialog theHtml
                                my die("Notes with PDF attachments must have no body.  Violation:" & noteTitle)
                            end if
                        
                            my exportToPdf(currentNote, noteTitle, notebookName)
                        else if (my isSingleImageOnly(myMime, theHtml)) then
                            my exportToImage(currentNote, noteTitle, notebookName, my mimeToFileType(myMime))
                        else
                            my exportToHtml(currentNote, notebookName)
                        end if
                    else -- Multiple attachments
                        repeat with theAttachment in (attachments of currentNote)
                            if mime of theAttachment = "application/pdf" then
                                my die("Not implemented: Multiple attachments with a PDF. " & noteTitle)
                            end if
                        end repeat
                    
                        my exportToHtml(currentNote, notebookName)
                    end if
                end repeat -- repeat with currentNoteBook in allNotebooks
            end repeat
            if notebook named "temp_export_notebook" exists then delete notebook "temp_export_notebook"
        end tell
        my die("Successfully completed")
    end timeout


    -- Sample of image-only note:
    -- <div id="en-note"><img src="?hash=12345" id="en-media:image/png:12345:none:none" class="en-media"/></div>
    on isSingleImageOnly(myMime, theHtml)
        if myMime is not equal to "image/png" and myMime is not equal to "image/jpeg" then return false
    
        set prefix to "<div id=\"en-note\"><img src=\"?hash="
    
        if theHtml starts with prefix or theHtml starts with (my newline & prefix) then
            -- continue
        else
            return false
        end if
    
        if (countSubstring(theHtml, "</div>")) ≠ 1 then return false
    
        set s to RemoveFromString(theHtml, "<div id=\"en-note\"><img src=\"?hash=")
        set s to RemoveFromString(s, "</div>")
    
        if (countSubstring(s, "<") > 0) then return false
        if (countSubstring(s, ">") > 1) then return false
    
        if (my countSubstring(theHtml, "en-media:image/png")) = 1 then return true
        if (my countSubstring(theHtml, "en-media:image/jpeg")) = 1 then return true
    
        return false
    end isSingleImageOnly


    on findDuplicateNoteNames()
        do shell script "rm -f /tmp/evernote-titles.txt"
        set foundDuplicates to false
        tell application "Evernote"
            set EVNotebooks to every notebook
            repeat with EVnotebook in EVNotebooks
                log "0, message, Finding duplicate titles in " & name of EVnotebook
                set allNotes to {}
                set allNotes to every note in EVnotebook
                repeat with aNote in allNotes
                    set aTitle to title of aNote
                    set aTitle to my filenameSafe(aTitle) -- comment
                    do shell script "echo '" & aTitle & "' >> /tmp/evernote-titles.txt"
                end repeat
            end repeat
        end tell
    
        do shell script "sort /tmp/evernote-titles.txt | uniq -d > /tmp/evernote-duplicates.txt"
        set s to do shell script "cat /tmp/evernote-duplicates.txt"
        if length of s > 4 then
            with timeout of 30000 seconds -- wait 500 minutes
                display dialog "Duplicate note names found.  Please fix. " & s
            end timeout
        end if
    end findDuplicateNoteNames



    on fixBadNoteNames()
        tell application "Evernote"
            set EVNotebooks to every notebook
            repeat with EVnotebook in EVNotebooks
                log "0, message, Fixing note titles in " & name of EVnotebook
                set allNotes to {}
                set allNotes to every note in EVnotebook
                repeat with aNote in allNotes
                    set originalTitle to title of aNote
                    set newTitle to my filenameSafe(originalTitle)
                    if newTitle ≠ originalTitle then
                        --	display dialog "Renaming '" & originalTitle & "' to '" & newTitle & "'"
                        set title of aNote to newTitle
                    end if
                end repeat
            end repeat
        end tell
    end fixBadNoteNames


    -- **********************************************************
    -- **********************************************************
    on mkDir(pathName)
        do shell script "mkdir -p '" & pathName & "'"
    end mkDir


    -- **********************************************************
    -- From https://geert.vanderkelen.org/2010/splitting-as-string-and-joining-a-list-using-applescript/
    -- **********************************************************
    to joinList(aList, delimiter)
        set retVal to ""
        set prevDelimiter to AppleScript's text item delimiters
        set AppleScript's text item delimiters to delimiter
        set retVal to aList as string
        set AppleScript's text item delimiters to prevDelimiter
        return retVal
    end joinList


    -- **********************************************************
    -- I tried asking Evernote for the Note's HTML and writing that to a file, but I found some notes would contain 
    -- a byte with hex CA that Evernote rendered as a space but HTML viewers and file editors showed that byte as an E with an accent.
    -- Telling Evernote to *export* the note did not have that problem.  However, exporting the note
    -- puts the HTML into a folder, and I'd prefer that simple HTML notes not go into a folder which will contain only
    -- the one file.
    -- 
    -- Unfortunately, the note exports without the note TITLE when you tell Evernote to export it.
    -- That note title renders very visibly in Evernote so I think of it as part of the note.
    -- Adding a title to the output was easy when I wrote the HTML directly, because Evernote gave me 
    -- the HTML for the BODY of the page (without the <html> or the <body> tags) so I could just prepend the title.
    -- When I ask Evernote to do the export, I need to add the title before exporting.
    --
    -- OK, Evernote got really slow when I started creating temp notes to add the title.  I'm going to export the note
    -- and then "sed" (or similar) the html to add a title.
    --
    -- I'm going to convert these from HTML to RTF.  I can get away with this because they have no attachments/images.
    -- By converting them to RTF, if I double-click on the resultant file, it will open with an editor, and if it is a
    -- hand-created note (as much of these are), it is probably some kind of list or brainstorming document that I want
    -- to edit as often as to view.
    --
    -- Nope.  RTF is a bad idea.  The conversion to RTF loses column-widths, which some web site captured data
    -- uses.  Best to stick with HTML and I'll manually convert files I want to routinely edit.  
    -- (Or I can add an HTML editor to the open-with list.)
    -- **********************************************************
    on exportSingleFile(currentNote, notebookName)
        set my simpleCount to ((my simpleCount) + 1)
        if my scanOnly then return
    
        set sanitizedNotebookName to my filenameSafe(notebookName)
        set htmlFolderPath to my exportFolder & "/" & sanitizedNotebookName
        mkDir(htmlFolderPath)
        set noteAsList to {}
    
        tell application id "com.evernote.evernote"
            set noteTitle to title of currentNote
            set safeNoteTitle to my filenameSafe(noteTitle)
            set exportFilename to htmlFolderPath & "/" & safeNoteTitle & ".html"
        end tell
        set beginning of noteAsList to currentNote
    
        if not my scanOnly then
            log my totalNoteCount & " Single:" & exportFilename
            tell application id "com.evernote.evernote" to export noteAsList to "/tmp/tmp_evernote_export" format HTML with tags
        
            do shell script "mv /tmp/tmp_evernote_export/* '/tmp/tmp_evernote_export/" & safeNoteTitle & ".html'"
        
        
            -- ****** Add the note title to the note ******
            set perlCmd to "perl -pi -e 's/<(body.*?)>/<\\1>"
            set perlCmd to perlCmd & "<div style=\"font-size:16pt;line-height: 140%;font-family:Helvetica Neue, Helvetica, Arial, sans-serif\">"
            set perlCmd to perlCmd & safeNoteTitle
            set perlCmd to perlCmd & "<\\/div><br>"
            set perlCmd to perlCmd & "/' " & "'/tmp/tmp_evernote_export/" & safeNoteTitle & ".html'"
        
            set perlCmd to perlCmd & " 2>>/tmp/tmp_evernote_perl.err"
            do shell script perlCmd
        
        
            -- ***** Apply a default body font ------
        
            set perlCmd to "perl -pi -e 's/(<\\/head><body)/\\1"
            set perlCmd to perlCmd & " style=\"font-weight:380;font-size:10.5pt;line-height: 130%;font-family:Helvetica Neue, Helvetica, Arial, sans-serif\""
            set perlCmd to perlCmd & "/' " & "'/tmp/tmp_evernote_export/" & safeNoteTitle & ".html'"
        
            set perlCmd to perlCmd & " 2>>/tmp/tmp_evernote_perl.err"
            do shell script perlCmd
        
        
            do shell script "mv /tmp/tmp_evernote_export/*.html '" & exportFilename & "'"
        
            applyAttributesToFile(currentNote, exportFilename)
        
            -- do shell script "textutil -convert rtf '/tmp/tmp_evernote_export/" & my filenameSafe(noteTitle) & ".html' -o '" & exportFilename & "'"
        
        end if
    
    end exportSingleFile


    -- Update the file metadata with metadata from Evernote.
    on applyAttributesToFile(currentNote, exportFilename)
        if my scanOnly then return
    
        -- Tags
        tell application "Evernote"
            set noteTags to the tags of currentNote
            if (count of (tags of currentNote)) > 0 then
                set tagStrings to my tagsToStrings(noteTags)
                tagLib's setTags:tagStrings forPath:(exportFilename)
            end if
        end tell
    
        -- Creation Date and Modification Date
        tell application "Evernote" to set cdate to creation date of currentNote
        tell application "Evernote" to set mdate to modification date of currentNote
    
        set s_cdate to "\"" & timestampReformat(cdate) & "\""
        set s_mdate to "\"" & timestampReformat(mdate) & "\""
    
        do shell script "SetFile -d " & s_cdate & " \"" & exportFilename & "\""
        do shell script "SetFile -m " & s_mdate & " \"" & exportFilename & "\""
    
    end applyAttributesToFile

    on tagsToStrings(noteTags)
        set ret to {}
        repeat with t in noteTags
            copy (name of t) to the end of the ret
        end repeat
        return ret
    end tagsToStrings

    -- **********************************************************
    -- **********************************************************
    on exportToImage(currentNote, noteTitle, notebookName, fileType)
        set my oneImageCount to ((my oneImageCount) + 1)
    
        if my scanOnly then return
    
        tell application id "com.evernote.evernote" to set theAttachment to first attachment of currentNote
        set sanitizedNotebookName to my filenameSafe(notebookName)
        set imageFolderPath to my exportFolder & "/" & sanitizedNotebookName
        mkDir(imageFolderPath)
    
        set exportFilename to imageFolderPath & "/" & my filenameSafe(noteTitle) & fileType
        try
            do shell script "rm '" & exportFilename & "'"
        end try
        tell application id "com.evernote.evernote"
            write theAttachment to exportFilename
        end tell
        applyAttributesToFile(currentNote, exportFilename)
    
        log my totalNoteCount & "Image:" & exportFilename
    
    end exportToImage

    -- **********************************************************
    -- **********************************************************
    on exportToPdf(currentNote, noteTitle, notebookName)
        set my onePdfCount to ((my onePdfCount) + 1)
        if my scanOnly then return
    
        tell application id "com.evernote.evernote" to set theAttachment to first attachment of currentNote
        set sanitizedNotebookName to my filenameSafe(notebookName)
        set pdfFolderPath to my exportFolder & "/" & sanitizedNotebookName
        mkDir(pdfFolderPath)
    
        set exportFilename to pdfFolderPath & "/" & my filenameSafe(noteTitle) & ".pdf"
        set exportFilename to replaceString(exportFilename, ".pdf.pdf", ".pdf")
        set exportFilename to replaceString(exportFilename, ".PDF.pdf", ".pdf")
        set exportFilename to replaceString(exportFilename, ".pdf.PDF", ".pdf")
        set exportFilename to replaceString(exportFilename, ".PDF.PDF", ".pdf")
        try
            do shell script "rm '" & exportFilename & "'"
        end try
        tell application id "com.evernote.evernote"
            write theAttachment to exportFilename
        end tell
        applyAttributesToFile(currentNote, exportFilename)
    
        log my totalNoteCount & "PDF:" & exportFilename
    
    end exportToPdf



    -- **********************************************************
    -- **********************************************************
    on exportToHtml(currentNote, notebookName)
        if my scanOnly then return
        set noteAsList to {}
        set beginning of noteAsList to currentNote
        set sanitizedNotebookName to my filenameSafe(notebookName)
        set htmlFolderPath to my exportFolder & "/" & sanitizedNotebookName
        mkDir(htmlFolderPath)
    
        set my htmlCount to ((my htmlCount) + 1)
        tell application id "com.evernote.evernote"
            set exportFilename to htmlFolderPath & "/" & my filenameSafe(title of currentNote)
        
            -- Do something with note with multiple attachments
            -- Looks like export as HTML is the best option. This will create a
            -- folder named to match the note tile, containing a single HTML file
            -- named to match the note title, with a sub-folder containing
            -- all of the attachments (which are almost certain to be images).
            if not my scanOnly then
                log my totalNoteCount & "HTML:" & exportFilename
                export noteAsList to exportFilename format HTML with tags
            end if
        end tell
        applyAttributesToFile(currentNote, getHtmlFileIn(exportFilename)) -- exportFilename is really the folder where the html got written.
    
    end exportToHtml

    on getHtmlFileIn(folderName)
        set ret to folderName
        set fld to POSIX file folderName
        tell application "Finder" to set folder_list to items of folder fld
        repeat with f in folder_list
            if name of f ends with ".html" then
                set ret to folderName & "/" & name of f
            end if
        end repeat
        return ret
    end getHtmlFileIn


    -- **********************************************************
    -- Ensure that the name is safe for a file or folder name
    -- **********************************************************
    on filenameSafe(fileSystemName)
        set tempName to fileSystemName
        set tempName to replaceString(tempName, "\\", "")
        set tempName to replaceString(tempName, "/", "-")
        set tempName to replaceString(tempName, "&", "+")
        set tempName to replaceString(tempName, "|", "-")
        set tempName to replaceString(tempName, ":", "-")
        set tempName to replaceString(tempName, "*", "_")
    
        set tempName to RemoveListFromString(tempName, {"'", "|", "&", "\"", ">", "<", "?", "$"}) -- do NOT replace \ because I ADD it in front of stuff before this line
        return tempName
    end filenameSafe



    -- **********************************************************
    -- **********************************************************
    on die(theMessage)
        log "-1, Message, " & theMessage
        log "-1, Simple note count, " & my simpleCount
        log "-1, PDF-only note count, " & my onePdfCount
        log "-1, HTML-export count, " & my htmlCount
        log "-1, Image-only count, " & my oneImageCount
        log "-1, Total note count:" & my totalNoteCount
    
        with timeout of (1000 * 60) seconds
            display dialog theMessage
        end timeout
        if not my scanOnly then
            error number -128
        end if
    end die



    -- **********************************************************
    -- Example: replaceString("Hello hello", "hello", "Bye") produces "Hello Bye"
    -- From http://applescript.bratis-lover.net/library/string/
    -- **********************************************************
    on replaceString(theText, oldString, newString)
        local ASTID, theText, oldString, newString, lst
        set ASTID to AppleScript's text item delimiters
        try
            considering case
                set AppleScript's text item delimiters to oldString
                set lst to every text item of theText
                set AppleScript's text item delimiters to newString
                set theText to lst as string
            end considering
            set AppleScript's text item delimiters to ASTID
            return theText
        on error eMsg number eNum
            set AppleScript's text item delimiters to ASTID
            error "Can't replaceString: " & eMsg number eNum
        end try
    end replaceString


    -- **********************************************************
    -- From http://applescript.bratis-lover.net/library/string/
    -- **********************************************************
    on RemoveFromString(theText, CharOrString)
        local ASTID, theText, CharOrString, lst
        set ASTID to AppleScript's text item delimiters
        try
            considering case
                if theText does not contain CharOrString then ¬
                    return theText
                set AppleScript's text item delimiters to CharOrString
                set lst to theText's text items
            end considering
            set AppleScript's text item delimiters to ASTID
            return lst as text
        on error eMsg number eNum
            set AppleScript's text item delimiters to ASTID
            error "Can't RemoveFromString: " & eMsg number eNum
        end try
    end RemoveFromString



    -- **********************************************************
    -- Remove items from a string.  e.g. RemoveListFromString("Hello hello2", {"hello2"})
    -- From http://applescript.bratis-lover.net/library/string/
    -- **********************************************************
    on RemoveListFromString(theText, listOfCharsOrStrings)
        local ASTID, theText, CharOrString, lst
        try
            script k
                property l : listOfCharsOrStrings
            end script
            set len to count k's l
            repeat with i from 1 to len
                set cur_ to k's l's item i
                set theText to my RemoveFromString(theText, cur_)
            end repeat
            return theText
        on error eMsg number eNum
            error "Can't RemoveListFromString: " & eMsg number eNum
        end try
    end RemoveListFromString



    -- **********************************************************
    -- How many times does theSubstring appear in theText?
    -- From http://applescript.bratis-lover.net/library/string/
    -- **********************************************************
    on countSubstring(theText, theSubstring)
        local ASTID, theText, theSubstring, i
        set ASTID to AppleScript's text item delimiters
        try
            set AppleScript's text item delimiters to theSubstring
            set i to (count theText's text items) - 1
            set AppleScript's text item delimiters to ASTID
            return i
        on error eMsg number eNum
            set AppleScript's text item delimiters to ASTID
            error "Can't countSubstring: " & eMsg number eNum
        end try
    end countSubstring

    on mimeToFileType(myMime)
        if myMime = "image/png" then
            return ".png"
        else if myMime = "image/jpeg" then
            return ".jpg"
        else
            display dialog "Unexpected mime type: " & myMime
        end if
    end mimeToFileType


    -- Need to get a string with "mm/dd/yyyy hh:mm:ss PM"
    on timestampReformat(t)
        tell (t) to get ("" & (its month as integer) & "/" & its day as text) & "/" & its year as text
        set theDate to result & " " & time string of t
        return theDate
    end timestampReformat


