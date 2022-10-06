---
excerpt: "<p>The VMWare Player BIOS prompt is way too short to allow you to hit Control-G
  to send input to the VM, and F8 before Windows starts (or to send F2 before the
  OS boots).</p>\r\n  <p>With the latest edition of VMWare Fusion, there is a .VMX
  setting that will force the BIOS to start (bios.forceSetupOnce = &quot;TRUE&quot;).&nbsp;
  This will probably show up in the PC/Linux edition eventually, but here's a work-around
  that I've found.</p>\r\n  <p>First, edit your VMX and tell it that your boot drive
  is NOT present (something like scsi0:0.present = &quot;FALSE&quot;).</p>"
categories: []
layout: post
title: VMware Player BIOS Too Fast
created: 1221144251
---
<p>The VMWare Player BIOS prompt is way too short to allow you to hit Control-G to send input to the VM, and F8 before Windows starts (or to send F2 before the OS boots).</p>
  <p>With the latest edition of VMWare Fusion, there is a .VMX setting that will force the BIOS to start (bios.forceSetupOnce = &quot;TRUE&quot;).&nbsp; This will probably show up in the PC/Linux edition eventually, but here's a work-around that I've found.</p>
  <p>First, edit your VMX and tell it that your boot drive is NOT present (something like scsi0:0.present = &quot;FALSE&quot;).</p>
  <p>Then boot your VM.&nbsp; It will fail, and tell you to press Control-alt-delete.</p>
  <p>Put your keyboard focus in the VM, and press Control-alt-del, and then start banging on F2.</p>
  <p>Once it boots and goes to the BIOS, tell it that it should first attempt to boot from the NIC.&nbsp; This will give you time for Control-G, followed by visually confirming that focus has been set to the VM, followed by F8, before Windows starts.</p>
  <p>Finally, edit your VMX and tell it your boot drive is again present.</p>
  <p>&nbsp;</p>
