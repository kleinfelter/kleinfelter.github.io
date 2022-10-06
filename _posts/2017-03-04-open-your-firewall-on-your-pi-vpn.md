---
categories: []
layout: post
title: Open Your Firewall on Your Pi VPN
created: 1488667993
redirect_from: /content/open-your-firewall-your-pi-vpn
---
You can't connect to a VPN on your Pi if your firewall blocks access.  Your Pi came with a built-in firewall.  We need to open the necessary ports on your Pi.

<img src="/files/firewall.png" height="180" width="300" style="margin: 0 0 10px 10px" >

* Create a script named /etc/openvpn/firewall-rules.sh.  Make it contain this:

        #!/bin/sh
        iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE
        iptables -t nat -A POSTROUTING -s 10.16.0.0/24 -o eth0 -j MASQUERADE
        echo "firewall-rules.sh executed" > /tmp/firewall-rules.sh.log

* You don't really need that echo statement, but if your VPN doesn't work, you'll want to check the timestamp on /tmp/firewall-rules.sh.log to see if the script got executed.

* Set proper permissions:

        sudo chmod 744 /etc/openvpn/firewall-rules.sh
        sudo chown root /etc/openvpn/firewall-rules.sh

* As root, edit /etc/network/interfaces and put this line BEFORE "iface eth0...".  Do not indent it.

    auto eth0

* As root, edit /etc/network/interfaces, and append this line after the "iface eth0..." line, indented 4 spaces:

        pre-up /etc/openvpn/firewall-rules.sh

* Allow packet forwarding by editing /etc/sysctl.conf and un-commenting this line:

        #net.ipv4.ip_forward=1

* Commit the packet forwarding changes by running:

        sudo sysctl -p

* Start your server with the command below.  I think this also causes it to auto-start at boot.  Note that "server1" must match up with the "server1.conf" file in /etc/openvpn:

        sudo systemctl start openvpn@server1.service

* Reboot your Pi.

-----
[Return to Surf Safe at Starbucks](/content/surf-safe-starbucks#open_pi_wall)
