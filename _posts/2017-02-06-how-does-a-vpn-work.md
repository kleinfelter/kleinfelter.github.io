---
categories: []
layout: post
title: How Does a VPN Work?
created: 1486413368
redirect_from: /content/how-does-vpn-work
---
* *Topics: Point-to-point tunnel from laptop to VPN server, Redirect your DNS through VPN*

The short form is that a VPN securely transports your data from one point to another.  It's not about end-to-end.  It's about point-to-point.

When your laptop wants to talk with a host computer via the Internet (using something called "IP protocol"), it sends a data frame via WiFi or a wired connection.  The frame travels from router to router via a mostly direct route until it arrives at the computer you're trying to talk with.  Unless it is encrypted, if you send "myUserID" and "myPassword", every router along the way can see "myUserID"  and "myPassword" in the frame.  This is not good if you're in a coffee shop where someone has tampered with the router.

If you set up a VPN (Virtual Private Network) server on your home network, and you use this VPN when you're on the WiFi at the coffee shop:

* Your laptop encrypts the frame.
* Your laptop sends the encrypted frame across the Internet to your VPN server.  The frame is encrypted, so even if the WiFi is nefarious, it can't see your data or tamper with it.
* The encrypted frame is decrypted by your VPN server.
* The VPN server sends the original frame across the Internet to your original host, as if you were surfing from home.

One big risk of using a WiFi at Bob's Coffee and Hacking Emporium is that Bob might tamper with DNS, so that when you think you're browsing to http://myBigBank.com you might wind up at http://myBigHacker.ru.  With a VPN, you can have your DNS traffic passed through the same encrypted tunnel, to use the same DNS server you use when you're at home.  (This is probably the DNS provided by your ISP.)

-----
[Return to Safe Surfing at Starbucks](/content/surf-safe-starbucks#solution_vpn)
