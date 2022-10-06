---
layout: post
title: Windows Printer Port Configuration Grayed (Disabled)
---
I needed to change the IP address on a Windows printer.  In the search box I entered "Printers" and I selected "Devices and Printers" in Control Panel.  Right-click on the printer, choose Printer Properties, and then the Ports tab.  Everything is disabled.  WTF?

Solution:

* Number 1 - you must be logged in as an Administrator.  Logout and login if necessary.
* Go back to the General tab for the printer. You'll notice that the Configure button has an administrator icon.  Click on that.  THEN you can update the port. 


This might work better:
* Enter "cmd" in the search box.
* Right-click on Command Prompt and choose "Run as administrator".
* Enter "control" into the command prompt.
* Navigate to "View devices and printers" under "Hardware and Sound".
* Right-click, choose Printer Properties.
* It was unlocked at this point, for me.
