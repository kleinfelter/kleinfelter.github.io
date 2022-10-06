---
categories: []
layout: post
title: Autoexec for Excel
created: 1402437783
redirect_from: /content/autoexec-excel
---
I wanted to run code on startup/opening an Excel workbook.  I tried 

    Sub Auto_Open()
        Debug.Print "Got here"
        MsgBox "auto_open"
    End Sub

It didn't run when opening the workbook.  (Yes, I enabled macros via the Trust Center. I also checked to be sure it was stored in the ThisWorkbook object.)  I tried Public and Private variants.  It just wouldn't start.  So I changed it to the following, and it runs.

    Private Sub Workbook_Open()
        Debug.Print "Got here"
        MsgBox "auto_open"
    End Sub
