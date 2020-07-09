---
excerpt: "Here's how to get a Blackberry 8700c to work on an AT&amp;T/Cingular account
  that has a data plan but not a &quot;Blackberry Data Plan.&quot;\r\n  \r\n  \r\n
  \ \r\n  <br />\r\n  <ol>\r\n    <li>On your PC, upgrade/downgrade your Blackberry
  Desktop to 4.2.2.14\r\n      \r\n      \r\n      \r\n      "
categories: []
layout: post
title: Using a Blackberry With a Data Plan Without a Blackberry Data Plan on AT&T/Cingular
created: 1200412460
---
Here's how to get a Blackberry 8700c to work on an AT&amp;T/Cingular account that has a data plan but not a &quot;Blackberry Data Plan.&quot;
  
  
  
  <br />
  <ol>
    <li>On your PC, upgrade/downgrade your Blackberry Desktop to 4.2.2.14
      
      
      
      <br /></li>
    <li>On your PC, with your Blackberry connected via USB, upgrade/downgrade your Blackberry Handheld to v4.2.1.96</li>
    <li>Go to Settings/Options/Advanced Options/TCP</li>
    <ol>
      <li>APN = wap.cingular</li>
      <li>Username for APN: = wap@cingulargprs.com</li>
      <li>Password = CINGULAR1
        
        
        
        <br /></li>
    </ol>
    <li>You might have to reboot your Blackberry at this point. (I did, but I don't know that it is necessary.)</li>
    <li>Now you've got data access, but none of the <u><em>Blackberry</em></u> applications will use it because it isn't a <u>Blackberry Data Plan</u>.</li>
    <li>On your PC, go to Opera.com and download and install Opera Mini v3, and install it using Blackberry Desktop.</li>
    <li>Run Opera, and confirm that you can get to the Internet.</li>
    <li>Now you probably want to add GMail.&nbsp; GMail assumes you can do an over-the-air install, which you can't, because Opera Mini v3 won't do downloads.&nbsp; (It calls upon the Blackberry browser to do them, and the Blackberry browser won't work without a <u>Blackberry Data Plan</u>.)</li>
    <ol>
      <li>Borrow a SIM card from a Blackberry that does have a Blackberry Data Plan.&nbsp; 
        
        <br /></li>
      <ol>
        <li>Move it to your Blackberry that doesn't have GMail.&nbsp; 
          
          <br /></li>
        <li>On your mail-free Blackberry, browse to http://gmail.com/app and install GMail.&nbsp; 
          
          <br /></li>
        <li>Then put the SIMs back into their 'proper' phones.&nbsp; 
          
          <br /></li>
        <li>Now you've got GMail.</li>
        <li>Note: In version 1.5.1, GMail added support for notify-on-new-email. In GMail, click once, select More, then Settings, then scroll down to &quot;Notify me when there is a new mail...&quot;
          
          <br /></li>
      </ol>
      <li>As an alternate, if you can't borrow a SIM, see <a href="http://www.blackberryforums.com/aftermarket-software/55917-new-gmail-app-bb-application-loader.html">http://www.blackberryforums.com/aftermarket-software/55917-new-gmail-app-bb-application-loader.html</a>&nbsp; , but it is more work.
        
        
        
        <br /></li>
    </ol>
    <li>I don't think you can turn off the &quot;Data connection refused&quot; message without turning off data (via Settings/Mobile Network)</li>
    <li>UPDATE: Opera 4 mini works too. I added Opera 4 mini by doing:</li>
    <ol>
      <li>Download BlackBerry_JDE_Components_4.2.1.exe</li>
      <li>Download Opera Mini 4 (opera-mini-4.0.10031-advanced-int.jad and opera-mini-4.0.10031-advanced-int.jar)</li>
      <li>Run BlackBerry_JDE_Components_4.2.1.exe. If you don't have a JDK, de-select that prerequisite failure.</li>
      <li>rapc import=&quot;c:\Program Files\Research in Motion\BlackBerry JDE Component Package 4.2.1\lib\net_rim_api.jar&quot; codename=Opera4 -midlet</li>
      <li>jad=opera-mini-4.0.10031-advanced-int.jad opera-mini-4.0.10031-advanced-int.jar</li>
      <li>javaloader -usb load Opera4.cod
        <br /></li>
    </ol>
  </ol>
