---
excerpt: "<p><strong>Which VMNet is Which?</strong></p>\r\n  <ul>\r\n    <li>VMnet0
  is for bridged networking</li>\r\n    <li>VMnet8 is for NAT networking</li>\r\n
  \   <li>VMnet1 is for Host-only networking</li>\r\n  </ul>\r\n  <p><strong>DNS Failure
  in Guest</strong></p>\r\n  <p>I was getting DNS failures in my Windows XP Guest
  most of the time at work, and some of the time at home.&nbsp; I read numerous posts
  suggesting that VMWare's NAT DNS is flakey.&nbsp; However in my case, the&nbsp;guest
  was simply timing out on DNS resolution.&nbsp; To confirm that this is the problem,
  do the following in the guest:</p>"
categories: []
layout: post
title: VMWare Notes and Learnings
created: 1190819851
---
<p><strong>Which VMNet is Which?</strong></p>
  <ul>
    <li>VMnet0 is for bridged networking</li>
    <li>VMnet8 is for NAT networking</li>
    <li>VMnet1 is for Host-only networking</li>
  </ul>
  <p><strong>DNS Failure in Guest</strong></p>
  <p>I was getting DNS failures in my Windows XP Guest most of the time at work, and some of the time at home.&nbsp; I read numerous posts suggesting that VMWare's NAT DNS is flakey.&nbsp; However in my case, the&nbsp;guest was simply timing out on DNS resolution.&nbsp; To confirm that this is the problem, do the following in the guest:</p>
  <p><code></code></p>
  <p>If it succeeeds (and lookups failed before) then you need to increase your DNS timeout in the guest. Using regedit, update (or create -- type is REG_MULTI_SZ) HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\DNSQueryTimeouts with a value that resembles: 9 1 1 1 1 0 
    <br /></p>
  <ol>
    <li>The first digit is &quot;Query the preferred DNS server on a preferred connection&quot; </li>
    <li>Second digit: &quot;Query the preferred DNS server on all connections.&quot; </li>
    <li>3rd digit: &quot;Query all DNS servers on all connections (1st attempt).&quot; </li>
    <li>4th&nbsp;digit: &quot;Query all DNS servers on all connections (2nd attempt).&quot; </li>
    <li>5th&nbsp;digit: &quot;Query all DNS servers on all connections (3rd attempt).&quot; </li>
    <li>6th digit: Must be zero. </li>
  </ol>
  <p><strong>Slow Guest</strong></p>
  <ul>
    <li>VMWare client (Windows 2000) was running VERY slow.&nbsp; Response time was OK, but the clock ticked off the seconds at about 1 tick per&nbsp;5&nbsp;real seconds. 
      <ul>
        <li>Solution 1: It turns out that my Dell Precision M70 laptop's Windows XP Pro had recognized the&nbsp;PC as a ACPI Multiprocessor PC.&nbsp; It has only one processor.&nbsp; Start Device Manager, open Computer, right click on ACPI Multiprocessor PC, Update Driver, Install from a list or a specific location, Don't search - I will choose, select Advanced Configuration and Power Interface (ACPI) PC.&nbsp; It will want to reboot twice.&nbsp; (Let it do so.) </li>
        <li>Solution 2: Open a Cygwin bash prompt and run a &quot;while true do echo foo done&quot; loop to keep the CPU busy and prevent it going to S3 or S4 power state.&nbsp; </li>
      </ul>
    </li>
    <li>VMNet1 keeps showing as disabled in vmnetcfg, but the Windows host thinks the virtual NIC is connected. Network Neighborhood/[VMNet1 NIC]/Status shows no IP address. Host and guest are unable to communicate via VMNet1's IP addresses (ping fails). 
      <ul>
        <li>Using vmnetcfg.exe, delete VMNet1 (don't forget to click Apply), and re-create VMNet1. No need to stop the VM first. </li>
      </ul>
    </li>
  </ul><hr />
  <p>Getting Vmware networking set up just the way I want it has proven to be time consuming, so I want to capture the setup that is working for me.</p>
  <p><strong>vmnetcfg</strong></p>
  <ol>
    <li>Run vmnetcfg.exe (in &quot;C:\Program Files\Vmware\Vmware player&quot;) </li>
    <li>Set up the following interfaces (check the Summary tab): 
      <ol>
        <li>VMNet0 (Bridged) </li>
        <li>VMNet1 (Host-only) </li>
        <li>VMNet8 (NAT) </li>
      </ol>
    </li>
    <li>On the Automatic Bridging tab, disable automatic bridging. (Corporate network control freaks don't like unauthorized bridges on their networks.) </li>
    <li>On the Host Virtual Network Mapping tab (via the &quot;&gt;&quot; buttons): 
      <ol>
        <li>VMNet1: 
          <ol>
            <li>Subnet = 192.168.11.1, Mask = 255.255.255.0, then click Apply on the Virtual Network Mapping tab </li>
            <li>DHCP = Start: 192.168.11.128, End: 192.168.11.254 </li>
          </ol>
        </li>
        <li>VMNet8: 
          <ol>
            <li>Subnet = 192.168.18.1, Mask = 255.255.255.0, then click Apply on the Virtual Network Mapping tab </li>
            <li>DHCP = Start: 192.168.18.128, End: 192.168.18.254 </li>
            <li>NAT: Gateway = 192.168.18.2 </li>
          </ol>
        </li>
      </ol>
    </li>
    <li>On the HOST PC, open Network Connections: 
      <ol>
        <li>Configure &quot;VMware Network Adapter VMnet1&quot; 
          <ol>
            <li>IP address = 192.168.11.1, Mask = 255.255.255.0, Gateway is empty, DNS servers are empty </li>
          </ol>
        </li>
        <li>Configure &quot;VMware Network Adapter VMnet8&quot; 
          <ol>
            <li>IP address = 192.168.18.1, Mask = 255.255.255.0, Gateway is empty, DNS servers are empty </li>
          </ol>
        </li>
      </ol>
    </li>
    <li>Make your vmx files look a lot like the following (but with different MAC addresses for different VMs) </li>
  </ol>
  <table height="252" width="387" border="0">
    <tbody>
      <tr>
        <td>
          <p>ethernet0.present = &quot;TRUE&quot; 
            <br />ethernet0.startConnected = &quot;FALSE&quot; 
            <br />ethernet0.addressType = &quot;generated&quot; 
            <br />ethernet0.generatedAddress = &quot;00:0c:29:87:11:00&quot; 
            <br />ethernet0.generatedAddressOffset = &quot;0&quot;</p>
          <p>ethernet1.present = &quot;TRUE&quot; 
            <br />ethernet1.connectionType = &quot;nat&quot; 
            <br />ethernet1.addressType = &quot;generated&quot; 
            <br />ethernet1.generatedAddress = &quot;00:0c:29:89:11:01&quot; 
            <br />ethernet1.generatedAddressOffset = &quot;10&quot; 
            <br />ethernet1.startConnected = &quot;TRUE&quot;</p>
          <p>ethernet2.generatedAddress = &quot;00:0c:29:89:11:02&quot; 
            <br />ethernet2.generatedAddressOffset = &quot;20&quot; 
            <br />ethernet2.addressType = &quot;generated&quot; 
            <br />ethernet2.present = &quot;TRUE&quot; 
            <br />ethernet2.connectionType = &quot;hostonly&quot; 
            <br />ethernet2.startConnected = &quot;TRUE&quot;</p>
        </td>
      </tr>
    </tbody>
  </table>
  <ol>
    <li>In the guest OS 
      <ol>
        <li>Set its NICs to use DHCP.&nbsp; This will let you figure out which NIC is on which net.&nbsp; Write down which is which or rename the connections to the vmnet.&nbsp;&nbsp; I like names such as: 
          <ol>
            <li>Ethernet1-VMNet0-Bridged </li>
            <li>Ethernet2-VMNet8-NAT </li>
            <li>Ethernet3-VMNet1-HostOnly </li>
          </ol>
        </li>
        <li>ping and tracert 192.168.11.1 and 192.168.18.1 and make sure they are routed correctly. </li>
        <li>ping and tracert mindspring.com (or other external address that responds to ping) </li>
        <li>Set its NICs to use static IPs: 
          <ol>
            <li>My Win2K is on 192.168.11.10 (no gateway, no DNS) and <strong>192.168.18.10</strong> (<strong>192.168.18.2 for gateway and DNS</strong>) </li>
            <li>My Ubuntu7 is on 192.168.11.20 (eth1: no gateway, no DNS) and (eth2: 192.168.18.2 for gateway and DNS) 192.168.18.20 </li>
          </ol>
        </li>
        <li>ping and tracert 192.168.11.1 and 192.168.18.1 and make sure they are routed correctly. </li>
        <li>ping and tracert mindspring.com (or other external address that responds to ping) </li>
      </ol>
    </li>
    <li>Note: changing ethernetx.present from True to False or vice-versa, re-arranges which NIC is which in the client OS.&nbsp; Try to avoid doing it. </li>
  </ol>
  <p><strong>Slow or Stuck or Two Mouse Pointers</strong></p>
  <p>If your mouse pointer movement is erratic, it won't go to some points on the VMWare virtual display, or it moves VERY slow, check CPanel/Mouse/Hardware.&nbsp; Do you see &quot;PS/2 Compatible Mouse?&quot;&nbsp; You should see &quot;VMWare Pointing Device&quot;.&nbsp; If you don't, install or upgrade VMWare Tools in the guest.</p>
  <p>temporary end</p><!-- google_ad_section_end -->
  <p>&nbsp;</p>
  <pre>
nlsookup
  set timeout=9
  www.google.com</pre>
