---
categories: []
layout: post
title: Static DHCP on Merlin ASUS Routers
created: 1420929136
redirect_from: /content/static-dhcp-merlin-asus-routers
---
The following is mostly supposition.  (I'll remove this remark after I finish testing.)

When I set up static DHCP on my Asus router, it doesn't sort the entries by IP address.  I'd like that to happen.  Here are some related notes.

* DHCP is controlled by /tmp/etc/ethers.  It has MAC and IP addresses in it.
* DNS is controlled by /tmp/etc/hosts.dnsmasq.  It has IP address and DNS name entries.
* I _think_ that both of them are derived at boot time from the nvram variable dhcp_staticlist.
* "nvram get dhcp_staticlist > temp-file" will show (in a non-standard format) all of the info needed to create ethers and hosts.dnsmasq files.
* 'nvram set dhcp_staticlist “long-string-from-temp-file”'
    * You can use backslash as a line continuation character, to permit newlines in long-string-from-temp-file.

Other notes:

* "nvram show" lists all nvram.
* must use a “nvram commit” after any nvram set (and, eventually, reboot in order to load them).
* see http://forums.smallnetbuilder.com/archive/index.php?t-12876.html
* see https://github.com/RMerl/asuswrt-merlin/wiki/Custom-config-files

-----

See also: [Merlin's DHCP terminology for static, dynamic, and manual](/content/asus-asuswrt-dhcp-terms)
