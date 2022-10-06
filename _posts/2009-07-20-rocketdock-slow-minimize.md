---
excerpt: "I ran across an odd behavior in RocketDock recently.&nbsp; When minimize-to-dock
  was enabled, and I minimized an application, nothing happened for 10 seconds, and
  then the window minimized.&nbsp; Not &quot;about 10 seconds.&quot;&nbsp; &quot;Exactly
  10 seconds, every time.&quot;\r\n  \r\n  \r\n  <br />\r\n  <br />At first I thought
  that my graphics card was too slow, but then I tried a fresh install, and minimize-to-dock
  was very fast.\r\n  \r\n  \r\n  <br />\r\n  "
categories: []
layout: post
title: RocketDock Slow Minimize
created: 1248141281
---
I ran across an odd behavior in RocketDock recently.&nbsp; When minimize-to-dock was enabled, and I minimized an application, nothing happened for 10 seconds, and then the window minimized.&nbsp; Not &quot;about 10 seconds.&quot;&nbsp; &quot;Exactly 10 seconds, every time.&quot;
  
  
  <br />
  <br />At first I thought that my graphics card was too slow, but then I tried a fresh install, and minimize-to-dock was very fast.
  
  
  <br />
  <br />It turns out that having an icon on the dock, that points to a network folder or file, causes this 10-second pause --- when I'm not connected to the network.
  
  
  <br />
  <br />Apparently, RocketDock is attempting to follow the icon pointers on a minimize, and it has to wait for something to time-out before it continues.&nbsp; The work-around is not to put shortcuts to network folders/files directly on the dock.&nbsp; You can put them in a stacks docklet.&nbsp; Just don't put them on the dock (or always be connected to your LAN).
  
  
  <br />
  <br /><strong>UPDATE</strong>: 
  
  <br />Here's a work-around.&nbsp; Instead of making the icon on the dock be a shortcut to the LAN folder, make it a shortcut to a VBScript or a .CMD file that opens the LAN folder, and put the script on a local drive.
  
  <br />
  <br /><strong>Another Note</strong>:
  <br />The Nvidia Desktop Manager seems to grab control-alt-shift-leftClick of the minimize button (for minimize to a title bar, a.k.a. roll-up), so RocketDock's control-alt-shift-leftClick of the minimize button doesn't prevent minimize-to-dock.&nbsp; There are two work-arounds:
  <br />1. Temporarily disable Nview Manager.
  <br />2. Edit the RocketDock settings.ini file and add the application to the WindowsFilter list.&nbsp; e.g.
  <br />&nbsp; [Software\RocketDock\WindowFilters]
  <br />&nbsp; 0-Filter=notepad.exe?Notepad
  <br />&nbsp; count=1
  <br />
  <br />
  <br />
