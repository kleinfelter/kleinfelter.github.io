---
categories: []
layout: post
title: Nirvana - Add Tasks API - Importing Tasks to Nirvana
created: 1379279607
redirect_from: /content/nirvana-add-tasks-api-importing-tasks-nirvana
---
https://app.nirvanahq.com/ is an elegant task (to-do) manager, but it has a number of maddening omissions.  Today's maddening omission is that there's no way provided to import a bunch of tasks into the system.  The closest they provide is for you to email your tasks, one at a time.  Ugh.  This is particularly annoying because they provide you with a way to export/backup your tasks, but no way to bring them back into Nirvana.  Double-ugh.

https://github.com/meeech/nirv (see also [here](/content/nirvana-api-installation-re-installation-tips)) provides a Ruby API for a few functions, and one of these is adding tasks.  Here's how to use this gem to import tasks from OmniFocus.  This is what I did on a Mac, but you should be able to accomplish something similar on a PC.  On a PC, you'll have to install Ruby and you might also need Cygwin.

This does not do a high-fidelity import.  If you really want an import bad, this is a bad import.  It is going to import task title, task notes, and nothing else.  It will import projects as tasks.

1. If you've not previously used the nirvanahq gem:
    1. gem install nirvanahq
    1. nirv init
    1. md5 -s your_nirvana_pw_here
    1. Edit ~/.nirvanahq/config.rb and update it with your Nirvanahq user ID and an MD5 of your password.
1. Export your OmniFocus to CSV.
2. Edit the CSV file (maybe using Excel) to delete completed tasks, and to cut the file down to a column with the task title and a column with the task notes (in that order and with no other columns).  If you have a title row in your CSV, delete it.
1. Press Alt-F11, and paste the following code into the ThisWorksheet object

        Option Explicit
        Sub RunMe()
        Dim s As String
        Dim title As String
        Dim note As String
        Dim sel As Range
        Dim r As Range
        
        
        If Selection.Rows.Count = 1 Then
            MsgBox "This will export the selected rows.  You selected only one row.  If you want more rows exported, select them FIRST, next time."
        End If
        If Selection.Rows.Count > 100 Then
            MsgBox "You'll have to export in sets of 100 rows or fewer."
            End
        End If
        
        Debug.Print "#!/bin/bash"
        For Each r In Selection.Rows
            If r.Cells(1, 1) = "" And r.Cells(1, 2) = "" Then
                Exit For
            End If
            
            title = r.Cells(1, 1)
            note = r.Cells(1, 2)
            
            title = Replace(title, """", "\""")
            note = Replace(note, """", "\""")
            
            title = Replace(title, "'", "'\''")
            note = Replace(note, "'", "'\''")
            
            title = Replace(title, "(", "\(")
            note = Replace(note, "(", "\(")
            
            title = Replace(title, ")", "\)")
            note = Replace(note, ")", "\)")
                        
            s = ""
            s = s + "nirv add "
            s = s + "'" + title + "'"
            If note <> "" Then
                s = s + " -n " ' + note + "'"
            End If
            s = s + " -t imported "
            Debug.Print s
        Next
        End Sub
 
. Run that code.
1. Copy the output from the immediate window, paste it into a Mac text file, save the text file in the Mac file system, run it as a shell script

