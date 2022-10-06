---
excerpt: "<p>There are multiple ways to do much of this.&nbsp; I'm going to explain
  some.&nbsp; I'm going to say 'iPhone,' because that is the USB device I'm going
  to connect.&nbsp; You can do something VERY similar for other USB&nbsp;devices.&nbsp;
  In these instructions, all commands, editing, files, etc. are on the Linux host,
  unless specifically designated otherwise.</p>\r\n  <p>Note that VID (or vid) is
  short for Vendor ID, and PID (or pid) is short for Product ID.</p>\r\n  <p>The first
  thing you have to do is to find the necessary information about your USB device.&nbsp;
  Here are two methods.</p>"
categories: []
layout: post
title: Always Connecting a Single USB Device to a Windows Guest in a VMware Player
  Running on a Linux Host
created: 1300147168
---
<p>There are multiple ways to do much of this.&nbsp; I'm going to explain some.&nbsp; I'm going to say 'iPhone,' because that is the USB device I'm going to connect.&nbsp; You can do something VERY similar for other USB&nbsp;devices.&nbsp; In these instructions, all commands, editing, files, etc. are on the Linux host, unless specifically designated otherwise.</p>
  <p>Note that VID (or vid) is short for Vendor ID, and PID (or pid) is short for Product ID.</p>
  <p>The first thing you have to do is to find the necessary information about your USB device.&nbsp; Here are two methods.</p>
  <h2>Method 1</h2>
  <ol>
    <li>Make sure your VM is running.&nbsp; Plug in your iPhone.</li>
    <li>Using either the VMware menus or the VMware icon for your iPhone, connect your iPhone to your VM manually.</li>
    <li>Open a Terminal session in the folder where your VM's .vmx file lives. Execute this command:</li>
    <ul>
      <li>grep -i usb vmware.log | grep -i device | more</li>
    </ul>
    <li>Find the lines for your iPhone.&nbsp;&nbsp;One&nbsp;will contain (in part) something resembling:</li>
  </ol>
  <pre>
USB: Found device [name:Apple\ iPhone vid:05ac pid:1294 path:2/1/1 speed:high family:vendor,imaging]</pre>
  <p>Note the values for vid and pid (0x05ac and 0x01294 -- they are hex).</p>
  <p>&nbsp;</p>
  <h2>Method 2</h2>
  <p>At a bash prompt, run:</p>
  <ul>
    <li>lsusb</li>
  </ul>
  <p>You're going to examine the output from lsusb, until you find the information for your iPhone.&nbsp; I found something like:</p>
  <pre>
Bus 002 Device 008: ID 05ac:1294 Apple, Inc. iPhone 3GS</pre>
  <p>Basically, this tells me that I have an iPhone plugged into a specific USB port (bus 2, device 8).&nbsp; After the &quot;ID&quot; it provides the vid and the pid (0x5ac and 0x1294).</p>
  <p>I confirmed that I had&nbsp;the right values by taking the bus number (2) and the device number (8) from the output, and I ran:</p>
  <p><strong>lsusb -v -s 2:8 | more</strong></p>
  <p>This tells it to tell me all the details about the device on bus 2, device 8.&nbsp; I'm not going to show you all of that output, but the important information was:</p>
  <pre>
&nbsp; idVendor&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x05ac Apple, Inc.<BR>&nbsp; idProduct&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1294 iPhone 3GS<BR></pre>
  <p>So my VID is 0x05ac, and my PID is 0x1294.</p>
  <h2>After Method 1 or Method 2:</h2>
  <p>Power down the VM, and edit the .vmx file.&nbsp; Add a line which resembles the following.&nbsp; (If you already have usb.autoConnect.device0, use device1; if you have device1, use device2; etc.)</p>
  <pre>
usb.autoConnect.device0 = "0x5ac:0x1294"</pre>
  <p>Of course, if you're using a different device than my iPhone 3Gs, substitute your vid:pid values.</p>
  <p>&nbsp;This is supposed to connect the iPhone when the VM starts, if the iPhone is already plugged into the host.&nbsp; It doesn't do that for me.&nbsp; What it <em>does</em> do is to connect my iPhone to the VM if the VM is running when I plug in the iPhone.</p>
