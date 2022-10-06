---
excerpt: "This device is not yet &quot;spouse ready.&quot;&nbsp; My tech-savvy kid
  will use it, but my wife will find it too frustrating.&nbsp; It is cooler than Tivo,
  but Tivo has a better user experience.\r\n  \r\n  \r\n  \r\n  \r\n  \r\n  <br />\r\n
  \ <ul>\r\n    <li>The first thing to do is to run the firmware refresh until it
  says there are no more updates.</li>\r\n    <li>The &quot;xim button&quot; is the
  button with a pseudo-asterisk on it.\r\n      \r\n      \r\n      \r\n      \r\n
  \     \r\n      "
categories: []
layout: post
title: Notes on Using the Neuros OSD
created: 1222711933
---
This device is not yet &quot;spouse ready.&quot;&nbsp; My tech-savvy kid will use it, but my wife will find it too frustrating.&nbsp; It is cooler than Tivo, but Tivo has a better user experience.
  
  
  
  
  
  <br />
  <ul>
    <li>The first thing to do is to run the firmware refresh until it says there are no more updates.</li>
    <li>The &quot;xim button&quot; is the button with a pseudo-asterisk on it.
      
      
      
      
      
      <br /></li>
    <li>Adding Shortcuts:&nbsp; You have to navigate to the directory to which you want to create a shortcut (the destination for the shortcut) and then press the xim button.</li>
    <li>My Neuros won't recognize my USB drive!</li>
    <ul>
      <li>Make sure it is formatted as FAT32.&nbsp; (You may be able to get ext2 to work, and even NTFS to work, but start with FAT32 because this is the most solid.)</li>
      <li>Never, never, never remove your USB drive without un-mounting it first.&nbsp; The Neuros is almost totally incapable of recovering from this -- even after restarting the Neuros and the drive.</li>
      <li>Un-mount your&nbsp; USB drive by navigating to &quot;Play|Browse&quot;, pressing xim, and selecting Eject.
        
        
        
        
        
        <br /></li>
      <li>If you yanked your USB drive without ejecting it, take a USB drive (could be a USB flash drive) that the Neuros has never seen before (or one you are POSITIVE has been correctly ejected), and insert it into the Neuros USB port.&nbsp; After the new drive has been mounted, properly dismount it, and then your original USB drive should be usable again.
        
        
        
        
        
        <br /></li>
    </ul>
    <li>If you want to put software on the Neuros, and your USB drive won't work, put it on an SD memory card (using your PC) and use sneakernet to transfer the file to your Neuros;&nbsp; or use the ftpget command on your Neuros.
      
      
      
      
      <br /></li>
    <li>Definitely helpful links at <a href="#%20http://wiki.neurostechnology.com/index.php/Neuros_OSD%20">http://wiki.neurostechnology.com/index.php/Neuros_OSD</a></li>
    <li>Somewhat helpful links at <a href="http://forums.neurostechnology.com/index.php?topic=8386.0">http://forums.neurostechnology.com/index.php?topic=8386.0</a></li>
    <li>Good networking help at <a href="http://wiki.neurostechnology.com/index.php/OSD_Mount_network_shares">http://wiki.neurostechnology.com/index.php/OSD_Mount_network_shares</a> (except something is wrong with the network.ini specification)
      
      <br /></li>
    <li>???? Delete the &quot;shortcuts&quot; or the &quot;network&quot; menu item and go directly to the ONE network place I always store video:&nbsp; How?</li>
    <li>If you run mount.cifs, it will issue an &quot;could not update mount table&quot; error message.&nbsp; Ignore it.&nbsp; It is just complaining because the mount table is on a read-only file system.
      
      
      
      
      
      <br /></li>
    <li>To dismount, use &quot;umount &lt;mountpoint&gt;&quot; and not &quot;umount.cifs&quot;
      
      
      
      
      
      <br /></li>
    <li>The root password (for telnet) is &quot;pablod&quot;</li>
    <li>The Neuros automatically tries to connect to a network share as &quot;guest&quot; without a password.&nbsp; Life is easier if your network share is accessible this way too.&nbsp;</li>
    <li>Install Lpkg - <a href="http://matthewwild.co.uk/projects/lpkg/osd">http://matthewwild.co.uk/projects/lpkg/osd</a>&nbsp; (so you can install packages)
      
      
      
      
      <br /></li>
    <li>Install Wooble, so you can manager your OSD via http - <a href="http://matthewwild.co.uk/projects/wooble/installing">http://matthewwild.co.uk/projects/wooble/installing</a>
      <br /></li>
    <li>Install samba server from <a href="http://matthewwild.co.uk/projects/lpkg/packages">http://matthewwild.co.uk/projects/lpkg/packages</a>
      <br /></li>
    <li>Here's info on the startup process and custom startup scripts: <a href="http://forums.neurostechnology.com/index.php?topic=7918.msg41973#msg41973">http://forums.neurostechnology.com/index.php?topic=7918.msg41973#msg41973</a></li>
    <ul>
      <li>The short answer is <span style="color: #ff0000;">/mnt/OSD/rc.user</span>
        <br /></li>
    </ul>
    <li>MAYBE upgrade dropbear at <a href="http://forums.neurostechnology.com/index.php?topic=9251.0">http://forums.neurostechnology.com/index.php?topic=9251.0</a></li>
    <li>Arizona firmware does support ext3 (<a href="http://forums.neurostechnology.com/index.php?topic=9304.0">http://forums.neurostechnology.com/index.php?topic=9304.0</a>)&nbsp;</li>
    <li>PC (Windows) program to convert videos for use on the Neuros <a href="http://open.neurostechnology.com/content/winff-neuros">http://open.neurostechnology.com/content/winff-neuros</a>
      <br /></li>
    <li>
      <br /></li>
  </ul>
