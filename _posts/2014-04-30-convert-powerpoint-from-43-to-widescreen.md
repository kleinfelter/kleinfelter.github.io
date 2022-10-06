---
categories: []
layout: post
title: Convert Powerpoint From 4:3 to Widescreen
created: 1398887896
redirect_from: /content/convert-powerpoint-43-widescreen
---
<ul>
  <li>Rename the PPTX to give it a .ZIP extension. For example, rename TEST.PPTX to TEST.PPTX.ZIP.</li>
  <li>Open the ZIP file.</li>
  <li>Open the ppt folder within the ZIP.</li>
  <li>Copy (drag-and-drop) presentation.xml from the ppt folder to your desktop.</li>
  <li>Edit it with a text editor:</li>
  <li>Find this string:</li>
</ul>
<code>&lt;p:sldSz cx="9144000" cy="6858000" type="screen4x3"/&gt;</code>
<ul>
  <li>Change it to:</li>
</ul>
<code>&lt;p:sldSz cx="12191996" cy="6858000" type="screen4x3"/&gt;</code>
<ul>
  <li>Save presentation.xml.</li>
  <li>Copy it back into the ppt folder, replacing the existing file.</li>
  <li>Close the ZIP file and rename it back to TEST.PPTX.</li>
  <li>Open TEST.PPTX in PowerPoint.</li>
  <li>You'll have to move images left/right to get them where you want them.</li>
</ul>
From http://tumblr.cgeier.at/post/43296834116/convert-a-4-3-ppt-slide-deck-into-a-16-9-aspect-ratio and http://www.pptfaq.com/FAQ00566_Make_screenshow_fill_a_wide_screen_display.htm
