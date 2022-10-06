---
title: Grant Only Dad Access to the Home LAN
layout: post
created: 1488504853
redirect_from: "/content/grant-only-dad-access-home-lan"
---

* *Summary: Per-user config file, Dad on a dedicated IP, firewall to filter except that IP*

Maybe **you** want to access your home LAN while out, but you don't want your kid's phone to access your LAN.  If he loses that phone and it isn't passworded, someone could (theoretically) find the phone, pull the certificate off, access your VPN, and then access files on your home LAN.

In this case, you'd like most users' traffic to be permitted to travel through the router on its way to the internet, but not to travel to your LAN; you want the same for traffic from your laptop, but you also want that traffic to be able to reach your LAN devices.  Maybe your kid needs to work on his homework on his PC when you're at Grandma's, and you want to remote control his PC from your laptop using [VNC](http://www.tightvnc.com/).

I'm going to describe how to do this on an ASUS router running OpenVPN with ['Merlin' firmware](https://github.com/RMerl/asuswrt-merlin).  Merlin has some special capabilities which make this easier.  Doing this on a Pi is similar, but some of the interfaces will have different names.

Let's begin by blocking access to your LAN for all VPN users.  Executing this command on your server will block access to the LAN:

* iptables --insert FORWARD -s 10.0.0.0/8 -d 192.168.0.0/16 -j DROP
    * iptables is the command to add a firewall rule.
    * "--insert FORWARD" says to add a rule to the packet forwarding table at the beginning of the table.
    * -s and -d specify the source and destination subnets.
    * "-j DROP" says to drop any frames which match this rule.

* To make this permanent, add the iptables command to a file on the router named /jffs/scripts/firewall-start.
    * You need to use the event 'firewall-start' and not 'openvpn-event', or else you can wind up with many, many copies of your rule in the table, if the VPN server gets stopped and started between reboots. 
    *You need the first line in the file to be "#!/bin/sh".
* "chmod ugo+x" the file and it will get executed when the VPN server starts (or stops).  
* See [this](https://github.com/RMerl/asuswrt-merlin/wiki/User-scripts) for more info on event scripts.
* Enable user scripts via the router at: Administration >> System >> Enable JFFS custom scripts and configs

* Consider also: iptables --insert INPUT -s 10.0.0.0/8 -d 192.168.1.1 -j DROP
    * This blocks VPN users from accessing your router itself. (If you're using a different net than 192.168.1.x, substitute it.)

When you ran build-key, you ran a command line like:

    build-key "user-key-3"

The name you supplied becomes the X509 Common Name (CN) in your key.  In this case, the common name will be "user-key03".  Conveniently, when you look in ~/Packages/easy-rsa/keys_xxxxx, you'll see a file with a name like 'user-key-3.crt'.  The file name of your certificate (less the ".crt") matches the CN inside the file.

On the router:

    mkdir /jffs/configs/openvpn/ccd1/
    mkdir /jffs/configs/openvpn/ccd2/

* Create a file on the router in the ccd1 directory named "user-key-3" (or whatever Dad's CN is).  In this file put something like:

    ifconfig-push 10.8.0.50 255.255.255.0

* That will assign Dad's laptop the IP address 10.8.0.50.  When a client connects, OpenVPN matches the common name against files in the per-client config directory.  If it finds a match, it loads that file as an extension of the OpenVPN file for the current client.  Our command pushes the IP address to the client.
* If no matching file is found, OpenVPN will try to use a default file called "DEFAULT", so you have a way to specify settings for users who do NOT match a per-client config.
    * Note: We're going to block access to all users and then grant access to Dad.  An alternate approach would be to grant access to all users, and then block most users via a DEFAULT per-client config.  I think it is safer to block by default, rather than by 'DEFAULT', in case something goes wrong with name matching or per-client config - you want the broken state to deny access, for security.
* On the router, enable the "Manage Client-Specific Options" option under OpenVPN Server, and press Apply.
    * IMPORTANT: You must do this **after** you create the config in ccd1.  When OpenVPN service is (re)started, Merlin copies from /jffs/configs/openvpn/ccd1 to /etc/openvpn/server1/ccd.  jffs files are preserved across reboots.  /etc/openvpn is where OpenVPN expects to find files, but it is on a RAM disk, so it vanishes after a reboot.
* You might read that you can go to your server configuration file (/etc/openvpn/server1.conf)  and find the line similar to the line below, and comment it out, to block access:
    * push "route 192.168.1.0 255.255.255.0"
    * (Remember: If your LAN isn't 192.168.1.x, substitute your LAN's address in the above.)
* It won't work.   In the first place, you clients can get to your LAN with or without that route.  (I'm assuming that you enabled "Direct clients to redirect Internet traffic", which sends all client to the rouder.)  In the second place, and more importantly, any route you can push (or not push), your users can defeat via the "route" command of their operating system.
* Important principle: Locking people out is done with your firewall, not routes.

Now edit /jffs/scripts/firewall-start and make it look like this:
    iptables --insert FORWARD --in-interface tun21 --out-interface br0 -s 10.0.0.0/8 -d 192.168.0.0/16 -j DROP
    iptables --insert FORWARD --in-interface tun21 --out-interface br0 -s 10.8.0.50 -d 192.168.0.0/16 -j ACCEPT

(You need the lines in that sequence because each one adds a rule to the top of the file, and you need your ACCEPT to override your DROP.)

* 1st line = If a frame comes in on the VPN, from a 10.x.x.x address, destined for your LAN, drop it.
* 2nd line = If a frame comes in on the VPN, from Dad's special address, destined for your LAN, accept it.  (This rule will be at the top of the table, so it takes precedence.)

At this point, you should restart your router and confirm that these rules are in place via: "iptables -L FORWARD -v".  Then test it with Dad's certificate and with someone else's certificate.

You really ought to ensure that no one else can get Dad's address.  To do that, the end you need to accomplish is:

* Remove "server 10.8.0.0 255.255.255.0" from your VPN configuration file and replace it with:
    * ifconfig 10.8.0.1 255.255.255.0
    * ipconfig-pool 10.8.0.3 10.8.0.49 255.255.255.0
* You have to remove the "server" line because it expands (internally) to include an "ifconfig" plus an "ifconfig-pool"

I can think of one way to accomplish this: 

* Via a [postconf script](https://github.com/RMerl/asuswrt-merlin/wiki/Custom-config-files#postconf-scripts), to 'sed' the config file.

It looks like you can assign static IP with an 'ifconfig-pool-persist' option, instead of per-client config (if the only per-client config you're doing is to set static IP).  However, I've read of people having trouble getting it to work and, as I read things, the server can *update* this file, which would be a bad idea for your VPN security if it surprises you with an update.


-----

[Return to Safe Surfing at Starbucks](/content/surf-safe-starbucks#grant-dad)