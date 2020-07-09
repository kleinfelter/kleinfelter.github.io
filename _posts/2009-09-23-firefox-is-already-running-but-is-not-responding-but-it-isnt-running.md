---
excerpt: "<p>I started getting the &quot;<strong>Firefox is already running but is
  not responding,</strong>&quot; message when starting Firefox.&nbsp; Firefox was
  not already running when I attempted to start it.&nbsp; Windows Task Manager confirmed
  it.&nbsp; No, Firefox had not crashed the last time I used it.</p>"
categories: []
layout: post
title: Firefox is already running but is not responding  (but it isn't running).
created: 1253732269
---
<p>I started getting the &quot;<strong>Firefox is already running but is not responding,</strong>&quot; message when starting Firefox.&nbsp; Firefox was not already running when I attempted to start it.&nbsp; Windows Task Manager confirmed it.&nbsp; No, Firefox had not crashed the last time I used it.</p>
  <p>But... My profile is on a drive that wasn't mounted.&nbsp; From the Mozilla web site, &quot;If Firefox cannot find the profile folder, it will report that the profile is in use or already running. This can happen if you manually delete, rename or move the profile folder; if you run Firefox from removable media...&quot;</p>
  <p>What made it doubly confusing in my case is that *I* wasn't starting Firefox when it gave the message.&nbsp; I installed Tonido, and the Tonido launcher (it runs in the tray) had the option &quot;Open browser on launch&quot; selected.</p>
  <p>Clearing the option, and mounting the drive (which I always do&nbsp;after I boot the machine) cured the problem.</p>
