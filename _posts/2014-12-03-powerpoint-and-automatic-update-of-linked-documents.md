---
categories: []
layout: post
title: PowerPoint and Automatic Update of Linked Documents
created: 1417636529
redirect_from: /content/powerpoint-and-automatic-update-linked-documents
---
When I open some PowerPoint decks, I get a warning dialog about linked documents, and I don't want to get it.  (Or vice versa.)

The message title is: Microsoft PowerPoint Security Notice

It has a bolded title: Microsoft Office has identified a potential security concern.

It goes on to say: This presentation contains links to other files.  If you update the links...

It has buttons: "Update Links" and "Cancel"

To change the behavior, you have to go to the Edit Links window.  To get there, click File (on the Ribbon), and on the Info tab, click "Edit Links to Files".  You'll see an "Automatic Update" checkbox.  If this is set, you'll get the dialog.  If this is clear, you will not get the dialog.  If you have eleventy-three links, you will have to clear (or set) every file individually.  (e.g. Select the first link, clear/set the checkbox; select the next link and clear/set; select the next link and...)

If you clear it, you might want to create a VBA macro that includes:

    ActivePresentation.UpdateLinks

... and put a button for that macro on your Quick Access Toolbar.  If you customize the QAT, you'll probably want to change a setting on the customize dialog to customize it for the current document only.

CAUTION: I have found that UpdateLinks works sometimes and other times it just returns without doing anything.  The following code can be used to set ALL link types.  Call it with either ppUpdateOptionAutomatic or ppUpdateOptionManual.

    Sub SetOleLinkTypes(ByVal LinkType As Integer)
        Dim aSlide As Slide
        Dim aShape As Shape
    
        For Each aSlide In ActivePresentation.Slides
            For Each aShape In aSlide.Shapes
                If aShape.Type = msoLinkedOLEObject Then
                    aShape.LinkFormat.AutoUpdate = ppUpdateOptionAutomatic
                End If
            Next
        Next
        MsgBox "OLE link types updated"
    End Sub
