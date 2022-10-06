---
excerpt: "<p>I'm fiddling around with VMWare Player and VirtualBox VMs.&nbsp; Naturally,
  I wanted to see if I could network between the two.&nbsp; The following seems to
  work. (VB=VirtualBox; VW=VMWare)</p>"
categories: []
layout: post
title: Networking VirtualBox and VMware
created: 1202855528
---
<p>I'm fiddling around with VMWare Player and VirtualBox VMs.&nbsp; Naturally, I wanted to see if I could network between the two.&nbsp; The following seems to work. (VB=VirtualBox; VW=VMWare)</p>
  <ul>
    <li>Create a TAP adapter (Adapter 1)&nbsp;via VB's VirtualBox.exe running in the host. </li>
    <ul>
      <li>Attached to Host Interface</li>
      <li>Interface Name = VirtualBox Host Interface 1 (matching the device name created by TAP)</li>
      <li>Cable Connected</li>
    </ul>
    <li>In VW's vmnetcfg.exe, create: 
      <ul>
        <li>VMNet0(Bridged)&nbsp;= Bridget to VirtualBox TAP Adapter </li>
        <li>VMNet1(Host-only) = Subnet 192.168.11.0; DHCP Start 128 and End 254 </li>
        <li>VMNet8(NAT) = Subnet 192.168.18.0; DHCP Start 128 and End 254; NAT gateway is 192.168.8.2 </li>
        <li>No &quot;automatic bridging&quot; </li>
        <li>NAT tab says VMnet host = VMnet8 </li>
      </ul>
    </li>
    <li>In Windows Network Connections: 
      <ul>
        <li>Ethernet-internal = DHCP </li>
        <li>Cisco VPN (Not used) </li>
        <li>Wireless Network Connection (Not used) </li>
        <li>VMware Network Adapter VMnet1 
          <ul>
            <li>Client for Microsoft Networks enabled; File and printer sharing for Microsoft Networks enabled; TCP/IP enabled with static IP 192.168.11.1 and no default gateway </li>
          </ul>
        </li>
        <li>VMware Network Adapter VMnet8 
          <ul>
            <li>Client for Microsoft Networks enabled; File and printer sharing for Microsoft Networks enabled; TCP/IP enabled with static IP 192.168.18.1 and no default gateway </li>
          </ul>
        </li>
        <li>VirtualBox Host Interface 1 
          <ul>
            <li>Client for Microsoft Networks enabled; VMWare Bridge Protocol enabled; File and printer sharing for Microsoft Networks enabled; TCP/IP enabled with static IP 192.168.0.1 and no default gateway </li>
          </ul>
        </li>
      </ul>
    </li>
    <li>Inside VB Windows 2000 client (Network and Dial-up Connections) 
      <ul>
        <li>Host-only Connection 4 = Client for Microsoft Networks enabled; File and printer sharing for Microsoft Networks enabled; TCP/IP enabled with static IP 192.168.0.101 and&nbsp;default gateway 192.168.0.1 </li>
        <li>Local Area Connection 3 = disabled </li>
      </ul>
    </li>
    <li>Inside VW Windows 2000 client 
      <ul>
        <li>Ethernet1-VMNet0-Bridged = Client for Microsoft Networks enabled; File and printer sharing for Microsoft Networks enabled; TCP/IP enabled with static IP 192.168.0.10 and no default gateway </li>
        <li>Ethernet2-VMNet8-NAT = Client for Microsoft Networks enabled; File and printer sharing for Microsoft Networks enabled; TCP/IP enabled with static IP 192.168.18.10 and&nbsp;default gateway 192.168.18.2 and DNS server 192.168.18.2 </li>
        <li>Ethernet3-VMNet1-HostOnly = Client for Microsoft Networks enabled; File and printer sharing for Microsoft Networks enabled; TCP/IP enabled with static IP 192.168.11.10 and no default gateway </li>
      </ul>
    </li>
    <li />
  </ul>
