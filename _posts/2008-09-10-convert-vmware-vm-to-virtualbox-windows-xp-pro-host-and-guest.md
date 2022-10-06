---
excerpt: "<p><em><strong>ATTENTION: This is what I did on MY computer.&nbsp; You'll
  probably want to&nbsp;change this for use on YOUR computer.</strong></em></p>\r\n
  \ <p><em>Using VMWare Player (version ?) and VirtualBox (version 2.0)</em></p>\r\n
  \ <p><em>Note: Items marked with &quot;+&quot; are items I did in advance, so I
  don't have to do them on each conversion attempt.</em></p>\r\n  <p><strong>From
  <u>Original VMWARE</u> GUEST:</strong></p>"
categories: []
layout: post
title: Convert VMWare VM to VirtualBox (Windows XP Pro host and guest)
created: 1221081632
---
<p><em><strong>ATTENTION: This is what I did on MY computer.&nbsp; You'll probably want to&nbsp;change this for use on YOUR computer.</strong></em></p>
  <p><em>Using VMWare Player (version ?) and VirtualBox (version 2.0)</em></p>
  <p><em>Note: Items marked with &quot;+&quot; are items I did in advance, so I don't have to do them on each conversion attempt.</em></p>
  <p><strong>From <u>Original VMWARE</u> GUEST:</strong></p>
  <ul>
    <li>+Right-click My Computer, select <em>Properties</em>, <em>Advanced</em> tab, select <em>Settings</em> in <em>Startup and Recovery,</em> and give yourself at least 5-10 seconds for &quot;Time to display list of operating systems.&quot; </li>
    <li>Shut down the guest VM -- do not suspend it.&nbsp; Shut it down. </li>
  </ul>
  <p><strong>From host</strong>:</p>
  <ul>
    <li>Copy your whole VM to another directory </li>
  </ul>
  <p><strong>From <u>Copied VMWare Guest in Safe Mode</u></strong>:</p>
  <ul>
    <li>Boot the copied VM Guest in safe mode.&nbsp; (See <a href="/node/138">http://www.kleinfelter.com/node/138</a> for a tip on how to boot in safe mode despite VMWare's too-brief BIOS start-up.) </li>
    <li>Reduce your disk drives in use to 3. (VBOX will reserve one of your 4 IDE devices for CD/DVD.) </li>
  </ul>
  <blockquote dir="ltr" style="margin-right: 0px">
    <p><em>Note: All of the non-&quot;+&quot; below are in this handy script - </em><a href="/vmware-to-vbox-script-1"><em><u><font color="#810081">VMware-to-VBox-Script-1</font></u></em></a><em>.</em></p>
  </blockquote>
  <ul>
    <li>Right-click My Computer and rename it.&nbsp; Otherwise you'll get a duplicate name error&nbsp;from the network. </li>
    <li>+Run MergeIDE.reg from <a href="http://www.virtualbox.org/attachment/wiki/Migrate_Windows/MergeIDE.zip">http://www.virtualbox.org/attachment/wiki/Migrate_Windows/MergeIDE.zip</a></li>
    <li>+Search C:\Windows\system32 for hal*.* 
      <ul>
        <li>if you have only hal.dll (and not halacpi.dll or halaacpi.dll), you're good to go.&nbsp; </li>
        <li>Otherwise, see <a href="http://www.virtualbox.org/wiki/Migrate_Windows"><u><font color="#810081">http://www.virtualbox.org/wiki/Migrate_Windows</font></u></a>. 
          <ul>
            <li>Short form is to enable IO APIC in Vbox if and only if you have halaacpi.dll. </li>
            <li>I have hal.dll, so I'm good to go without IO APIC </li>
          </ul>
        </li>
      </ul>
    </li>
    <li>Delete (or rename to xxxxx.hideme) from the copied VM (if they exist): 
      <ul>
        <li>C:\WINDOWS\system32\drivers\agp440.sys </li>
        <li>C:\WINDOWS\system32\drivers\intelppm.sys </li>
        <li>C:\Windows\System32\drivers\processr.sys </li>
      </ul>
    </li>
  </ul>
  <p><strong>From <u>Copied VMWare Guest in&nbsp;Normal Mode</u></strong>:</p>
  <ul>
    <li>
      <p><em>Note: All of the non-&quot;+&quot; below are in this handy script - </em><em><a href="/vmware-to-vbox-script-2">VMware-to-VBox-Script-2</a></em><em>.</em></p>Restart the guest VM in normal mode.&nbsp; I recommend holding down shift-key to prevent your Startup folder from running. 
      <ul>
        <li>Uninstall VMWare Tools </li>
        <li>Delete C:\Program Files\VMware\VMware Tools </li>
        <li>Regedit: Confirm deleted HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Vmware Tools </li>
        <li>Regedit:&nbsp;Confirm deleted&nbsp;HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Vmware User Process </li>
        <li>Regedit: Delete HKLM\System\CurrentControlSet\Services\Eventlog\System\intelppm </li>
        <li>Regedit: Delete HKLM\System\CurrentControlSet\Services\intelppm </li>
        <li>Regedit: Set Start to 4 in HKLM\SYSTEM\CurrentControlSet\Services\Processor (if it exists) </li>
        <li>+Make sure you have no SMS Mouse driver (you'll need to be proficient with the KEYBOARD Windows interface): 
          <ul>
            <li>Open a command prompt </li>
            <li>set devmgr_show_nonpresent_devices=1 </li>
            <li>devmgmt.msc </li>
            <li>View/Show Hidden Devices </li>
            <li>Inside &quot;Mice and other pointing devices&quot; delete &quot;SMS Virtual Mouse&quot; if it exists. </li>
            <li>While you're there, delete other mice that you don't have. </li>
            <li>While you're there, delete the NIC devices that you don't have (particularly the VMWare ones) </li>
          </ul>
        </li>
      </ul>
    </li>
    <li>Shut down the guest VM -- do not suspend it.&nbsp; Shut it down. </li>
  </ul>
  <p><strong>From the VirtualBox GUI</strong></p>
  <ul>
    <li>Select File/Virtual Disk Manager 
      <ul>
        <li>Add the drives from your VM *copy* </li>
      </ul>
    </li>
    <li>Select Machine/New 
      <ul>
        <li>Give it a name (I used VBOX-VM-XP-1) </li>
        <li>Set Memory to 1024 MB </li>
        <li>Choose your boot disk </li>
      </ul>
    </li>
    <li>Click the Settings tool-button 
      <ul>
        <li>Add your disks beyond the boot disk. </li>
        <li>Enable sound (Windows DirectSound + ICH AC97) </li>
        <li>Add shared folders for C:\ and E:\ and F:\ </li>
        <li>Add a NAT NIC 
          <ul>
            <li>Note: I recommend the Intel Pro 1000 T&nbsp;Server NIC.&nbsp; You'll have to download the driver from Intel, but otherwise you may find that VBOX NIC drivers conflict with left-over bits of&nbsp;VMWARE drivers.&nbsp; Otherwise, the AMD NIC keeps getting recognized by the VMWARE drivers and not the VBOX drivers. </li>
            <li>Note2: I tried Host Interface Networking.&nbsp; I could get the host to ping the guest successfully, but the guest could not ping the host.&nbsp; DHCP worked, assigning an address (and the router confirmed that IT set the address.) Firewall was disabled on both, and Host Interface Networking was the only VBOX NCI.&nbsp; I gave up, and just went with NAT NIC.&nbsp;&nbsp; </li>
          </ul>
        </li>
      </ul>
    </li>
  </ul>
  <p><strong>Start your Vbox-VM:</strong></p>
  <ul>
    <li>It will want to install some drivers.&nbsp; Let it try.&nbsp; It may fail.&nbsp; Oh well. 
      <ul>
        <li>Select Device/Install-Guest-Extensions from the VM menu bar.&nbsp;&nbsp; 
          <ul>
            <li>&nbsp;If auto-install doesn't happen, start the install and complete it. </li>
            <li>Let it reboot </li>
          </ul>
        </li>
      </ul>
    </li>
  </ul>
  <p><strong>Note:</strong></p>
  <p>I have been totally unable to get &quot;Host Interface&quot; networking to work.&nbsp; </p>
  <p>I created the interface, and I bridged it to a real interface, and I assigned an IP to the bridge and it didn't work.</p>
  <p>I created the interface, and I assigned it 192.168.99.1 and I assigned 192.168.99.2 to the client's NIC and it didn't work.</p>
  <p>I tried bridging it to a real NIC and I also (separately) tried bridging it to the Loopback adapter and I got nowhere.</p>
  <p>I get too-frequent blue screens with VBox Shared Folders, so I needed to be able to map a host drive in the client.&nbsp; I can't just use the host's real IP address (e.g. <a href="file://\\10.20.2.42\c-drive">\\10.20.2.42\c-drive</a>) because I use the host&nbsp;at&nbsp;multiple sites and it gets a different IP address at each.&nbsp; Ultimately, I bound the Host's Loopback adapter to 192.168.99.99, and in the guest I mapped to <a href="file://\\192.168.99.99\c-drive">\\192.168.99.99\c-drive</a>, and I used only a single NAT virtual NIC.</p>
  <p><strong>Helpful web pages</strong>:</p>
  <ul>
    <li><a href="http://blogs.msdn.com/virtual_pc_guy/archive/2005/10/24/484461.aspx">http://blogs.msdn.com/virtual_pc_guy/archive/2005/10/24/484461.aspx</a></li>
    <li><a href="http://www.virtualbox.org/wiki/Migrate_Windows">http://www.virtualbox.org/wiki/Migrate_Windows</a></li>
  </ul>
