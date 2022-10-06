---
categories: []
layout: post
title: Change Many OLE Linked Charts in a PowerPoint deck
created: 1417702814
redirect_from: /content/change-many-ole-linked-charts-powerpoint-deck
---
I have a PowerPoint deck with 60+ OLE/ActiveX/.Net linked Excel charts.  I want to change the name/location of the Excel file.  PowerPoint 2013 handles this very poorly.  You have to go to *File/Edit Links to Files* and edit each link individually. 

Here's how to do this in VBA:

	' *************************************************************************************
	' You'll have to edit this function any time you want to rename your linked Excel file.
	' Then run ChangeAllLinks.
	' *************************************************************************************
	Function TransformLinkedFilename(ByVal sourceName As String) As String
		' Today, I am renaming all .xlsx to .xlsm
		' Astonishingly, the file name appears more than once in the source name, so you
		' have to let the Replace replace multiple times.
		TransformLinkedFilename = Replace(sourceName, ".xlsx", ".xlsm", 1, -1)
	End Function


	' *************************************************************************************
	' I have a PowerPoint with a million OLE linked charts in it.
	' I want to rename/move the linked spreadsheet(s).
	' The GUI method for doing this is labor intensive.
	' *************************************************************************************
	Sub ChangeAllLinks()
		Dim aSlide As Slide
		Dim aShape As Shape
		Dim oldName As String
		Dim newName As String
		
		For Each aSlide In ActivePresentation.Slides
			For Each aShape In aSlide.Shapes
				If (aShape.Type = msoLinkedOLEObject)  Or (aShape.Type = msoChart) Then
					oldName = aShape.LinkFormat.SourceFullName
					newName = TransformLinkedFilename(oldName)
					Debug.Print "From:" & oldName
					Debug.Print "To:  " & newName
					'Stop
					aShape.LinkFormat.SourceFullName = newName
				End If
			Next
		Next
		MsgBox "Done"
	End Sub

