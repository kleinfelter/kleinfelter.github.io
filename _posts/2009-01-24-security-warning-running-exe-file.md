---
excerpt: "<p>To make the &quot;Open File - Security Warning&quot; &quot;The publisher
  could not be verified. Are you sure you want to run this software?&quot; </p>\r\n
  \ <p>stop happening:</p>\r\n  <ol>\r\n    <li>Run gpedit.msc</li>\r\n    <li><font
  face=\"Verdana\" color=\"#333333\">\r\n        <p>User Configuration/Administrative
  Templates/Windows Components/Attachment Manager</p></font></li>\r\n    <li><font
  face=\"Verdana\" color=\"#333333\">\r\n        <p></p>"
categories: []
layout: post
title: Security Warning Running EXE File
created: 1232840959
---
<p>To make the &quot;Open File - Security Warning&quot; &quot;The publisher could not be verified. Are you sure you want to run this software?&quot; </p>
  <p>stop happening:</p>
  <ol>
    <li>Run gpedit.msc</li>
    <li><font face="Verdana" color="#333333">
        <p>User Configuration/Administrative Templates/Windows Components/Attachment Manager</p></font></li>
    <li><font face="Verdana" color="#333333">
        <p></p></font><font face="Verdana" color="#333333">Add &quot;*.exe&quot; to&nbsp;&quot;Inclusion list for moderate risk file types&quot;.</font><strong>Other keywords</strong>:</li>
  </ol>
  <p align="left">If the&nbsp;file is in the list of <u>moderate</u> risk file types and is from the&nbsp;<u>Internet zone</u>, Windows prompts before accessing the file.&nbsp; But...&nbsp;&nbsp;it allows you to run an .exe from the <u>Intranet</u> zone without a prompt.</p>
  <p align="left"></p>
  <ul>
    <li>
      <div>Unknown Publisher</div>
    </li>
    <li>
      <div>ie7 Internet Explorer</div>
    </li>
    <li>
      <div>Windows XP</div>
    </li>
    <li>
      <div>Group Policy Editor</div>
    </li>
  </ul>
