---
categories: []
layout: post
title: How to Find the Optimum MTU on a Windows PC
created: 1326214050
redirect_from: /content/how-find-optimum-mtu-windows-pc
---
Here's how to find the optimum MTU from a Windows PC to a server.  Note that you can't really have an optimum MTU that works to ALL servers, because some of them will be on networks with unusual MTUs, so pick a server and tune to it.  In the discussion which follows, I've assumed your server is at 10.11.12.13.  Substitute the address of YOUR server.

<ul>
<li>ping  139.76.90.5  -f -l 1500
   <ul><li>Note that is a lower case F and a lower case L.<li>This will almost certainly produce a fragmentation error message.</ul>
<li>Reduce the ping length ( the “1500” in the step above) by 25 and repeat the ping.  If you get a fragmentation error, repeat this step, reducing by 25 each time, until you get a successful ping.
<li>Increase the ping length by 4, and repeat the ping.  If you DON’T get a fragmentation error, repeat this step, increasing by 4 each time until you get a failed ping.
<li>Reduce the ping length by 1, until you do NOT get a fragmentation error.
</ul>
That last number is your MTU.  If you want to change your PC's MTU, update HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\<AdapterID>\MTU in your registry.
