---
excerpt: "<p>I'm installing XUbuntu 7 as a 'hypervisor' on my desktop pc.</p>"
categories: []
layout: post
title: Ubuntu Notes
created: 1189045963
---
<p>I'm installing XUbuntu 7 as a 'hypervisor' on my desktop pc.</p>
  <ol>
    <li>Partitioned a 9 GB / partition and a 2 GB swap partition </li>
    <li>Booted the livecd and told it to install </li>
    <li>Reboot when install done </li>
    <li>Settings/Login Window/Remote 
      <ol>
        <li>Style=Same as Local </li>
        <li>Configure XDMCP: </li>
      </ol>
      <ul>
        <ul>
          <li>Turn OFF &quot;Honor indirect requests&quot; 
            <br /></li>
        </ul>
      </ul>
    </li>
    <li>sudo apt-get install xinetd </li>
    <li>sudo apt-get install x11vnc 
      <ol>
        <li>This is because the built-in System/Preferences/Remote Desktop does not support clipboard transfer. </li>
        <li>I *could* use TightVNC server, but it doesn't seem to be possible to make it share display 0 with the real console. </li>
        <li>In addition to clipboard transfer, I think x11vnc supports some of the TightVNC enchantments to base VNC, so it works well with a TightVNC client. </li>
      </ol>
    </li>
    <li>sudo vi /etc/gdm/Init/Default 
      <ul>
        <li>&nbsp;Add to the end, just before the &quot;exit 0&quot;: &quot;/usr/bin/x11vnc -display WAIT:0 -rfbauth /home/kevin/.vnc/passwd -o /var/log/x11vnc.log -forever -bg -shared -loop -noxdamage &amp;&quot;</li>
        <li>Note:&nbsp;Until I added -noxdamage, I had the symptom that when the VNC client connected,&nbsp;it would&nbsp;display the current content of the desktop (good), but zero update/refresh/repaint happened (bad). Keyboard and mouse input was getting passed to the server, but no screen updates from the server were getting displayed.&nbsp; XDamage is an extension to XWindows that attempts to detect &quot;damaged&quot; windows (i.e. they need to be repainted).</li>
        <li>Note: I tried NoMachine's NX with its &quot;shadow&quot; of the console, and it had the same problem.&nbsp; I was unable to tell NX not to use XDamage, so I uninstalled it.</li>
      </ul>
    </li>
    <li>sudo vi /etc/gdm/gdm.conf-custom (didn't record the changes) </li>
  </ol>
  <p>Download vmware player tar format</p>
  <ol>
    <li>gunzip *.tar.gz </li>
    <li>tar -xvf *.tar </li>
    <li>cd vmware* </li>
    <li>sudo ./vmware-install.pl </li>
    <li>take the default on all prompts </li>
  </ol>
