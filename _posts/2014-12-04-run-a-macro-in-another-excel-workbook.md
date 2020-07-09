---
categories: []
layout: post
title: Run a Macro in Another Excel Workbook
created: 1417713977
redirect_from: /content/run-macro-another-excel-workbook
---
I sometimes need to run an Excel macro from another spreadsheet.  The standard solution is:

    Application.Run (workbookName & "!" & macroName))

Sometimes this works.  Sometimes it fails with 

* Run-time error '1004':
* Application-defined or object-defined error.

Solution:

Wrap the workbook name and the macroName in apostrophes.

    Application.Run (ApostropheMe(wbTarget.Name) & "!" & ApostropheMe(MacroName))

You'll find doc that says you need to do this for file names with spaces.  I found it happens with some other characters too.

Useful code:

	Sub ColorAllCharts()
		RunMacro "MyOtherWorkbook.xlsm", "MyBigMacro", "C:\MyFolderOfSpreadsheets"
	End Sub

	Private Sub RunMacro(ByVal WorkbookName As String, ByVal MacroName As String, ByVal FolderName)
		Dim wbTarget As Workbook
		Dim CloseIt As Boolean
		 
		CloseIt = False
			
			
		On Error Resume Next
		' See if the Workbook is already open...
		Set wbTarget = Workbooks(WorkbookName)
		 
		If Err.Number <> 0 Then
			 'If the workbook wasn't already open, open it
			Err.Clear
			Set wbTarget = Workbooks.Open(FolderName & "\" & WorkbookName)
			CloseIt = True
		End If
		 
		 'Did the open succeed?
		If Err.Number = 1004 Then
			MsgBox "Unable to open:" & FolderName & "\" & WorkbookName
			Exit Sub
		End If
		If Err.Number <> 0 Then
			MsgBox "Surprise error " & CStr(Err.Number) & ":" & FolderName & "\" & WorkbookName
			Exit Sub
		End If
		On Error GoTo 0
		 
		 ' Run the macro
		 ' If you don't use apostrophes, some file names will fail with Error 1004 (and not only those with spaces in them).
		Application.Run (ApostropheMe(wbTarget.Name) & "!" & ApostropheMe(MacroName))
		 
		If CloseIt = True Then
			 'If the target workbook was opened by the macro, close it
			wbTarget.Close savechanges:=False
		Else
			 'If the target workbook was already open, reactivate this workbook
			ThisWorkbook.Activate
		End If
		 
	End Sub

	Private Function ApostropheMe(ByVal s As String) As String
		ApostropheMe = "'" & s & "'"
	End Function
