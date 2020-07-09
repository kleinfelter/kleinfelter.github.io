---
excerpt: "From time to time I run into a situation where a Windows program reacts
  poorly to certain drive classes.&nbsp; For example:\r\n  \r\n  <br />\r\n  <ul>\r\n
  \   <li>A backup program that only backs up fixed, local drives, and I want it to
  back-up a removable drive or a network drive.</li>\r\n    <li>A program that does
  something to all fixed, local drives, and I want to prevent it from accessing one
  of the drives by marking the drive as removable.</li>\r\n  </ul>I need a way to
  tell Windows that it should say that the drive is different than it really is.&nbsp;
  \r\n  \r\n  <br />\r\n  "
categories: []
layout: post
title: Make a Windows Application Treat Removable Drive as Fixed or Network Drive
  as Local
created: 1263436923
---
From time to time I run into a situation where a Windows program reacts poorly to certain drive classes.&nbsp; For example:
  
  <br />
  <ul>
    <li>A backup program that only backs up fixed, local drives, and I want it to back-up a removable drive or a network drive.</li>
    <li>A program that does something to all fixed, local drives, and I want to prevent it from accessing one of the drives by marking the drive as removable.</li>
  </ul>I need a way to tell Windows that it should say that the drive is different than it really is.&nbsp; 
  
  <br />
  <br />Here are some ideas/notes.
  
  <br />
  <ul>
    <li>You can do some of this by using dummydisk.sys or cfadisk.sys, but they deal only with fixed/removable, and I want network/local.</li>
    <li>Maybe I could hook GetDriveType (http://msdn.microsoft.com/en-us/library/aa364939%28VS.85%29.aspx), and have it lie to ONLY the program I want to lie to.&nbsp; (It could be bad to have it lie to Windows.)</li>
    <li><a href="http://www.codeproject.com/KB/system/soviet_direct_hooking.aspx?msg=1468013">http://www.codeproject.com/KB/system/soviet_direct_hooking.aspx?msg=1468013</a>&nbsp; is an article about hooking system API DLLs.</li>
    <li><a href="http://forum.madshi.net/viewtopic.php?p=4420&amp;sid=82111e2f2e1c485c02ebf1d01a80a4aa">http://forum.madshi.net/viewtopic.php?p=4420&amp;sid=82111e2f2e1c485c02ebf1d01a80a4aa</a>&nbsp; is thread about hooking and hooking problems.
      
      <br /></li>
    <li>Windows volume management functions: <a href="http://msdn.microsoft.com/en-us/library/aa365730%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/aa365730%28VS.85%29.aspx</a>
      <br /></li>
    <li>Might need to also hook DeviceIoControl because <a href="http://www.eggheadcafe.com/software/aspnet/35336538/alternative-to-getdrivety.aspx">http://www.eggheadcafe.com/software/aspnet/35336538/alternative-to-getdrivety.aspx</a>&nbsp; mentions &quot;Open the volume (CreateFile with something like &quot;\\.\U:&quot;) and call DeviceIoControl with IOCTL_STORAGE_QUERY_PROPERTY.&quot;</li>
    <li>What about creating a filter driver to create a virtual local drive on top of the network drive?</li>
    <li>Maybe a shell namespace utility?&nbsp; Like GDrive?
      
      <br /></li>
  </ul>There are plenty of people looking for this ability, but I haven't seen any web pages about anyone succeeding.
  
  <br />
