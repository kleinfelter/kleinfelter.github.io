---
excerpt: "I installed both Parallels 5 and VMware Fusion 3.1.1 on my Macbook.  Here
  are some observations:\r\n\r\nIn Fusion's favor:\r\n* Fusion is more robust.  I've
  got an ISO of a TrueImage 11 boot CD.  Parallels just couldn't boot it.  Fusion
  could.  I tried lots of different OS settings and \"Safe Mode\" and Parallels kept
  reporting VM crashed.  No problems with Fusion.  Ultimately, I created a VM with
  Fusion, and restored the disk image, and then I imported the VM into Parallels.\r"
categories: []
layout: post
title: Parallels 5 Versus VMware Fusion 3.1.1
created: 1283294382
---
I installed both Parallels 5 and VMware Fusion 3.1.1 on my Macbook.  Here are some observations:

In Fusion's favor:
* Fusion is more robust.  I've got an ISO of a TrueImage 11 boot CD.  Parallels just couldn't boot it.  Fusion could.  I tried lots of different OS settings and "Safe Mode" and Parallels kept reporting VM crashed.  No problems with Fusion.  Ultimately, I created a VM with Fusion, and restored the disk image, and then I imported the VM into Parallels.
* Parallels can't boot one of my Boot Camp drives.  I've got a Boot Camp which boots Windows from a fully-encrypted system partition.  Parallels can't boot it.  Fusion can, with no problem.
* Parallels messed up one of my Boot Camp drives.  I've got (another) Boot Camp partition with a "plain vanilla" XP on it.  At some point, I got a kernel panic in OS X, and my Boot Camp partition was left without a partition table.
* It appears that Parallels doesn't really give a raw disk to a VM.  When you tell it to use a raw disk, it can't deal with it unless it is a format which OS X understands.  e.g. I can tell it to use a raw FAT or a raw NTFS volume, and it mounts it in OS X and then makes the mounted volume available to the VM as a disk, but if I give it a raw disk which my VM *can* understand but OS X can't, the volume is not mounted in OS X and it is not available to the VM.

In Parallel's favor:
* It runs my plain vanilla Windows XP VM faster than Fusion.
