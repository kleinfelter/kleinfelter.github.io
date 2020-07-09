---
excerpt: "I want to use Remote Desktop to control a PC which is running Windows 7
  Home Basic (we'll call this PC 'the host').&nbsp; Officially, this isn't possible.&nbsp;
  Here's my unofficial idea.\r\n  <br />\r\n  <br />\r\n  <ol>\r\n    <li>First, go
  to the host and enable the Telnet service on the host.&nbsp; (Yes, it is included
  with Win 7 HB.)</li>\r\n    <li>Also at the host, enable Remote Assistance.</li>\r\n
  \   <li>Still at the host, enable file sharing of C:\\temp. (Create it, if the folder
  doesn't exist.)\r\n      "
categories: []
layout: post
title: Remote Desktop to Windows 7 Home Basic
created: 1264123163
---
I want to use Remote Desktop to control a PC which is running Windows 7 Home Basic (we'll call this PC 'the host').&nbsp; Officially, this isn't possible.&nbsp; Here's my unofficial idea.
  <br />
  <br />
  <ol>
    <li>First, go to the host and enable the Telnet service on the host.&nbsp; (Yes, it is included with Win 7 HB.)</li>
    <li>Also at the host, enable Remote Assistance.</li>
    <li>Still at the host, enable file sharing of C:\temp. (Create it, if the folder doesn't exist.)
      <br /></li>
    <li>At the client, telnet to the host and login.&nbsp; Then enter &quot;msra /saveasfile c:\temp\file1 yaddayadda&quot; and logout.</li>
    <li>At the client, browse to the host's shared \temp folder, and open the file1.msrcincident file.&nbsp; The Remote Desktop client will start and connect to the client.
      <br /></li>
  </ol>I got this far, but the prompt to accept the connection never showed up on the host.&nbsp; Assuming I get that debugged, it may be necessary to install PTFB on the host, to automatically click OK on the do-you-want-to-accept-the-connection prompt.
  <br />
  <br />Once everything is set up, you could put the msra command line as a scheduled task on the host, and run it every day.
  <br />
