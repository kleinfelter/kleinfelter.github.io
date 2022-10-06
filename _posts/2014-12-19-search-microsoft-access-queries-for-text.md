---
categories: []
layout: post
title: Search Microsoft Access Queries for Text
created: 1419029530
redirect_from: /content/search-microsoft-access-queries-text
---
Save the following in a Module; then run it from the VBA immediate window.

    ' Arguments:
    '    1 - Text to search
    '    2 - Show the SQL (true) or just the Query name (false)
    '    3 - Wildcard for names of queries to search.
    ' Example Use:
    '    SearchQueries "findThisText"
    '    SearchQueries "findThisText", true
    '    SearchQueries "findThisText", true, "InQueriesNamedBeginningWithThis*"
    Sub SearchQueries(SearchText As String, Optional ShowSQL As Boolean = False, Optional QryName As String = "*")
        On Error Resume Next
        Dim QDef As QueryDef
    
        For Each QDef In CurrentDb.QueryDefs
            If QDef.Name Like QryName Then
                If InStr(UCase(QDef.SQL), UCase(SearchText)) > 0 Then
                    Debug.Print QDef.Name
                    If ShowSQL Then Debug.Print QDef.SQL & vbCrLf
                End If
            End If
        Next QDef
    End Sub
