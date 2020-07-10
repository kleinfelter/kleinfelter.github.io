---
title: Firefox Portable Incredibly Slow
layout: post
---

## Firefox Portable Launches and Loads Very Slow

Firefox Portable started taking forever to launch and load.  I was running it from a USB flash drive, so I suspected drive problems.  That wasn't it.

I only use Firefox Portable to run an old Tiddlywiki Classic, with the Tiddlyfox extension.  Clicking in the search box would often provoke "not responding" with a white/gray browser window, for long periods of time.  Closing Firefox could take 10 minutes to complete.  Launching Firefox with TiddlyWiki could take 10 minutes.

Something was making my prefs.js file huge (as in 300 MB).  When I tried to open in from Notepad, it brought my machine to a crawl, even after I copied the file to C:\Temp, so I knew it wasn't a flash drive problem.

Something was adding millions of "E:\\FirefoxPortable\\FirefoxPortable" to my prefs.js file.  I could look at a history of that file and see it grow by KB per day.  (My flash drive is E:\.)

The solution:

* Close (and kill, if necessary) all Firefoxes (portable and installed).
* Delete E:\FirefoxPortable\Data\profile\prefs.js
* Launch Firefox Portable.  It will offer to download an update.  Tell it NO.
* Tools/Options (alt-t)
* Press Alt-Shift-N to "Never check for updates". (You must use Alt-Shift to acces an accelerator key on the Options tab.)
* Exit and re-launch Firefox Portable, opening your TiddlyWiki.
* Click the TiddlyFox icon and perma-enable saving changes
* Save changes.
