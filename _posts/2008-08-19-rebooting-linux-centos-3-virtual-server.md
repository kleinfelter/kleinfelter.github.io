---
excerpt: "<p>I am using a virtual server from Rose Hosting.&nbsp; It runs Centos 3.&nbsp;
  When I try to reboot, it fails with a mesage:</p>\r\n  <ul>\r\n    <li>init: /dev/initctl:
  no such file or directory </li>\r\n  </ul>\r\n  <p>Running:</p>\r\n  <ul>\r\n    <li>mkfifo
  /dev/initctl </li>\r\n  </ul>\r\n  <p>seems to have corrected the problem.&nbsp;
  I'm not sure whether I eventually ran &quot;reboot -f&quot; or &quot;init 6&quot;
  to reboot.</p>"
categories: []
layout: post
title: Rebooting Linux (Centos 3) Virtual Server
created: 1219178746
---
<p>I am using a virtual server from Rose Hosting.&nbsp; It runs Centos 3.&nbsp; When I try to reboot, it fails with a mesage:</p>
  <ul>
    <li>init: /dev/initctl: no such file or directory </li>
  </ul>
  <p>Running:</p>
  <ul>
    <li>mkfifo /dev/initctl </li>
  </ul>
  <p>seems to have corrected the problem.&nbsp; I'm not sure whether I eventually ran &quot;reboot -f&quot; or &quot;init 6&quot; to reboot.</p>
  <p>UPDATE 9/4/2008: No, the mkfifo did not do it.&nbsp; Running &quot;reboot -f&quot; simply reboots without doing the shutdown sequence.&nbsp; Think of it as a front-panel reboot.&nbsp; It turns out that some VPS (virtual private servers) use a hacked edition of init, that doesn't actually read /dev/initctl.</p>
  <p>Running &quot;reboot&quot; or &quot;init 6&quot; still gets </p>
  <p>init: timeout opening/writing control channel /dev/initctl</p>
  <p>after running mkfifo.</p>
