---
categories: []
layout: post
title: Build a UDP VPN Config File from TCP Config
created: 1488669240
redirect_from: /content/build-udp-vpn-config-file-tcp-config
---
I'd like to have a UDP instance too.  As I've mentioned, in theory, running a VPN over UDP should work better than running it over TCP.  When you have TCP layered over TCP, if you run into network latency, you can have both layers retransmitting, and the upper layer can exacerbate the latency of the lower layer with the extra traffic.

Note: On my Pi, UDP performs MUCH worse than TCP.  I haven't figured out why.

    cd /etc/openvpn
    sudo cp server1.conf server2.conf

Edit server2.conf and:

* Change: "daemon openvpn-tcp" to "daemon openvpn-udp"
* Change: "proto tcp-server" to "proto udp" (NOT udp-server)
* Change: "port 443" to "port 1194"
* Change: "server 10.16.0.0 255.255.255.0" to "server 10.8.0.0 255.255.255.0"
* Change: "log /var/log/openvpn.log" to "log /var/log/openvpn2.log"

While you're at it, edit server1.conf and change the log from openvpn.log to openvpn1.log.

Run this:

    sudo systemctl start openvpn@server1.service
    sudo systemctl start openvpn@server2.service
    sudo rm /var/log/openvpn.log

Update the firewall/forwarding rules on your telco-router to pass UDP on port 1194 to your Pi.

Locally, make a copy of user-key1.ovpn as user-key1-udp.ovpn.
* Change: "proto tcp" to "proto udp"
* Change: "remote your-ip 443" to "remote your-ip 1194"
* Import it into your OpenVPN client.
* Connect.
* Debug.

-----

[Back to Surf Safe at Starbucks](/content/surf-safe-starbucks#udp)

