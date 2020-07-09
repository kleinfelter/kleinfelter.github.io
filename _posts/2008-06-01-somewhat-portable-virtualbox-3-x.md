---
excerpt: "<p>I'd like to have a zero-install, Windows,&nbsp;virtual machine environment.&nbsp;
  In theory, this would let me run my OS and desktop environment on any Windows computer,
  without installing the VM software.</p>"
categories: []
layout: post
title: Somewhat Portable VirtualBox 3.x
created: 1212359130
---
<p>I'd like to have a zero-install, Windows,&nbsp;virtual machine environment.&nbsp; In theory, this would let me run my OS and desktop environment on any Windows computer, without installing the VM software.</p>
  <p>There is a fundamental reason why this can't happen 100%.&nbsp; The VM has to be able to handle the situation when the virtual computer attempts to execute ring-0 (privileged mode) instructions.&nbsp; You have to install a device driver or a Windows service in order to be able to handle the interrupt/trap.&nbsp; There is also the issue of getting your network to work.&nbsp; Many VMs handle this by creating a TUN/TAP virtual adapter in the host.</p>
  <p>You can get close to zero-install with VirtualBox.&nbsp; For starters, you don't have to create the TAP virtual adapter in the host.&nbsp; For a VirtualBox NAT adapter, VirtualBox does not provide the full TCP/IP stack to the VM.&nbsp; Essentially, it provides a TCP (only) proxy.&nbsp; While this breaks things like 'ping', it means you don't need a virtual host adapter in order to do networking from the guest.</p>
  <p>Here's a Windows batch file to run a non-installed VirtualBox.&nbsp; It assumes you have copied the contents of the C:\Program Files\Sun\VirtualBox (or C:\Program Files\Sun\xVM with some versions of VBox) directory to t:\pvb. It also assumes that you have a utility program called 'sleep' that can sleep for the given number of seconds.&nbsp; (If you don't have one of those, replace the 'sleep' lines with 'pause' and you can do manual sleeping.)
    
    <br /></p>
  <p><strong>UPDATED for VirtualBox 3.0.12</strong>
    <br /></p>
  <p><strong>UPDATE: Still works with 3.1.4</strong>
    <br /></p>
  <p><strong>UPDATE: Still works with 3.2.0</strong>
    <br /></p>
  <pre>SET pvbroot=S:\pvb
SET datadir=S:\pvb\pvb-data
S:

cd %pvbroot%
mkdir %datadir% 2&gt;nul:

SET VBOX_USER_HOME=%datadir%\.VirtualBox


REM This service *has* to be loaded.  It manages the client's attempts to go to ring 0 (supervisor mode).
sc create pvboxdrv binpath= %pvbroot%\drivers\vboxdrv\vboxdrv.sys type= kernel start= demand error= normal displayname= pvboxdrv

sleep 5
REM The VirtualBox COM service, i.e. all COM objects that live outside the VM process. 
%pvbroot%\VBoxSVC.exe /reregserver

sleep 5
REM Client-side COM library. All COM (or XPCOM) objects that live on the client side
REM (i.e. inside the VM execution process) are contained in this file. So IConsole and friends go there. 
regsvr32.exe /S %pvbroot%\VBoxC.dll

sleep 5
REM Load the "VirtualBox Portable Runtime (IPRT)"
rundll32 %pvbroot%\VBoxRT.dll,RTR3Init

REM Start the ring-0 driver
sc start pvboxdrv

Sleep 3
REM Start the GUI
%pvbroot%\VirtualBox.exe


REM Count off seconds before you let it continue.  If you don't, you'll find that you have to reboot before you can run again.
sleep 5

REM Stop the ring-0 service
sc stop pvboxdrv
sleep 5

REM Make sure it is really stopped
sc query pvboxdrv
pause

REM Remove the VirtualBox COM service, i.e. all COM objects that live outside the VM process.
%pvbroot%\VBoxSVC.exe /unregserver


REM Remove Client-side COM library. All COM (or XPCOM) objects that live on the client side 
REM (i.e. inside the VM execution process) are contained in this file. So IConsole and friends go there. 
regsvr32.exe /S /U %pvbroot%\VBoxC.dll

sleep 3
sc delete pvboxdrv

echo
echo All done
sleep 9
</pre>
A troubleshooting tip -- For a little while, I was having trouble with the service going into a stop_pending state from which it never exited.  This caused the &quot;sc delete&quot; to fail because you can't delete a running service.  I think this was caused by a previous install of VirtualBox that left some bits behind.  I deleted the various vbox* files from C:\Windows\System32 (and similar folders), and I scrubbed all vbox and virtualbox entries from the registry, rebooted, and it started working.
