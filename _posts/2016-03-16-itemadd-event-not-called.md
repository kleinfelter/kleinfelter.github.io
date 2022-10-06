---
categories: []
layout: post
title: ItemAdd Event Not Called
created: 1458140845
redirect_from: /content/itemadd-event-not-called
---
In Outlook VBA, one might code

* Private WithEvents olInboxItems As Items
* Set olInboxItems = objNS.GetDefaultFolder(olFolderInbox).Items
* Private Sub olInboxItems_ItemAdd(byVal Item as Object)

and expect the ItemAdd routine to get called.  Sometimes it will.

In an Exchange environment, if you also have a 

* Private Sub Application_NewMailEx(ByVal EntryIDs As String)

then ItemAdd will not get called.  You can have EITHER an Application_NewMailEx OR an ItemAdd.



