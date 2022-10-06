---
categories: []
layout: post
title: Hide Folders With Outlook 2010 or Outlook 2013
created: 1435689254
redirect_from: /content/hide-folders-outlook-2010-or-outlook-2013
---
* Close Outlook
* Download MFCMAPI  from [http://mfcmapi.codeplex.com/](http://mfcmapi.codeplex.com/)
* Run it
* Login to MAPI with it
* Double-click the folder for your mailbox (e.g. "Lastname, Firstname" in a corporate environment)
* Expand the Root item
* Look in IPM_SUBTREE
* Select the desired folder
* From the menu: Property >> Advanced >> Edit
* In Property Tag type; 0x10F4000B
* Press OK
* Put a check-mark in front of Boolean
* OK/close your way out of all windows
