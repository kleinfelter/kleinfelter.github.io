---
excerpt: I did a vmware-mount on a vmdk file that is on a USB drive. Then I discovered
  that when I wrote bytes to the virtual drive and read them back, I didn&#39;t get
  the same bytes back. Very bad.<br /><br />More specifically, I have a large collection
  of files that are on both a real file system and duplicated on the virtual drive.
  When I run windiff, comparing the two, it reports a few as not matching. Using Windows
  Explorer, I copied files from the real drive to the virtual drive. I ran windiff
  again. They don&#39;t match.<br />
categories: []
layout: post
title: Don't vmware-mount a Vmdk File That Is On a USB Drive
created: 1179189914
---
I did a vmware-mount on a vmdk file that is on a USB drive. Then I discovered that when I wrote bytes to the virtual drive and read them back, I didn&#39;t get the same bytes back. Very bad.<br /><br />More specifically, I have a large collection of files that are on both a real file system and duplicated on the virtual drive. When I run windiff, comparing the two, it reports a few as not matching. Using Windows Explorer, I copied files from the real drive to the virtual drive. I ran windiff again. They don&#39;t match.<br /><br />Then I unmounted the vmdk, and copied it to my IDE drive. I mounted it there. I ran windiff and got the mismatched files. Then I copied files from the real drive on top of the bad files, and ran windiff again. They match.<br /><br />I unmounted the vmdk, and copied it back to my USB drive and mounted it. Windiff reports files not equal.<br /><br />Then I unmounted the vmdk, and copied the vmdk again from the USB to the IDE. I ran windiff on the vmdk files and they are the same. I mounted both vmdks (using different drive letters), and ran windiff agains the two virtual drives and the files did NOT match.<br /><br />I conclude that I/O to a virtual drive stored on an external USB (2.5&quot;) drive is prone to failing silently.<br /><br />Version is:<br />VMware DiskMount Utility version 5.5.0 build-18463<br /><br />I don&#39;t have support, and I think vmware-mount is unsupported software, so I don&#39;t know how to tell VMWare about it
