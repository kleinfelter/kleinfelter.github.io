---
categories: []
layout: post
title: Unable to Acccess OneNote
created: 1450101904
redirect_from: /content/unable-acccess-onenote
---
I started OneNote this morning and received, "OneNote can't start. This might be because there's not enough free disk space or because we don't have permission to write to files in your user settings folder.  If you're out of disk space, please try to free some up. Otherwise, contact your system administrator."

It turns out that I used to have Admin rights on this PC and they were revoked overnight.  OneNote created a C:\Tmp\OneNoteRuntimeCache folder which I was unable to access without my Admin rights.  I couldn't even take ownership of the folder and grant myself rights.

Resolution: Re-obtain Admin rights.
