---
categories: []
layout: post
title: ASUS (ASUSWRT) DHCP Terms
created: 1482532254
redirect_from: /content/asus-asuswrt-dhcp-terms
---
I'm using the "Merlin" edition of AsusWRT software on my Asus router.  When I look in the Network Map, Clients, View List, in the Clients IP List column, I see

* Static (flyover = Static IP) - meaning IP was set on the device itself
* Manual (flyover = MAC-IP Binding) - meaning specified on the LAN tab, DHCP Server sub-tab
* DHCP (flyover = Automatic IP) - meaning allocated by the router from the pool of "IP Pool Starting Address" through IP Pool Ending Address

It turns out that the router will also report "Static" for a device which is using anything other than the address which the router would like it to use.  For example, if you change the IP address specified on the DHCP page, but the device hasn't started using the new IP address yet, it will get reported as "Static".

So "Manual" means the device got the IP from the router, but the IP was specified by me, and "Static" means "the device is using an IP that *it* chose".
