---
categories: []
layout: post
title: 'TODO: <file description> has stopped working'
created: 1392905757
redirect_from: /content/todo-has-stopped-working
---
Every once in a while, you'll get a Windows error dialog with the title "TODO: <file description>" and the text "TODO: <File description> has stopped working.  A problem caused the program to stop working correctly.  Please close the program."  You'll be given the options of "Close the program" and "Debug the program".

When a developer starts a project using common development tools, he starts from a program stub provided by the dev tool.  Microsoft provides a stub which includes a default exception handler.  The default exception handler displays this dialog -- mostly.

The default exception handler fills in the name/description of the program before it displays the error.  But... the stub also includes a default program name/description.   That default name/description is "TODO: <File description>".

So this error is produced when the developer of an application couldn't be bothered to update the default name/description provided by the stub.

OK.  So how do I tell which program is throwing an error (and crashing)?

Open Task Manager.  Look in the "Description" column.  You'll see the program name/description for every running program.  The one with the description, "TODO: <file description>" -- that's your problem application.  Look in the "Image Name" column and the "Command Line" column for clues as to what the program is.
