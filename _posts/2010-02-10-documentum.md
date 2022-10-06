---
excerpt: "<p>I really don't like the implementation of Documentum at my current employer.</p>\r\n
  \ <p>Today, Documentum doesn't like me either.&nbsp; When I click on the name of
  a file that I used to be able to view, it shows me a blank Internet Explorer page.&nbsp;
  Bummer.</p>\r\n  <p><strong><font color=\"#0003ff\">UPDATED RESOLUTION: </font></strong></p>"
categories: []
layout: post
title: Documentum
created: 1265833614
---
<p>I really don't like the implementation of Documentum at my current employer.</p>
  <p>Today, Documentum doesn't like me either.&nbsp; When I click on the name of a file that I used to be able to view, it shows me a blank Internet Explorer page.&nbsp; Bummer.</p>
  <p><strong><font color="#0003ff">UPDATED RESOLUTION: </font></strong></p>
  <p><strong><font color="#0003ff">1. After IE shows the blank window,&nbsp;click in&nbsp;the address bar and hit Enter.&nbsp; If the Documentum plug-in is not installed on your compter, this will cause IE to go through its do-you-want-to-install-this dialog for Duckumentom.&nbsp; Let it install.</font></strong></p>
  <p><strong><font color="#0003ff">2. Set the <u>Java</u> proxy (via Control Panel Java applet) to official employer's PAC file, exit all browsers, ensure that NO Java is running, and restart IE</em />.</font></strong></p>
  <p><strong><font color="#0003ff">RETURNING TO THE ORIGINAL STORY</font></strong></p>
  <ul>
    <li>I tried rebooting.&nbsp; No joy. </li>
    <li>I uninstalled all versions of Java, and deleted my Windows tmp directory (there were ~10,000 files there), rebooted, installed the company-approved edition of Java (1.6.0_16). No joy. </li>
    <li>Uninstall everything from &quot;C:\windows\Downloaded Program Files&quot; (by right-clicking on it and selecting Remove). Revisit Documentum.&nbsp; It downloaded and installed something.&nbsp; Still can't open a file. </li>
    <li>THE NEXT DAY: I'm in the office today (yesterday was VPN).&nbsp; When I attempted to open a file, it downloaded something ADDITIONAL, and now it works.&nbsp; I'm thinking that either IE or Java security was confused by the VPN.&nbsp; 
      <br /></li>
    <li>If it happens again, I'm going to set both IE and Java to anything-goes for all sites and see what happens.&nbsp; </li>
    <li>Oh, you know.... There is something else different besides the VPN.&nbsp; At home, I use VPN <u>over WiFi</u>.&nbsp; It wouldn't hurt to try it over a wired VPN connection with the WiFi disabled.&nbsp; </li>
  </ul>
  <p>UPDATE:&nbsp; It now works from home, over VPN and over WiFi.&nbsp; My best guess is that there is a cached component (the download that happened on &quot;THE NEXT DAY&quot; above) and that download was failing security or failing to choose the right network adapter.&nbsp; The conclusion is, when Documentum shows a mostly blank page after you click on a document link, go to the office, connect via wired LAN without VPN, open ANY Microsoft Office document that is stored in documentum, and the problem will go away. 
    <br /></p>
  <p>Update 2: It isn't working again.&nbsp; I'm at the office.&nbsp; </p>
  <p>The following seems to clear it up:</p>
  <ul>
    <li>Delete temp files in IE. </li>
    <li>Delete all of C:\Temp. </li>
    <li>Delete Java temp data (via the Java Control Panel applet) </li>
    <li>Uninstall everything from &quot;C:\windows\Downloaded Program Files&quot; (by right-clicking on each item and selecting Remove). </li>
    <li>Reboot. </li>
    <li>Set IE proxy to official employer's PAC file. </li>
    <li>Revisit Documentum WITHOUT running my startup stuff. </li>
    <li>Move to Project Module on project 216745. </li>
    <li>Select Artifacts view. </li>
    <li>It wants to install Webtop.&nbsp; Tell it OK. </li>
    <li>Navigate to folder containing documents. </li>
    <li>Wait a minute. </li>
    <li>Click on a document.&nbsp; Wait about 2 minutes.&nbsp; It eventually shows a progress bar and opens the document. </li>
  </ul>
  <p>I'm sure it doesn't require ALL of the above, but I don't (yet) know a minimal subset.&nbsp; Let's see if I can break it:</p>
  <ul>
    <li>Set IE proxy to <a href="file:///t:/pac/employer-name-here/proxy.pac">file://t:/pac/employer-name-here/proxy.pac</a></li>
    <li>Exit/restart IE. </li>
    <li>Revisit&nbsp;Prism WITHOUT running my startup stuff. </li>
    <li>Move to Project Module on project 216745. </li>
    <li>Select Artifacts view. </li>
    <li>Navigate to folder containing documents. </li>
    <li>Click on a document.&nbsp; Does not open. </li>
    <li>Set the proxy back to official employer's PAC file. </li>
    <li>It is still broken. </li>
    <li>Close all IE. </li>
    <li>Kill javaw.exe </li>
    <li>restart IE. </li>
    <li>Revisit Prism. </li>
    <li>Move to Project Module on project 216745. </li>
    <li>Select Artifacts view. </li>
    <li>Navigate to folder containing documents. </li>
    <li>Click on a document. </li>
    <li>It works again. </li>
  </ul>
  <p>New theory -- Maybe once javaw.exe throws an exception, it never fully recovers.&nbsp; Try this the next time it fails:</p>
  <ol>
    <li>Set proxy to official employer's PAC file. </li>
    <li>Exit all IE. </li>
    <li>Make sure javaw.exe is NOT running. </li>
    <li>Start IE again and try to access the document. </li>
  </ol>
  <p>&quot;Final&quot; disposition:</p>
  <ul>
    <li>When at work, set the <u>Java</u> proxy (via Control Panel Java applet) to official employer's PAC file, and <strong>restart IE</em />.</strong></li>
  </ul>
  <p>&nbsp;</p>
