---
excerpt: "First, I'll describe what I did; then why; then how.\r\n\r\nWhat:\r\n<ul>\r\n
  <li>I've got a Windows XP computer (host).\r\n <li>I've got Portable VirtualBox
  (PVB).\r\n <li>I've got a physical partition on the computer that is encrypted with
  TrueCrypt (TC).\r\n <li>I've got Ubuntu 10.4 (Lucid Lynx) installed as a guest in
  PVB.\r\n <li>I made the TC partition available in the guest as a physical partition.\r\n
  <li>I mounted the TC partition with TC in Lucid.\r\n <li>I shared the mounted TC
  file system from Lucid.\r\n <li>I accessed the shared file system from the host.\r\n</ul>\r\n\r\nWhy:\r\n<ul>\r\n
  <li>To see if I could!\r"
categories: []
layout: post
title: Sharing a TrueCrypt Physical Partition From a Linux Portable Virtualbox Guest
created: 1274304477
---
First, I'll describe what I did; then why; then how.

What:
<ul>
 <li>I've got a Windows XP computer (host).
 <li>I've got Portable VirtualBox (PVB).
 <li>I've got a physical partition on the computer that is encrypted with TrueCrypt (TC).
 <li>I've got Ubuntu 10.4 (Lucid Lynx) installed as a guest in PVB.
 <li>I made the TC partition available in the guest as a physical partition.
 <li>I mounted the TC partition with TC in Lucid.
 <li>I shared the mounted TC file system from Lucid.
 <li>I accessed the shared file system from the host.
</ul>

Why:
<ul>
 <li>To see if I could!
 <li>I have a very aggressive anti-virus installed on the host.  It treats several legitimate programs as "PUPs" (potentially unwanted programs) and it deletes them.  It does NOT do this on network shared drives.  I want these files accessible both in a VM and on the host.  The AV program is an all-or-nothing affair.
</ul>

How:
<ol>
  <li>See <a href="/node/118">Portable VirtualBox</a> to set up PVB.
  <li>Installing Ubuntu in PVB is not covered here.  It is a plain vanilla Ubuntu install.
  <li>Create a Virtualbox physical partition descriptor for the TC partition:
  <ul>
    <li>vboxmanage internalcommands listpartitions -rawdisk \\.\PhysicalDrive1
    <ul>
      <li>MY TC partition is on my second physical drive, which Windows calls \\.\PhysicalDrive1.  If you have only a single physical drive, it is probably called \\.\PhysicalDrive0
      <li>Note that the Windows TC's partition numbering scheme does not match VirtualBox's, so you really do have to do this step!
    </ul>
    <li>VBoxManage internalcommands createrawvmdk -filename raw-k.vmdk -rawdisk \\.\PhysicalDrive1 -partitions 8
    <ul>
      <li>Substitute the file name of your choice for raw-k.vmdk.
      <li>Substitute the partition number of your choice for 8. You can list multiple partitions, separated with commas.
    </ul>
    <li>Move raw-k.vmdk and raw-k-pt.vmdk to \pvb\pvb-data\.VirtualBox\HardDisks
    <li>Use the VirtualBox GUI to add raw-k.vmdk to you list of available virtual disks (File/Virtual Media Manager/Add...)
    <li>Use the VirtualBox GUI to add the vmdk to your Machine's disks.  Mine was added as IDE Secondary Slave.
  </ul>
  <li>Start your virtual machine via the GUI, and mount the partition from Lucid.  I recommend mounting it read-only, at least until you're sure things are set up correctly.  Run /usr/bin/truecrypt and mount it via the GUI.  Then dismount it, and set up a shell script to run:
  <ul>
    <li>mkdir /media/tc
    <li>/usr/bin/truecrypt  --mount /dev/sdc8 /media/tc
    <ul>
        <li>Of course, you will want to substitute YOUR correct device for /dev/sdc8
    </ul>
  </ul>
  <li>Because I'm using PVB, I don't have any network interfaces created by installing VirtualBox.  I needed to set up port forwarding with VirtualBox's NAT pseudo-interface.  First configure a loopback adapter:
  <ol>
    <li>Create a loopback adapter in the host:  Cpanel/Add Hardware/Yes I have already connected the hardware/Add a new hardware device/Install the hardware that I manually select/Network Adapters/Microsoft/Microsoft Loopback Adapter.
    <li>Rename the loopback adapter to "loopback1"
    <li>Bind Client for Microsoft Networks to loopback1.
    <li>Un-bind File and Printer Sharing from loopback1.  This frees up port 139 on loopback1.
    <li>Bind TCP/IP to loopback1.  Set TCP properties to Address=192.168.2.1, Interface Metric=9999, Enable LMHOSTS, Disable NetBIOS over TCP.
  </ol>
  <li>Set up port forwarding ("ubuntu-10.4" is MY guest's machine name; use your own.  smb139 is an arbitrary name for the forwarding rules; use your own.  139 is the port for Windows SMB/CIFS file sharing):
  <ol>
    <li>vboxmanage setextradata "ubuntu-10.4" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/smb139/HostPort" 139
    <li>vboxmanage setextradata "ubuntu-10.4" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/smb139/GuestPort" 139
    <li>vboxmanage setextradata "ubuntu-10.4" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/smb139/Protocol" TCP
  </ol>
  <li>Not it is time to share /media/tc from Lucid. I was lazy, so I installed KDE.  Then I clicked System/Preferences/System Settings (which KDE adds, even to Gnome)
  <ol>
    <li>On the Advanced tab, click Samba
    <li>Workgroup=HOME (Use your choice of workgroups)
    <li>NetBIOS Name=UVM104 (Use your choice of computer name)
    <li>Server String=%h  (Use your choice of server description)
    <li>Security Level=Share
    <li>Add a share for /media/tc, named tc.
    <li>Allow All unspecified users.
    <li>Users: Add kevin and kk.  (Note: I created a synonym user "kk" to match my host user ID by editing /etc/password, copying kevin, renaming it to kk, keeping the same UID and GID, and passwording kk.)
    <li>/etc/service restart smbd
    <li>/etc/service restart nmbd
  </ol>
  <li>From Windows map a network drive to \\192.168.2.1\tc, using user=kevin.  (I eventually got kk working, after I defined an SMB password for kk to match kk's password in Windows.)
</ol>

Some helpful links:
<ul>
  <li>http://www.blisstonia.com/eolson/notes/smboverssh.php
  <li>http://virtualboximages.com/node/158
  <li>http://www.aviransplace.com/2008/06/12/virtualbox-configuring-port-forwarding-with-nat/
</ul>
