---
categories: []
layout: post
title: Autofit All Rows In Excel 2010
created: 1372714488
redirect_from: /content/autofit-all-rows-excel-2010
---
In older  versions of Excel, you used to be able to select a bunch of rows, right click on a row, and select Autofit.  It would autofit all rows' height.  I can't find this in recent versions of Excel.  There *must* be a better way, but here's my work-around.

Create a function that looks like this:
    
    Public Sub Autofit_Selection()
        Dim I As Long
        Dim j As Long
        Dim s As String
    
        I = Selection.Row
        j = I + Selection.Rows.Count - 1
        s = CStr(I) + ":" + CStr(j)
        Rows(s).EntireRow.AutoFit
    End Sub

Select the rows you want to auto-fit.  Then run the macro.
