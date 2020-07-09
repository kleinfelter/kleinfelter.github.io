---
categories: []
layout: post
title: '7zip Warning: Access is denied'
created: 1438294807
redirect_from: /content/7zip-warning-access-denied
---
I tried to backup my C:\Users\username folder, using 7zip.  I started getting lots of warnings on folders like:

* c:\users\username\AppData\Local\Application Data\
* c:\users\username\AppData\Local\History\
* c:\users\username\AppData\Local\Temporary Internet Files\

They are all symlinks, and not real directories.  Apparently, 7zip cannot back up the link.  Nor is there a way to tell it not to try.

So as a rule of thumb, ignore the warnings.
