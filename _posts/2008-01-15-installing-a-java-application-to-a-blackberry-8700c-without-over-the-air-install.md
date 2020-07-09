---
excerpt: "Some people use a Blackberry with a data plan but without a <u>Blackberry
  Data Plan<strong>.</strong></u>&nbsp; (They aren't the same thing.)&nbsp; Without
  a Blackberry Data Plan, you can't do an over-the-air install (because Opera mini
  tries to use the Blackberry Internet Browser, and the Blackberry browser won't work
  withou a Blackberry Data Plan).&nbsp; \r\n  <br />\r\n  <br />Here's how I installed
  a Java Mobile application to my 8700C.\r\n  <br />\r\n  <br /><strong>Prerequisites:</strong>\r\n
  \ <br />Download BlackBerry_JDE_Components_4.2.1.exe\r\n  "
categories: []
layout: post
title: Installing a Java Application to a Blackberry 8700c Without Over-the-air Install
created: 1200418589
---
Some people use a Blackberry with a data plan but without a <u>Blackberry Data Plan<strong>.</strong></u>&nbsp; (They aren't the same thing.)&nbsp; Without a Blackberry Data Plan, you can't do an over-the-air install (because Opera mini tries to use the Blackberry Internet Browser, and the Blackberry browser won't work withou a Blackberry Data Plan).&nbsp; 
  <br />
  <br />Here's how I installed a Java Mobile application to my 8700C.
  <br />
  <br /><strong>Prerequisites:</strong>
  <br />Download BlackBerry_JDE_Components_4.2.1.exe
  <br />Download Opera Mini 4 (opera-mini-4.0.10031-advanced-int.jad and opera-mini-4.0.10031-advanced-int.jar)
  <br />Run BlackBerry_JDE_Components_4.2.1.exe. If you don't have a JDK, de-select that prerequisite failure.
  <br />
  <br /><strong>Installing the Java Mobile Application:</strong>
  <br />
  <ol>
    <li>Note1: You should replace &quot;demo1&quot; with your application file names (JAD and JAR), and codefile1 with the name you want to use for the load-ready file.
      <br /></li>
    <li>Download the application's JAR and JAD files with your PC.</li>
    <li>rapc import=&quot;c:\Program Files\Research in Motion\BlackBerry JDE Component Package 4.2.1\lib\net_rim_api.jar&quot; codename=<u><em>codefile1</em></u> -midlet jad=<u><em>demo1</em></u>.jad <u><em>demo1</em></u>.jar</li>
    <li>javaloader -usb load <u><em>codefile1</em></u>.cod
      <br /></li>
  </ol>
