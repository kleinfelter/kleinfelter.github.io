Sub ConvertCingularToAtt()
    Dim objNS As Outlook.NameSpace
    Dim ContactFolder As MAPIFolder
    Dim c As Object
    Dim ci As ContactItem
    Dim Skipping As Boolean
    
    If MsgBox("This macro will cycle through the Address Book for your primary email account, changing '@mycingular' to '@att' in all 3 email address fields.  This could take a few minutes.  You will receive a 'Finished!' message when conversion is complete. Do you wish to continue?", vbOKCancel) = vbCancel Then
        Exit Sub
    End If
    'thisoutlooksession.
    Set objNS = Application.GetNamespace("MAPI")
    Set ContactFolder = objNS.GetDefaultFolder(olFolderContacts)
    For Each c In ContactFolder.Items
    
        If TypeName(c) <> "ContactItem" Then
            If Skipping Then
                ' warn only once
            Else
                MsgBox "There is (another) something in your Contacts that is not a contact!  It is a " + TypeName(c) + ".  Skipping..."
                Skipping = True
            End If
        Else
            Set ci = c
            ci.Email1Address = ConvertAddress(ci.Email1Address)
            ci.Email2Address = ConvertAddress(ci.Email2Address)
            ci.Email3Address = ConvertAddress(ci.Email3Address)
            ci.Save
            
'            Stop
        End If
    Next c
    MsgBox "Finished!"
End Sub

Function ConvertAddress(ByVal s As String) As String
    Dim i As Integer
    Dim i2 As Integer
    
    ConvertAddress = s      ' initialize it to the original address
    
    i = InStr(s, "@mycingular")
    If i < 1 Then
        Exit Function
    End If

    i2 = InStr(i, s, "r") + 1
    ConvertAddress = Left(s, i) + "att" + Mid(s, i2)
End Function
