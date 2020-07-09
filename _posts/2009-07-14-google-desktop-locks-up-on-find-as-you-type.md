---
excerpt: "Google Desktop was *sometimes* locking up on find-as-you-type, taking the
  CPU to 99%, and requiring me to kill and restart GoogleDesktop.exe to fix things.\r\n
  \ \r\n  <br />\r\n  <br />I ran TCPView, both with WinInet proxy on and off, and
  found that GoogleDesktop was connecting to my proxy or to gx-in-f101.google.co,
  when it starts find-as-you-type.&nbsp; For whatever reason (perhaps the&nbsp; firewall
  is blocking gx-in-f101.google.com), connections don't succeed, and GoogleDesktop
  apparently spins in a tight loop, waiting for the connection.\r\n  \r\n  <br />\r\n
  \ "
categories: []
layout: post
title: Google Desktop Locks Up on Find-as-you-type
created: 1247600494
---
Google Desktop was *sometimes* locking up on find-as-you-type, taking the CPU to 99%, and requiring me to kill and restart GoogleDesktop.exe to fix things.
  
  <br />
  <br />I ran TCPView, both with WinInet proxy on and off, and found that GoogleDesktop was connecting to my proxy or to gx-in-f101.google.co, when it starts find-as-you-type.&nbsp; For whatever reason (perhaps the&nbsp; firewall is blocking gx-in-f101.google.com), connections don't succeed, and GoogleDesktop apparently spins in a tight loop, waiting for the connection.
  
  <br />
  <br />If proxy was enabled, GoogleDesktop was connecting to the proxy, EVEN IF don't-use-proxy-for-local was checked, and gx-in-f101.google.com was entered in the list of local addresses.
  
  <br />
  <br />Hello, Google?&nbsp; Not everyone has 100% reliable connectivity to gx-in-f101.google.com, and it looks like you are only using part of the Wininet proxy config info.
  
  <br />
  <br />The solution is to use a PAC file and to direct gx-in-f101.google.com to &quot;&quot;PROXY localhost:1&quot;, to make the connection cleanly fail.&nbsp; Prevents the lock-up on find-as-you-type.
  
  <br />
  <br />UPDATE: GDS does a query to <a href="http://suggestqueries.google.com">suggestqueries.google.com,</a>&nbsp; and this query returns status 200.&nbsp; Blocking it doesn't prevent the lock-up.
  <br />
