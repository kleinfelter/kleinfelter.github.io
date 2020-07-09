---
categories: []
layout: post
title: Sharing OneNote Notebooks Via NAS
created: 1483218640
redirect_from: /content/sharing-onenote-notebooks-nas
---
According to [this blog](https://blogs.msdn.microsoft.com/david_rasmussen/2007/12/10/onenote-shared-notebooks-options-and-troubleshooting-part-1-windows-file-shares/), it is a bad idea to share a OneNote .one file via a NAS (SAMBA) network shared folder.  He says, "In particular many SAMBA implementations seem to have problems with ReplaceFile failing."

On the other hand, [this posting](https://www.office-forums.com/threads/corruption-and-sync-errors-over-nas.86304/) mentions Samba 3.2.3 as being new enough to solve the problem.  Some more reading suggests that cheap consumer NAS devices often use old versions of SAMBA, and they don't implement the ReplaceFile function because it is infrequently used for one-user-at-a-time file access.

If you want to check your Samba version, login to a shell prompt on your NAS and run:

* `sudo smbstatus | grep -i version`

I haven't personally tested it yet, so I don't know for certain that recent versions of Samba work with OneNote sharing.  We use a lot of Linux-based NAS at work, and I expect the story would get around quick if it didn't work with OneNote.
