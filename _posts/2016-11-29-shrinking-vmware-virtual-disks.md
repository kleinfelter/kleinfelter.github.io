---
categories: []
layout: post
title: Shrinking VMware Virtual Disks
created: 1480423836
redirect_from: /content/shrinking-vmware-virtual-disks
---
I had a Windows 10 VM, created from a real PC using VMware Converter.  The PC had one disk with two partitions.  I couldn't get VMware Fusion to shrink the disk.

I tried using Fusion on the host, going to General from the Settings for the VM.  I told it to shrink the single VMDK (which had the two partitions in it).  It wouldn't shrink it below 240 GB.

Then I went to a CMD prompt in the guest, and I used 

*   VMwareToolboxCmd.exe disk shrink D:\

and I shrank my VMDK file down to 80 GB.
