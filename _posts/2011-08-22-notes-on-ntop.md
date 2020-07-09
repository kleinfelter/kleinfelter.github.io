---
excerpt: "If things aren't going well with your (Ubuntu Natty 11.04) ntop, here are
  some things to try:\r\n<ul>\r\n<li>Configure ntop to NOT run as a daemon. Stop the
  ntop service (\"service ntop stop\").  Run ntop in debug mode from the command line
  (\"ntop -K\").\r"
categories: []
layout: post
title: Notes on ntop
created: 1314026976
---
If things aren't going well with your (Ubuntu Natty 11.04) ntop, here are some things to try:
<ul>
<li>Configure ntop to NOT run as a daemon. Stop the ntop service ("service ntop stop").  Run ntop in debug mode from the command line ("ntop -K").
<li>If your ntop log contains "NETFLOW: no devices to initialize", you might be having an RRD problem.  Check your log for "RRD: Disabled - unable to create base directory (err 13, /var/lib/ntop/rrd)".  Sometimes when you install ntop, the permissions/owner on /var/lib/ntop/rrd don't get set right.  Kill ntop, "rm -rf /var/lib/ntop/rrd" and start it again.
<li>If your "NetFlow Device Configuration" shows an empty list of Available Netflow Devices, check to see if you're having an RRD problem.  Fixing RRD fixed this issue for me.
</ul>
