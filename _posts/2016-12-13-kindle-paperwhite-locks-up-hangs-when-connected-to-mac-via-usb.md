---
categories: []
layout: post
title: Kindle Paperwhite Locks Up / Hangs When Connected to Mac Via USB
created: 1481649715
redirect_from: /content/kindle-paperwhite-locks-hangs-when-connected-mac-usb
---
I plugged my Kindle into my Macbook.  The Kindle went to "USB Drive Mode" and locked up.  The Mac did not recognize it as a USB drive.  (The Mac ignored it.)  The Kindle did not leave USB mode when unplugged.  I'm using OS X El Capitan 10.11.6.

I had to hard-reboot the Kindle by holding in the power button until it restarted.   The problem was 100% repeatable.

After several tries with my Macbook, I rebooted the Kindle and plugged it into a Windows notebook and it worked as designed.  So it was a problem with my Macbook.

I unplugged everything from my Macbook, rebooted the Kindle, rebooted the Macbook, and re-connected the Kindle to the Mac.  It works.  100% repeatable.

I *suspect* that VMware Fusion had messed up my USB port.  (I exited VMware, but that didn't cure the problem.  I had to reboot the Mac to fix the issue.)
