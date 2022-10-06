---
categories: []
layout: post
title: Parallels 8 Uses Different Keyboard Layouts for Different Windows Applications
created: 1358553074
redirect_from: /content/parallels-8-uses-different-keyboard-layouts-different-windows-applications
---
I upgraded from Parallels 7 to Parallels 8 and it messed up my Windows guest keyboard layouts.

I use a Dvorak keyboard layout in Windows and in OS X.  After the upgrade, some Windows programs would use Dvorak and others would use Scholes (QWERTY).  

This is caused by a failed attempt by Parallels to synch keyboard layouts between guest and OS X. To disable it:

* Shut down the virtual machine.
* Go to the folder where your PVM files live.
* Right click on your VM file and select 'Show package contents'
* Edit config.pvs using TextEdit 
* Find "KeyboardLayoutSync" and change the value for 'Enabled' to '0' (zero).
