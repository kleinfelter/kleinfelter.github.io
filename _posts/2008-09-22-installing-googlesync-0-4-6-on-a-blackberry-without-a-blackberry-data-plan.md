---
excerpt: "I use a Blackberry 8700 -- without a Blackberry data plan -- just a regular
  data plan.&nbsp; Here's how I installed Google Sync 0.4.6\r\n  \r\n  <br />\r\n
  \ <br />\r\n  <ol>\r\n    <li>Install UserAgentSwitcher 0.6.11 into Firefox 3, and
  configure a user agent:</li>\r\n    <ol>\r\n      <li>Description=&quot;blackberry
  8700&quot;</li>\r\n      <li>User Agent=&quot;BlackBerry8700/4.1.0 Profile/MIDP-2.0
  Configuration/CLDC-1.1 VendorID/180&quot;\r\n        \r\n        <br /></li>\r\n
  \   </ol>\r\n    <li>Tell Firefox to use the &quot;blackberry 8700&quot; user agent.\r\n
  \     \r\n      "
categories: []
layout: post
title: Installing GoogleSync 0.4.6 on a Blackberry Without a Blackberry Data Plan
created: 1222114644
---
I use a Blackberry 8700 -- without a Blackberry data plan -- just a regular data plan.&nbsp; Here's how I installed Google Sync 0.4.6
  
  <br />
  <br />
  <ol>
    <li>Install UserAgentSwitcher 0.6.11 into Firefox 3, and configure a user agent:</li>
    <ol>
      <li>Description=&quot;blackberry 8700&quot;</li>
      <li>User Agent=&quot;BlackBerry8700/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/180&quot;
        
        <br /></li>
    </ol>
    <li>Tell Firefox to use the &quot;blackberry 8700&quot; user agent.
      
      <br /></li>
    <li>Visit http://m.google.com/sync and download GoogleSync.jad</li>
    <li>You can open the .jad file with a text file.&nbsp; Inside it you'll find the URLs for the .cod (Blackberry's special modified .jar format).&nbsp; Download all 3:</li>
    <ol>
      <li>http://m.google.com/sync/apps/0.4.6/en/BlackBerry-41/GoogleSync_40_en.cod</li>
      <li>http://m.google.com/sync/apps/0.4.6/en/BlackBerry-41/GoogleSync_40_en-1.cod</li>
      <li>http://m.google.com/sync/apps/0.4.6/en/BlackBerry-41/GoogleSync_40_en-2.cod</li>
    </ol>
    <li>Install Blackberry Desktop 4.6.0 (if it isn't already installed).</li>
    <li>Install JDK 6u7 (if it isn't already installed).</li>
    <li>Copy the cod files (I also copied the .jad, but I didn't use it.) to &quot;C:\Program Files\Research In Motion\BlackBerry JDE 4.6.0\bin&quot;</li>
    <li>Open a command prompt in &quot;C:\Program Files\Research In Motion\BlackBerry JDE 4.6.0\bin&quot;</li>
    <li>Execute the following 3 commands:</li>
    <ol>
      <li>javaloader -usb load GoogleSync_40_en.cod</li>
      <li>javaloader -usb load GoogleSync_40_en-1.cod</li>
      <li>javaloader -usb load GoogleSync_40_en-2.cod</li>
    </ol>
    <li>Set your Firefox user agent back to &quot;Default&quot;!!!
      <br /></li>
    <li>Run Google Sync on the Blackberry from the newly-added icon.
      
      <br /></li>
  </ol>
