---
excerpt: "I set up a new Unison job on a Windows 7 machine, replicating to an Ubuntu
  server.  But I was getting:\r\n<pre>\r\n[root 1]: Error in scanning directory:\r\nPermission
  denied [opendir()]\r\nNo updates to propagate\r\n</pre>\r\nSo I did a song and dance
  with chmod and File/Properties/Security and gave the world full permissions to everything.
  \ All to no avail.\r\n<p>\r"
categories: []
layout: post
title: Problems With Unison
created: 1318000122
---
I set up a new Unison job on a Windows 7 machine, replicating to an Ubuntu server.  But I was getting:
<pre>
[root 1]: Error in scanning directory:
Permission denied [opendir()]
No updates to propagate
</pre>
So I did a song and dance with chmod and File/Properties/Security and gave the world full permissions to everything.  All to no avail.
<p>
It turns out that Unison can give this error if one of the directories to sync does not exist.  For example, if you've got C:\Foo\bar and you're synchronizing it with a remote /bleah/bar, but the remote has only /bleah, Unison won't create /bleah/bar.  It just throws the error.
<p>
Learning: When Unison says "permission denied [opendir()]", what it really means is something like, "I'm having a problem with one of your directories that may or may not have anything to do with permissions."
<p>
My personal "best practice" is that when you're going to do your first sync with Unison, you should use your ordinary "copy" or "cp" or "teracopy" command to start with both sides in perfect alignment.  Teracopy (or similar) is much faster than doing an initial sync of a full directory with an empty peer anyhow.
