---
excerpt: "Some web sites drop connections from the guest, without returning anything
  (even headers).&nbsp; This happens with twitter.com when run from \r\n  <br />\r\n
  \ <br />&nbsp;&nbsp;&nbsp; * VMWare Fusion 2.0.2 on an OS X 10.5.5 host, with bridged
  networking, from a Windows XP SP3 guest \r\n  <br />&nbsp;&nbsp;&nbsp; * VMWare
  Player 2.0.5 on a Windows XP SP3 host, with NAT networking, from a Windows XP SP3
  guest \r\n  <br />\r\n  <br />This behavior is independent of the tool I use to
  send the request to the server: \r\n  <br />\r\n  "
categories: []
layout: post
title: Some Web Servers Drop Guest Connections (e.g. Twitter)
created: 1237590391
---
Some web sites drop connections from the guest, without returning anything (even headers).&nbsp; This happens with twitter.com when run from 
  <br />
  <br />&nbsp;&nbsp;&nbsp; * VMWare Fusion 2.0.2 on an OS X 10.5.5 host, with bridged networking, from a Windows XP SP3 guest 
  <br />&nbsp;&nbsp;&nbsp; * VMWare Player 2.0.5 on a Windows XP SP3 host, with NAT networking, from a Windows XP SP3 guest 
  <br />
  <br />This behavior is independent of the tool I use to send the request to the server: 
  <br />
  <br />&nbsp;&nbsp;&nbsp; * I tried fetching http://twitter.com/ from Firefox, and the connection gets dropped before returning data to Firefox. 
  <br />&nbsp;&nbsp;&nbsp; * I tried using &quot;wget --user-agent=Mozilla --server-response http://twitter.com/&quot; and it reports &quot;Read error (Connection reset by peer) in headers&quot; 
  <br />&nbsp;&nbsp;&nbsp; * I tried using telnet to port 80 at twitter.com, and issuing &quot;GET /&quot; manually, and the host disconnects immediately after I press Enter after the &quot;GET /&quot; 
  <br />
  <br />
  <br />Event Viewer on the Windows guests shows no errors.&nbsp; Neither guest is running a firewall.&nbsp; On both hosts, I can fetch the page via all the tools, but in the guest, twitter.com disconnects after receiving the request. 
  <br />
  <br />I'm not running a firewall on the OS X host.&nbsp; There is firewall software on the Windows host, but I told it not to filter connections.&nbsp; (I can't remove it entirely.&nbsp; Corporate IT policy.) 
  <br />
  <br />What else could I try?&nbsp; It really looks like some web servers are configured to reject GET requests that match some criteria, and VM guests match that criteria. 
  <br />
  <br />I'll donate $20 to a charity of your choice if you're the first commenter to come up with a solution.
