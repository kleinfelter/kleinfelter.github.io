---
categories: []
layout: post
title: Change Autohotkey Editor
created: 1484838690
redirect_from: /content/change-autohotkey-editor
---
I wanted to change the editor used when clicking on "Edit this Script" on an Autohotkey icon, from Notepad to Notepad++.  There are many references to this, but they all assume that Autohotkey is *installed* and I'm running it semi-portably. (i.e. I have the files on a flash drive and I never installed it.)

I saved the following in a .reg file in my Autohotkey folder, so I can load it into the registry wherever I plug in my flash drive.

<pre>
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\AutoHotkeyScript]

[HKEY_CLASSES_ROOT\ahk_auto_file]
@=""

[HKEY_CLASSES_ROOT\ahk_auto_file\shell]

[HKEY_CLASSES_ROOT\ahk_auto_file\shell\Edit]

[HKEY_CLASSES_ROOT\ahk_auto_file\shell\Edit\Command]
@="\"C:\\Program Files (x86)\\Notepad++\\notepad++.exe\" \"%1\""

[HKEY_CLASSES_ROOT\ahk_auto_file\shell\open]

[HKEY_CLASSES_ROOT\ahk_auto_file\shell\open\command]
@="\"C:\\Program Files (x86)\\Notepad++\\notepad++.exe\" \"%1\""

</pre>
