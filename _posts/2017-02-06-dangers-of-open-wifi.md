---
categories: []
layout: post
title: Dangers of Open WiFi
created: 1486414262
redirect_from: /content/dangers-open-wifi
---
* *Topics: HTTP login pages, Open WiFi (non-WPA/WPA2), cell apps using HTTP, DNS attacks*

## Open WiFi Is Scary
<img src="/files/free-wifi-danger.jpg" height="191" width="300" style="float: right; margin: 0 0 10px 10px;">

If you go to Starbucks (or McDonalds or Chick-fil-A or...) and you connect to WiFi without entering a password, your WiFi traffic is broadcast to all WiFi clients within range.  Using commonly available tools, anyone can capture web pages you visit, etc.  HTTPS protects some of your traffic, but some sites use HTTPS solely for authentication, and many apps send unencrypted data.  For sites which use HTTPS solely for authentication, it is possible for a hacker to capture your cookies and masquerade as you.

If the access point uses WPA and requires a password to access WiFi then your WiFi traffic is encrypted, but what if the WiFi access point itself is malicious, and it captures your traffic?

And those cheap (or free) cell phone apps... Their developers probably didn't spring for an HTTPS certificate, so they're probably sending data in the clear.  "So what?" you ask.  I don't care if somebody captures my fitness tracker data.  Fair enough.  But did you use the same ID/password on your tracker and on Facebook?  Oops!  You just shared your password with anyone in the cafe who cares to listen.

* Multiple studies have found cell apps that fail to implement SSL/TLS correctly.

And what if the WiFi router is serving up bogus DNS data?  If you browse to www.myBank.com, you expect to be sent to the server for myBank.com.  If DNS on the router has been tampered with by a hacker, you could be sent to a site which *looks* like your bank, but is actually capturing ID/password data.  (This is trivially easy to do.)  A compromised router is also a risk if you are using *wired* Ethernet at a hotel.

## Bottom Line

If you want to be sure that the sleazeball in the next booth/room can't see your data, **you need to be using a VPN** to ensure that every byte is encrypted and you want to be using the same DNS servers you use when you surf from home.

-----
[Return to Surf Safe at Starbucks](/content/surf-safe-starbucks#dangers_of_open_wifi)
