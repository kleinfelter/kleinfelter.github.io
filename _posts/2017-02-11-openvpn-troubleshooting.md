---
categories: []
layout: post
title: OpenVPN Troubleshooting
created: 1486829586
redirect_from: /content/openvpn-troubleshooting
---
Here's where I collect my 'learnings' on setting up and operating OpenVPN.

## Handy Command Lines

Restart OpenVPN server, to re-load config file:

    sudo service openvpn restart

## OpenVPN Always Connects Twice or Connects, Drops, Connects, Drops, Connects...

I set up my OpenVPN system and went to make my initial connection. It connected!  And dropped, and connected and stayed connected.  In fact, every time I told the client to connect, it would connect, then drop, then reconnect.  Weird.  Usable.  A little slow.  A mystery.

I'm using a Mac client, but I'm confident that the problem would also occur with a Windows or a Linux client, given what I found.

Here's what I saw in the server log (loglevel=4):

    Sat Feb 11 15:49:01 2017 us=98029 user-key01/192.168.1.11:49282 PUSH: Received control message: 'PUSH_REQUEST'
    Sat Feb 11 15:49:01 2017 us=98346 user-key01/192.168.1.11:49282 send_push_reply(): safe_cap=940
    Sat Feb 11 15:49:01 2017 us=98746 user-key01/192.168.1.11:49282 SENT CONTROL [user-key01]: 'PUSH_REPLY,route 192.168.1.0 255.255.255.0,redirect-gateway def1,route-gateway 10.16.0.1,ifconfig 10.16.0.3 255.255.255.0' (status=1)
    Sat Feb 11 15:49:02 2017 us=741673 user-key01/192.168.1.11:49282 Connection reset, restarting [0]
    Sat Feb 11 15:49:02 2017 us=741962 user-key01/192.168.1.11:49282 SIGUSR1[soft,connection-reset] received, client-instance restarting

The first observation here is that the connection dropped immediately following the PUSH_REPLY.  Something in that push is breaking the connection.  The first step in debugging is to start commenting out the 'push' lines in your server config, one at a time (with a 'sudo service openvpn restart' after each change) and re-testing each change.  I discovered that commenting out the following line caused it to stop this behavior:

    push "redirect-gateway def1"

OK.  That config tells the client to route all traffic via the VPN.  I *want* to do that.  I don't want my laptop talking to other laptops on the coffeeshop's open WiFi.  But it breaks my VPN.  Hmmm...

The kicker here is that my test lab has my laptop on IP address 192.168.1.11 and my OpenVPN server is on 192.168.1.10.  In other words, my test VPN server is on the LAN with my laptop.  I'm using a TCP tunnel, so I have a TCP connection across my LAN from my client to my server.  When I "redirect-gateway def1" (whether I push that from the server or I put it in my client config), I break that TCP connection.

The bottom line is that "redirect-gateway def1" is incompatible with having your VPN client and server nominally on the same LAN.

OK.  So how do you test when your client and server are on the same LAN?  Go to your external firewall, and open a pinhole to your test server, and connect to your server via its EXTERNAL address.

For example, if your external IP address is 12.34.56.78, and your test server is on 192.168.1.10 at port 443, configure your external firewall to pass traffic from 12.34.56.78:443 to 192.168.1.10:443, and change your client config to use "remote 12.34.56.78 443" instead of "remote 192.168.1.10 443".

Interestingly, "persist-tun" on the client turns out to be relevant.  If persist-tun is present, the reconnect will succeed, giving you the symptom, "OpenVPN connects twice for every attempted connect via the client UI".  If persist-tun is absent, your symptom will be, "OpenVPN in connect/disconnect loop" or "OpenVPN Connect, Disconnect, Connect, Disconnect..."

## Routing problems

* If you can get to 10.16.0.1 (or 10.8.0.1), but you can't reach the Internet, check to see that /etc/openvpn/firewall-rules.sh got executed.

## Address Problems

* If your VPN usually works, but one day your traffic won't flow, check your IP address before connecting to the VPN.  If you followed this tutorial, your VPN IP address will be 10.8.x.x or 10.16.x.x.  If you connect to a WiFi which happens to use those subnets for its address, the results will not be pretty.  Personally, this is part of why I set up *two* VPNs (one TCP and one UDP).  If they've got different address ranges, you can just switch to your other VPN.

Incidentally, the last time I connected to ATTWIFI, it assigned 10.20.x.x, but I don't know whether that's consistent.  Many small-time WiFi will assign an address from 192.168.x.x.

-----
[Return to Surf Safe at Starbucks](/content/surf-safe-starbucks)
