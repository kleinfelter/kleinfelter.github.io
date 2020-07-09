---
excerpt: "I created an encrypted, sparse disk image.  I mounted it on a folder.  Spotlight
  wasn't finding files in that folder.  In particular, they weren't showing up in
  the \"All my files\" predefined search.\r\n<p>\r\nSolution:\r\n<pre>\r\nsudo mdutil
  -i on /path/to/mountpoint\r\n</pre>\r\n... Took me forever to find this.  Sadly,
  it adds the volume to Spotlight, but not to the \"All my files\" predefined search.\r\n<p>\r"
categories: []
layout: post
title: Add a Volume to Spotlight
created: 1312680113
---
I created an encrypted, sparse disk image.  I mounted it on a folder.  Spotlight wasn't finding files in that folder.  In particular, they weren't showing up in the "All my files" predefined search.
<p>
Solution:
<pre>
sudo mdutil -i on /path/to/mountpoint
</pre>
... Took me forever to find this.  Sadly, it adds the volume to Spotlight, but not to the "All my files" predefined search.
<p>
BTW - Spotlight does the right thing with data from the encrypted disk -- it stores it on the encrypted disk.  i.e. you get a .Spotlight-V100 created in your root folder for your boot volume, and you get a separate .Spotlight-V100 created in the root of your encrypted volume.  The encrypted volume's metadata is kept solely in the encrypted .Spotlight-V100
