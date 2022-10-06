---
excerpt: "<p>Time Machine on my Mac started giving the &quot;The backup volume could
  not be found&quot; error when backing up. To make matters worse, it never gave a
  big &quot;Backups are NOT HAPPENING&quot; type of error dialog. </p>  <p>It turns
  out that I had disabled the built-in Ethernet, when I was testing a USB-Ethernet
  adapter. Time Machine apparently relies on the MAC address of the built-in Ethernet.
  Re-enabling the built-in Ethernet corrected the problem.</p>"
categories: []
layout: post
title: Time Machine Backups Failing
created: 1237061641
---
<p>Time Machine on my Mac started giving the &quot;The backup volume could not be found&quot; error when backing up. To make matters worse, it never gave a big &quot;Backups are NOT HAPPENING&quot; type of error dialog. </p>  <p>It turns out that I had disabled the built-in Ethernet, when I was testing a USB-Ethernet adapter. Time Machine apparently relies on the MAC address of the built-in Ethernet. Re-enabling the built-in Ethernet corrected the problem.</p>  <p>I had heard that some people had trouble with Time Machine on a Western Digital (WD) MyBook External drive, so I was worried that it wouldn't work on my 1TB WD MyBook.&#160; It worked fine, once I re-enabled the Ethernet.</p>  <p>The connection between a USB disk drive and an Ethernet address and Time Machine certainly violates the &quot;principle of least surprise.&quot;</p>
