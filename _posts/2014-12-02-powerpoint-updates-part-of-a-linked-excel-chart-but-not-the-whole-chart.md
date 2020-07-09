---
categories: []
layout: post
title: PowerPoint Updates Part of a Linked Excel Chart But Not the Whole Chart
created: 1417556740
redirect_from: /content/powerpoint-updates-part-linked-excel-chart-not-whole-chart
---
OLE/ActiveX/.Net in Microsoft Office is great demo-ware, but when you try to use it for real work, it is awfully 'fiddly.'  I had a problem where I put linked Excel charts into a PowerPoint deck and when I told PowerPoint to refresh the charts from Excel, it refreshed only part of the chart.  

I created the links by:

* Going to Excel 2013 and copying the chart.
* Going to PowerPoint 2013, right-clicking, and choosing the Paste Option "Keep Source Formatting & Link Data".
    * This *should* paste the chart, and apply Excel's formatting, and use "live" data from the spreadsheet.  It uses live *data* (chart lines) but not chart title or formatting.  
    * When you paste the chart, it pastes in the current chart title and formatting and it does use them -- only after the paste.  When you later change the formatting or the chart title, it continues to apply the Excel formatting that was in effect when you pasted the link.
    * In other words it amounts to "paste a link to the data" and "apply the *current* source formatting."

If this happens to you, you'll have to re-paste your charts -- once -- using a different method.  After that, your source formatting (including the chart title) will be dynamically updated.

Here's the magic way to paste/link and get it to do what you want:

* Go to Excel and copy the chart.
* Go to PowerPoint and select the Home tab on the Ribbon.
* Find the Paste button on the ribbon.  (I looks like a clipboard.  It is still there!  I had to look twice for it.)
* Click the drop-down arrow on the Paste button.
* Click the words "Paste special".
* Choose "Paste link".
* Choose "Microsoft Excel Chart Object".
* Press OK.

Related VBA code follows.  It is handy to add this to your PowerPoint deck, and then customize the Quick Access Toolbar to add buttons for these subroutines.

    Sub RefreshLinks()
        ActivePresentation.UpdateLinks
        MsgBox "Refreshed"
    End Sub

    Sub PasteSpecialExcelChart()
        Call Application.ActiveWindow.View.Slide.Shapes.PasteSpecial(DataType:=ppPasteChartObject, _
            DisplayAsIcon:=msoFalse, Link:=msoTrue)
    End Sub


    Sub PasteSpecialExcelChartAndPosition()
        Dim sr As ShapeRange
        Dim currentSelection As Shape
        Set sr = Application.ActiveWindow.View.Slide.Shapes.PasteSpecial(DataType:=ppPasteChartObject, _
            DisplayAsIcon:=msoFalse, Link:=msoTrue)
    
        ' The just-pasted item automatically becomes the selected item.
    
        Set currentSelection = ActiveWindow.Selection.ShapeRange(1)
    
        currentSelection.LockAspectRatio = msoFalse
        
        ' Dimensions are in points, at 72 points per inch
        currentSelection.Left = 18#
    
        currentSelection.Height = 72 * 3#
        currentSelection.Width = 72 * 9.5
        currentSelection.Linkformat.AutoUpdate = ppUpdateOptionManual  ' or ppUpdateOptionAutomatic
    
        answer = MsgBox("Put it on the top of the page (yes) or the bottom (no)?", vbYesNo)
        If answer = vbYes Then
            currentSelection.Top = 60#
        Else
            currentSelection.Top = 276#
        End If
    End Sub
