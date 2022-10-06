---
excerpt: "<p>I wanted to set up a Windows XP Guest, and have it share its files TO
  the host, using Windows networking (a.k.a. SMB, a.k.a. CIFS), via the VirtualBox
  NAT interface. (I'm using Portable-Virtualbox, and it supports ONLY the NAT adapter.)
  This IS possible. I've done it. Here's how. </p>"
categories: []
layout: post
title: Sharing Files From a VirtualBox Guest To The Host Using NAT Adapter
created: 1297997935
---
<p>I wanted to set up a Windows XP Guest, and have it share its files TO the host, using Windows networking (a.k.a. SMB, a.k.a. CIFS), via the VirtualBox NAT interface. (I'm using Portable-Virtualbox, and it supports ONLY the NAT adapter.) This IS possible. I've done it. Here's how. </p>
  <ol>
    <li>In the guest, assign its adapter the permanent address of 10.0.2.15.</li>
    <li>Give it a net mask of 255.255.255.0.  (Otherwise, if you use 10.0.0.1 for your host loopback, you've got a problem.)</li>
    <ul>
      <li>You can use another address, but you'll have to consistently substitute your other address EVERYWHERE I use this one.</li>
    </ul>
    <li>Create a Loopback adapter in the host.&nbsp; (See <a href="/loopback-adapter-xp"><u><font color="#0000ff">http://www.kleinfelter.com/loopback-adapter-xp</font></u></a>&nbsp;for de..tails.)</li>
    <li>Configure the Loopback adapter</li>
    <ol>
      <li>Enable Client for Microsoft Networks.</li>
      <li>Disable File and Printer Sharing for Microsoft Networks.</li>
      <li>Enable Interent Protocol (TCP/IP)</li>
      <li>Click on properties for TCP/IP</li>
      <li>Assign the address 10.0.0.1.</li>
      <ul>
        <li>You can use another address, such as 192.168.2.2, but you'll have to consistently substitute your other address EVERYWHERE I use this one.</li>
      </ul>
      <li>From Advanced-&gt;WINS:</li>
      <ol>
        <li>Enable LMHosts Lookup</li>
        <li>Disable NetBIOS over TCP/IP</li>
      </ol>
      <li>Enter 9999 for the interface metric.</li>
    </ol>
    <li>Start VirtualBox and define the following port-forwarding rules for the NAT adapter</li>
    <ol>
      <li>10.0.0.1, TCP port 135 to 10.0.2.15, same port</li>
      <li>10.0.0.1, UDP port 135 to 10.0.2.15, same port</li>
      <li>10.0.0.1, TCP port 136 to 10.0.2.15, same port</li>
      <li>10.0.0.1, UDP port 136 to 10.0.2.15, same port</li>
      <li>10.0.0.1, TCP port 137 to 10.0.2.15, same port</li>
      <li>10.0.0.1, UDP port 137 to 10.0.2.15, same port</li>
      <li>10.0.0.1, TCP port 138 to 10.0.2.15, same port</li>
      <li>10.0.0.1, UDP port 138 to 10.0.2.15, same port</li>
      <li>10.0.0.1, TCP port 139 to 10.0.2.15, same port</li>
      <li>10.0.0.1, UDP port 139 to 10.0.2.15, same port</li>
      <li>10.0.0.1, TCP port 445 to 10.0.2.15, same port</li>
      <li>10.0.0.1, UDP port 445 to 10.0.2.15, same port</li>
    </ol>
    <li>Exit VirtualBox</li>
    <li>Reboot the host</li>
    <li>Start VirtualBox, and start your guest.</li>
    <li>Inside the guest, share your C-drive as &quot;C&quot;.</li>
    <li>In the host, Start-&gt;Run, and enter \\10.0.0.1\C</li>
  </ol>
Note: You can dispense with setting up the Loopback adapter, but it is awkward.  Here's how:
<ol>
<li>Don't create a loopback adapter.   (Or you can ignore the one you set up.)</li>
<li>Set up the VirtualBox port forwarding as above, using "127.0.0.9" instead of "10.0.0.1"</li>
<li>Instead of Start-&gt;Run with \\10.0.0.1, you'll use \\127.0.0.9, but BEFORE YOU DO SO</li>
<ul><li>From a Command prompt, enter "net stop server"</li>
</ul>
</ol>
You have to do this in order to disconnect the host's SMB/CIFS (file server) protocol from 127.0.0.*.  When you used a virtual Loopback adapter (which you assigned to 10.0.0.1), you disconnected the file server protocol from the adapter when you followed the "Disable File and Printer Sharing for Microsoft Networks" instruction above.  Since the 127.*.*.* address range doesn't show up in Network Connections as an adapter, you have to stop (or uninstall) the file sharing service.

Conveniently, once you've connected to the guest via 127.0.0.9, you can enter "net start server" and re-start file sharing on the host, without losing your connection to the guest.

Note: If you are using McAfee Host Intrusion Preventionon your host machine, here's some extra steps to do before you Start-&gt;Run and \\whatever:
<ol>
<li>Right-click on the "M" in a shield in the Windows "notification" area.</li>
<li>Select "Manage Features"</li>
<li>Select "McAfee Host Intrusion Prevention"</li>
<li>Select "Disable Firewall"</li>
</ol>
After you've connected to the guest, follow the instructions for disabling the firewall, but in the last step select "Restore Settings" instead of "Disable Firewall"
