---
excerpt: "<p>When running VirtualBox with a Windows XP client, I ran into a problem
  where it worked fine before I installed the Virtual Box Client Drivers, and then,
  <em>any</em> mouse movement resulted in the mouse pointer moving slowly down and
  to the right.&nbsp; It turns out this is a known&nbsp;VirtualBox conflict with the
  SMS mouse driver. (SMS allows the Windows domain managers to manage your PC, including
  remote control.)</p>\r\n  <p>So I uninstalled SMS.&nbsp; Problem NOT cured.</p>\r\n
  \ <p>So I checked Device Manager.&nbsp; SMS Mouse Driver does not appear.</p>"
categories: []
layout: post
title: VirtualBox Mouse Weirdness
created: 1212358090
---
<p>When running VirtualBox with a Windows XP client, I ran into a problem where it worked fine before I installed the Virtual Box Client Drivers, and then, <em>any</em> mouse movement resulted in the mouse pointer moving slowly down and to the right.&nbsp; It turns out this is a known&nbsp;VirtualBox conflict with the SMS mouse driver. (SMS allows the Windows domain managers to manage your PC, including remote control.)</p>
  <p>So I uninstalled SMS.&nbsp; Problem NOT cured.</p>
  <p>So I checked Device Manager.&nbsp; SMS Mouse Driver does not appear.</p>
  <p>It turns out that there is a Microsoft known problem, where uninstalling SMS does not uninstall the SMS Mouse and SMS Keyboard drivers.&nbsp; But why weren't they listed in Device Manager?</p>
  <p>Because SMS had been uninstalled the 'devices' no longer existed, and Device Manager doesn't show non-existent devices.&nbsp; The solution?&nbsp; See <a href="/devmgmt-reveal">Device Manager and Invisible Devices</a> elsewhere on this blog.&nbsp;&nbsp; <em>Then</em> delete the SMS Mouse Driver and reboot.</p>
