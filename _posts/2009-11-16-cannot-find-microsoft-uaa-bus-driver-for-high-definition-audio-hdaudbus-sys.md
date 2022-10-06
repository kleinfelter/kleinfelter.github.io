---
excerpt: "<p>Awhile back, Windows XP started doing the hardware auto-detect thing
  for no reason I could discern, and it reported it couldn't find &quot;Microsoft
  UAA Bus Driver for High Definition Audio&quot;.</p>\r\n  <p>So I Googled around
  and found pointers to <a href=\"http://support.microsoft.com/kb/888111\">http://support.microsoft.com/kb/888111</a>,
  but that turns out to be a really old hot-fix and it wouldn't install on my XP-SP3
  because&nbsp;the patch&nbsp;was created before SP3.</p>"
categories: []
layout: post
title: Cannot Find Microsoft UAA Bus Driver for High Definition Audio (hdaudbus.sys)
created: 1258424795
---
<p>Awhile back, Windows XP started doing the hardware auto-detect thing for no reason I could discern, and it reported it couldn't find &quot;Microsoft UAA Bus Driver for High Definition Audio&quot;.</p>
  <p>So I Googled around and found pointers to <a href="http://support.microsoft.com/kb/888111">http://support.microsoft.com/kb/888111</a>, but that turns out to be a really old hot-fix and it wouldn't install on my XP-SP3 because&nbsp;the patch&nbsp;was created before SP3.</p>
  <p>However, there was an easier solution.&nbsp; I searched C:\Windows for file names containing &quot;hdaud&quot; and found it in both C:\WINDOWS\ServicePackFiles\i386 and C:\WINDOWS\system32\drivers, so I just filled-in C:\WINDOWS\system32\drivers in the where-do-I-look-now field, and Windows accepted it.</p>
