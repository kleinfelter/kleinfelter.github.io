---
excerpt: "<p>Ubuntu has a habit of beeping the virtual PC's speaker.&nbsp; To silence
  it, add the following line to your VMX file on the host:</p>\r\n  <p><strong>mks.noBeep
  = &quot;TRUE&quot;</strong></p>\r\n  <p>Note: Make sure you get&nbsp;ordinary quote
  marks around the TRUE, and not typographic quotes.</p>\r\n  <p>If that doesn't work,
  in Ubuntu:</p>\r\n  <ul>\r\n    <li>vi /etc/modprobe.d/blacklist.conf and add &quot;blacklist
  pcspkr&quot;\r\n      <br /></li>\r\n  </ul>"
categories: []
layout: post
title: Silence the PC Speaker in VMware Guests
created: 1240537978
---
<p>Ubuntu has a habit of beeping the virtual PC's speaker.&nbsp; To silence it, add the following line to your VMX file on the host:</p>
  <p><strong>mks.noBeep = &quot;TRUE&quot;</strong></p>
  <p>Note: Make sure you get&nbsp;ordinary quote marks around the TRUE, and not typographic quotes.</p>
  <p>If that doesn't work, in Ubuntu:</p>
  <ul>
    <li>vi /etc/modprobe.d/blacklist.conf and add &quot;blacklist pcspkr&quot;
      <br /></li>
  </ul>
