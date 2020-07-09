---
excerpt: "There's a nice panel applet for Gnome named gnome-globalmenu, that give
  you title bar behavior similar to OS X.&nbsp; Unfortunately, it seems to calculate
  the application name for the menu by scanning your main menu, looking at run commands,
  so it displays the title &quot;CD/DVD Burner&quot; instead of &quot;Nautilus&quot;
  or &quot;File Browser&quot; when a Nautilus window is activated.\r\n  <br />\r\n
  \ <br />The work-around is to right-click on your main menu, and edit the menus,
  and change the command executed by the CD/DVD Burner accessory to be &quot;gvfs-open
  burn:/// &quot;.\r\n  "
categories: []
layout: post
title: Gnome Globalmenu Calls Nautilus "CD/DVD Burner"
created: 1257467051
---
There's a nice panel applet for Gnome named gnome-globalmenu, that give you title bar behavior similar to OS X.&nbsp; Unfortunately, it seems to calculate the application name for the menu by scanning your main menu, looking at run commands, so it displays the title &quot;CD/DVD Burner&quot; instead of &quot;Nautilus&quot; or &quot;File Browser&quot; when a Nautilus window is activated.
  <br />
  <br />The work-around is to right-click on your main menu, and edit the menus, and change the command executed by the CD/DVD Burner accessory to be &quot;gvfs-open burn:/// &quot;.
  <br />
  <br />Then you have to logout and login.
  <br />
