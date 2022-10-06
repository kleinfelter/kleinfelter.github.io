---
excerpt: "Sometimes, Microsoft Office will demand the Office CD,even though it has
  already been installed.&nbsp; This usually happens when you start an Office application.\r\n
  \ \r\n  <br />\r\n  <br />In the particular case of MS Project 2003, it may tell
  you that it can't find sku03a.cab, but with different Office applications, different
  files will be demanded.\r\n  \r\n  <br />\r\n  "
categories: []
layout: post
title: Microsoft Office 2003 Demands the Install Disk Even Though It Has Been Installed
created: 1212500650
---
Sometimes, Microsoft Office will demand the Office CD,even though it has already been installed.&nbsp; This usually happens when you start an Office application.
  
  <br />
  <br />In the particular case of MS Project 2003, it may tell you that it can't find sku03a.cab, but with different Office applications, different files will be demanded.
  
  <br />
  <br />If you've misplaced your CD, or if you installed from your LAN, but you are not presently connected to the LAN, this can be a bummer.&nbsp; If you cancel the message, it will open the application, but if will re-demand the CD each time you start the app.&nbsp; Very annoying on a cross-country flight.
  
  <br />
  <br />The problem may be caused by the application trying to collect your name and initials, for a first-time use.&nbsp;&nbsp; To work around this:
  
  <br />
  <ul>
    <li>Run regedit</li>
    <li>Navigate to HKEY_CURRENT_USER\Software\Microsoft\Office\&lt;version-number-here&gt;\&lt;application-name-here&gt;</li>
    <li>Create a DWORD with value = 1, named UserData</li>
  </ul>Note that for MS Project, you may find entries for both &quot;MS Project&quot; and &quot;Project.&quot;&nbsp;&nbsp; Create UserData under &quot;MS Project.&quot;
  
  <br />
  <br /><strong>Update</strong>
  <br />I encountered a very similar problem when attempting to uninstall Office 2003.&nbsp; I wanted to uninstall, but I didn't have my install CD.&nbsp; I had the disk files from my CD, but not my CD.&nbsp; But my files were from Office 2003 SP2, and my installed office was Office 2003 SP3.&nbsp; It refused to uninstall.
  <br />
  <br />I took my Office 2003 SP2 setup files, and slipstreamed the administrative edition (the &quot;full edition&quot;) of Office SP3 on top.&nbsp; That allowed me to use the SP2+SP3 setup files to uninstall Office 2003, so that I could Install Office 2007.
  <br />
  <br />The moral of these stories is to never, ever throw away your Microsoft CDs, even after you make (multiple) copies of the CD to hard disk.
  <br />
