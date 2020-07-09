---
categories: []
layout: post
title: Spooler Crashes (Windows XP)
created: 1458583587
redirect_from: /content/spooler-crashes-windows-xp
---
I'm running XP in a VMware Fusion VM.

Spooler SubSystem App has encountered a problem and needs to close. We are sorry for the inconvenience.

This didn't help:

* NET STOP SPOOLER and press Enter
* DEL %SYSTEMROOT%\SYSTEM32\SPOOL\PRINTERS\*.* and press Enter
* NET START SPOOLER and press Enter

Deleting all existing printers didn't help.

This seems to fix it: http://www.pchell.com/support/spoolersubsystem.shtml

* I think the problem is the Monitor for thinprint.  That means I can't use Thinprint printers.
