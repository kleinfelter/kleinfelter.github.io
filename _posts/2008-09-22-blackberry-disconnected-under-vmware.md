---
excerpt: "<p>I tried to get Blackberry Desktop and Blackberry Device Manager to work
  under VMware.&nbsp; I found the VID and the PID in the host, and set up an autoconnect
  in the .VMX file, but the BB device mananger was unable to locate the BB.&nbsp;
  I went through some drastic troubleshooting, suggested by VMware, including deleting
  all the USB devices (all of them -- not just BB) and rebooting.</p>\r\n  <p>Eventually,
  what got it recognized was when I did two things (one might be enough, but which?):</p>\r\n
  \ <p>1. Open the back cover and push a paperclip into the reset hole in the BB.</p>"
categories: []
layout: post
title: Blackberry Disconnected Under VMware
created: 1222137174
---
<p>I tried to get Blackberry Desktop and Blackberry Device Manager to work under VMware.&nbsp; I found the VID and the PID in the host, and set up an autoconnect in the .VMX file, but the BB device mananger was unable to locate the BB.&nbsp; I went through some drastic troubleshooting, suggested by VMware, including deleting all the USB devices (all of them -- not just BB) and rebooting.</p>
  <p>Eventually, what got it recognized was when I did two things (one might be enough, but which?):</p>
  <p>1. Open the back cover and push a paperclip into the reset hole in the BB.</p>
  <p>2. Disable USB autoconnect in the VMX, and manually attach the BB via the &quot;Devices/Research in Motion USB Device&quot; menu.</p>
  <p>I suspect that it was number 2 that did it.</p>
  <p><hr />UPDATE: No, that didn't work.&nbsp; Resetting the BB does let USB get started, but it won't finish.&nbsp; I also tried:</p>
  <ul>
    <li>usb.generic.skipSetConfig = &quot;TRUE&quot;</li>
    <li>uhci.syncWriteback = &quot;TRUE&quot;</li>
    <li>ehci.syncWriteback = &quot;TRUE&quot;</li>
    <li>and also turning off ehci device in VMX</li>
  </ul>
  <p>They didn't help USB synch, but they did get my bluetooth dongle working in the VM!</p>
  <p>Then I discovered that there was an old security policy on the BB.&nbsp; (I bought it used.)&nbsp; Google for &quot;adding desktop connectivity wireless bypass services.</p>
  <p>&nbsp;</p>
