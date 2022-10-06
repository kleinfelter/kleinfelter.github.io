---
excerpt: "Update: InfraRecorder V0.44 looks like it can handle 125,000 files with
  no problem.&nbsp; http://infrarecorder.sourceforge.net/\r\n  <br />Update: CDBurnerXP
  V4.0.022 also looks like it can handle 125,000 files with no problem. http://www.cdburnerxp.se/download\r\n
  \ <br />\r\n  <br />Given that InfraRecorder has a 'portable' mode and CDBurnerXP
  installs a service, I'm going to take a closer look at InfraRecorder.\r\n  <br /><hr
  />\r\n  "
categories: []
layout: post
title: Burning a Mega-DVD
created: 1178223181
---
Update: InfraRecorder V0.44 looks like it can handle 125,000 files with no problem.&nbsp; http://infrarecorder.sourceforge.net/
  <br />Update: CDBurnerXP V4.0.022 also looks like it can handle 125,000 files with no problem. http://www.cdburnerxp.se/download
  <br />
  <br />Given that InfraRecorder has a 'portable' mode and CDBurnerXP installs a service, I'm going to take a closer look at InfraRecorder.
  <br /><hr />
  <br />Nero 6.6.1.4 croaks when I drop 120,000 files and 14,000 folders on it. After churning for several minutes, it complains about inadequate system resources. This on a PC with Windows XP Pro SP2, 1 GB RAM, 2GB swap space, and a dozen gig of free disk space.
  
  
  <br />
  <br />I rolled back to 6.6.0.16. No problems with 120,000 files and 14,000 folders.
  
  
  <br />
  <br />My guess is that a programmer decided to load more info about the files to a list box or a tree control. I'll bet he tested it with several hundred files. Oops.
  
  
  <br />
  <br />I discovered along the way that Nero can be run semi-portably. If you copy the folder where you installed it onto a flash drive, and you un-install Nero from your hard drive, you can run Nero from your flash drive. It will give some error messages about not being able to find some components, but it will actually burn and verify your disk. It does prompt you for your serial number each time you start it. This is obviously not the preferred way to use Nero, but if your employer forbids you to install software onto your company-owned PC, you *can* run Nero without installing it.
  
  
  <br />
  <br />I tried several free or trial burning packages. None of them were able to handle 120,000/14,000. Bummer. I settled on using Cygwin mkisofs to build an ISO, 
  
  
  <br />
  <br />
  <pre>mkisofs -graft-points -U -disable-deep-relocation -R -no-cache-inodes -iso-level 4 -V MY_VOL_ID -log-file c:\\temp\\iso.log -exclude-list c:\\temp\\exclude.txt -path-list C:\\temp\\drive-k.root -o D:\\k-iso.iso</pre>
  <br />
  <br />
  <br />and I burn and verify the ISO with Nero. Here are some free burning packages that seem to work about as well as Nero 6.6.1.4.
  
  
  <br />
  <br />
  <ul>
    <li>CDBurnerXP Pro 3: Install, copy, and un-install to run it portably. Does a fine job of burning ISOs to media and verifying them.</li>
    <li>burncdcc.zip: Unzip and run. Looks like it will burn ISOs to media and verify. ONLY burns ISOs to media. I didn't actually test burning.</li>
    <li>cdrtools-2.01-mingw-w32.zip: Command-line tool for burning ISO to media only.</li>
    <li>DeepBurner1_Portable.zip: Fully portable. Draggy-droppy. Works as well as Nero 6.6.1.4.</li>
  </ul>
