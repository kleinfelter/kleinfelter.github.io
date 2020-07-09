---
excerpt: '<p>Adapted From: <a href="http://www.windowsnetworking.com/kbase/WindowsTips/WindowsXP/AdminTips/Network/UsingXPasarouter.html">http://www.windowsnetworking.com/kbase/WindowsTips/WindowsXP/AdminTips/Network/UsingXPasarouter.html</a>
  on September 12, 2008.&#160; (Saved here because web pages have a nasty habit of
  vanishing.)</p>  <p>Add a router to your network with Windows XP Professional:</p>  <p>Install
  an additional network card in the box and then configure the registry setting below
  it it is able to route IP packets from one interface to another.</p>  <p>Regedit:</p>'
categories: []
layout: post
title: Windows XP as a Router
created: 1221240557
---
<p>Adapted From: <a href="http://www.windowsnetworking.com/kbase/WindowsTips/WindowsXP/AdminTips/Network/UsingXPasarouter.html">http://www.windowsnetworking.com/kbase/WindowsTips/WindowsXP/AdminTips/Network/UsingXPasarouter.html</a> on September 12, 2008.&#160; (Saved here because web pages have a nasty habit of vanishing.)</p>  <p>Add a router to your network with Windows XP Professional:</p>  <p>Install an additional network card in the box and then configure the registry setting below it it is able to route IP packets from one interface to another.</p>  <p>Regedit:</p>  <p>HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters</p>  <p>set IPEnableRouter = 1</p>  <p><span class="156500419-30102006">Reboot to start routing. You may also need to disable Windows Firewall on the machine.</span></p>  <p><span class="156500419-30102006">Note: I don't think this will solve your VirtualBox access to the network.&#160; It is easy to tell the VBOX VM to send packets to the outside world via the router, but if your VM subnet is on its own network, someone is going to have to tell the real, outside router that it can send data to your subnet via your XP router.&#160; You can do this at home, but the corporate IT folks aren't going to do this for you.</span></p>  <p><span class="156500419-30102006"></span></p> <!-- <<< -->
