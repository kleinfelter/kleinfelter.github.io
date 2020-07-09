---
excerpt: "<p>I had the devil of a time getting a Belkin USB Network Hub (Model F5L009)
  to work.&nbsp; Symptoms included:</p>"
categories: []
layout: post
title: Belkin USB Network Hub (Model F5L009) - Control Center Can't Find the Belkin
  USB Network Hub
created: 1225041465
---
<p>I had the devil of a time getting a Belkin USB Network Hub (Model F5L009) to work.&nbsp; Symptoms included:</p>
  <ul>
    <li>I could ping the device (after I located its IP address from my DHCP server) </li>
    <li>I could open the device's web server (using its IP address from my DHCP server) </li>
    <li>Other computers on my network could see it </li>
    <li>On my laptop (from the real machine and from a virtual machine), &quot;Control Center&quot; (the device's user interface) clicking &quot;Manage Network USB Hubs&quot; (from the &quot;Search for and manage Network USB Hubs&quot; prompt) would always bring up an empty &quot;Connected Network USB Hubs&quot; list. </li>
  </ul>
  <p>I tried the following to no avail:</p>
  <ul>
    <li>Disabling McAfee </li>
    <li>Windows Firewall was already disabled </li>
    <li>Rebooting </li>
    <li>Re-installing the driver </li>
    <li>Adding another Ethernet device (a Belking USB Ethernet Dongle) </li>
  </ul>
  <p>Along the way, I decided to disable ALL other NICs (including the Microsoft Loopback Adapter), and it started working.&nbsp; Eventually, I narrowed it down to the loopback adapter.&nbsp; </p>
  <p>Solution -- Disable Microsoft Loopback Adapter.</p>
  <p>BTW - Support from Belking was abyssmal.&nbsp; It was pigin English, and it suggested that I try a number of troubleshooting steps that were <u>clearly</u> proven to be unnecessary from <u>my</u> list of what I had tried.&nbsp; (i.e. Don't tell me to check to see if I have my Ethernet cable plugged into my laptop.&nbsp; If I can ping the device, I clearly have a network connection!)</p>
  <p>Of course, like many problems, once you know the solution, it is trivial to repeat the solution.&nbsp; However, it took me weeks of part-time troubleshooting to discover the loopback adapter as the root cause.</p>
  <p>Another note: If you extract (via 7-zip) the setup.exe for this device, then you can get a prompt to enter the device MAC address if you run ...\utility\wired\setup.exe from the extracted folder.</p>
  <p><strong>Update:</strong></p>
  <p>After all that work to get the Control Center to see the hub, it could see the devices on the hub, but it still couldn't &quot;connect&quot; to them.&nbsp; There is nothing in the way of diagnostic messages to provide a clue as to why it can't connect.&nbsp; The Belkin FAQ suggests a firewall or a VPN problem, but neither is active on my (real or virtual) machine.&nbsp; I'm throwing it out.&nbsp; After ~20 hours, the opportunity cost (in&nbsp;MBA terminology) is just too much.&nbsp; From what I read, for many people, even when they get it connected, it is an unreliable connection.&nbsp; One less piece of clutter in my home.</p>
