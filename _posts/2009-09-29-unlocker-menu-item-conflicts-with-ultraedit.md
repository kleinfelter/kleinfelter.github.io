---
excerpt: "I use Unlocker and UltraEdit.&nbsp; Each of them attaches itself to the
  context menu for all items in Explorer.&nbsp; UltraEdit uses HKEY_CLASSES_ROOT\\*\\Shell\\Ultraedit\\Command
  to do so.&nbsp; Unlocker dynamically adds its entry from its DLL file.\r\n  <br
  />\r\n  <br />My fingers are used to <em>right-click followed by U</em> to start
  UltraEdit.&nbsp; Unlocker adds itself with U as a hot-key in the menu.&nbsp; Here's
  how to change it.\r\n  <br />\r\n  "
categories: []
layout: post
title: Unlocker Menu Item Conflicts With UltraEdit
created: 1254250597
---
I use Unlocker and UltraEdit.&nbsp; Each of them attaches itself to the context menu for all items in Explorer.&nbsp; UltraEdit uses HKEY_CLASSES_ROOT\*\Shell\Ultraedit\Command to do so.&nbsp; Unlocker dynamically adds its entry from its DLL file.
  <br />
  <br />My fingers are used to <em>right-click followed by U</em> to start UltraEdit.&nbsp; Unlocker adds itself with U as a hot-key in the menu.&nbsp; Here's how to change it.
  <br />
  <br />
  <ol>
    <li>Using UltraEdit, open C:\Program Files\Unlocker\UnlockerCOM.dll</li>
    <li>Search for &quot;&amp;unlock&quot;.</li>
    <li>I replaced the &amp; with _</li>
    <li>When I tried to save the file, it was write-locked.</li>
    <li>I killed Explorer.exe and Unlocker*.exe via Task Manager.</li>
    <li>Then I saved the file.</li>
    <li>Then I re-started Explorer.
      <br /></li>
  </ol>
