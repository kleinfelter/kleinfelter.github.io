---
categories: []
layout: post
title: Excel Won't Quit - Yes It Does
created: 1468863553
redirect_from: /content/excel-wont-quit-yes-it-does
---
I was automating Excel, from Autohotkey, via CSCRIPT or WSCRIPT.  I followed all of the best practices for object management, such as setting my objects to Nothing in VBScript, calling xlApp.Quit and then setting xlApp to Nothing.

EXCEL.EXE just kept showing up in Task Manager after I quit Excel.

Ha!  But if I sat around for 45-60 seconds, it *did* quit.  

I dunno why, but I suspect that this is intentional behavior.  e.g. In case you automate multiple iterations, so you don't have to wait while Excel loads.  Or maybe it is doing clean-up, or who knows what.  The point is that before you say Excel.exe won't quit, give it a minute or two and check again.
