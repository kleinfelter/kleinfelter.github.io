---
excerpt: "<p>Portions from: <a href=\"http://blog.andrewbeacock.com/2009/03/how-to-move-existing-cygwin.html\">http://blog.andrewbeacock.com/2009/03/how-to-move-existing-cygwin.html</a>&nbsp;</p>\r\n
  \ <p>... also relevant for backing up Cygwin.</p>\r\n  <p><strong>Here are the steps
  to move your Cygwin installation: </strong>\r\n    <br /></p>"
categories: []
layout: post
title: Moving Cygwin
created: 1253920115
---
<p>Portions from: <a href="http://blog.andrewbeacock.com/2009/03/how-to-move-existing-cygwin.html">http://blog.andrewbeacock.com/2009/03/how-to-move-existing-cygwin.html</a>&nbsp;</p>
  <p>... also relevant for backing up Cygwin.</p>
  <p><strong>Here are the steps to move your Cygwin installation: </strong>
    <br /></p>
  <ol>
    <li>Save off existing mount points 
      <br /><code>mount -m &gt; /usr/bin/mountCommands.bat</code></li>
    <li>Unmount existing mount points 
      <br /><code>umount -A</code></li>
    <li>Copy Cygwin directory to new home -- or mv it.&nbsp; Use Cygwin commands, not Windows Explorer commands or you'll get broken symlinks and distorted permissions in some circumstances.&nbsp;&nbsp; 
      <ol>
        <li>mount -s -b --change-cygdrive-prefix &quot;/cygdrive&quot; </li>
        <li>tar -cvf /cygdrive/c/cygwin.tar bin cygwin dev etc lib sbin srv tmp usr var cygwin.bat cygwin.ico </li>
        <li>cd $destination </li>
        <li>mkdir cygdrive </li>
        <li>tar -xvpf /cygdrive/c/cygwin.tar </li>
      </ol>
    </li>
    <li>In theory, you could do the previous steps with something like: cd /; tar -cf - * | (cd &quot;$tgt&quot;; tar -xfp - ) </li>
    <li>Update any Windows shortcuts &amp; Start Menu items </li>
    <li>Update the Cgywin path within <code>$CYGWIN_HOME/cygwin.bat</code></li>
    <li>Update mount points within <code>$CYGWIN_HOME/bin/mountCommands.bat</code></li>
    <li>Re-mount to new location 
      <ul>
        <li>Start Cygwin </li>
        <li><code>./mountCommands.bat</code></li>
        <li>Close Cygwin </li>
      </ul>
    </li>
  </ol>
  <p>Note: If you move cygwin to a flash drive, and you intend to use the flash drive on multiple computers (or even in multiple instances of Windows on the same computer), you'll need to format the flash as FAT32.&nbsp; If you use NTFS, the file owner will be static by GUID, and it won't work except on one computer.</p>
  <p>&nbsp;</p>
  <p><strong>Moving your home directory:</strong></p>
  <ol>
    <li>Use Cygwin commands, not Windows Explorer commands or you'll get broken symlinks and distorted permissions in some circumstances. </li>
    <li>I use a symlink '/home' to point to the directory that contains user home directories, so that has to get updated </li>
    <li>You might need to update the Windows HOME environment variable, because cygwin uses it to set your cygwin home directory. </li>
    <li>I started getting double-wide display with rxvt.&nbsp; It was because my Windows HOME environment variable was set to newdrive\home instead of newdrive\home\kevin </li>
  </ol>
  <p>Note: You *do* want your home directory to be NTFS, so that .ssh can have the correct permissions.</p>
