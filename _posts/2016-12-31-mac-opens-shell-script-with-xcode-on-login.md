---
categories: []
layout: post
title: Mac Opens Shell Script With xcode on Login
created: 1483217231
redirect_from: /content/mac-opens-shell-script-xcode-login
---
I added a .sh file (shell script) to my Login items, for OS X to run when I startup and then login.  It starts xcode to edit the file, instead of running it.

Solution: Rename the file to a .command file.

Why: .sh files are owned by xcode by default; .command files are owned by Terminal.  Ergo, a .command file will be run by the Terminal app instead of by xcode.

Alternative: Change system preferences (via *Get Information* on the file) to open .sh files with Terminal.  That could be risky.  I don't have a known risk in mind, except that OS X might *expect* .sh files to open with xcode, somewhere, somehow.
