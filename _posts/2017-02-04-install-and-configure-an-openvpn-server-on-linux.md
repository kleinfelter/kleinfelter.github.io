---
categories: []
layout: post
title: Install and Configure an OpenVPN Server on Linux
created: 1486253828
redirect_from: /content/install-and-configure-openvpn-server-linux
---
## Install

    sudo apt-get update
    sudo apt-get install openvpn

## Copy Your Server Keys to the Production Directory

If you built your keys on a separate key generation machine:

* Run these commands on your key generation machine (and select **keys_raspivpn** or *your* key directory, if you put your Pi VPN keys elsewhere):

        source vars
        ssh pi@raspi-vpn mkdir -p /home/pi/Packages/easy-rsa/keys
        dest=/home/pi/Packages/easy-rsa/keys
        scp $KEY_DIR/ca.crt  pi@raspi-vpn:$dest/
        scp $KEY_DIR/server*.crt  pi@raspi-vpn:$dest/server.crt
        scp $KEY_DIR/server*.key  pi@raspi-vpn:$dest/server.key
        scp $KEY_DIR/dh????.pem  pi@raspi-vpn:$dest/dh.pem
        scp $KEY_DIR/ta.key  pi@raspi-vpn:$dest/static-ta.key
        scp $KEY_DIR/crl.pem  pi@raspi-vpn:$dest/crl.pem

* Then run this on your VPN server:

        export KEY_DIR=/home/pi/Packages/easy-rsa/keys/


Regardless of where you built your keys, run these commands on the VPN server.  Note that your 'keys' directory may be named 'keys_raspivpn' or 'keys_raspivpn', so you may have to alter the commands slightly):

    sudo mkdir -p /etc/openvpn/server1
    cd $KEY_DIR
    sudo cp ca.crt  /etc/openvpn/server1/
    sudo cp server.crt  /etc/openvpn/server1/
    sudo cp server.key  /etc/openvpn/server1/
    sudo cp dh.pem  /etc/openvpn/server1/
    sudo cp static-ta.key  /etc/openvpn/server1/
    sudo cp crl.pem /etc/openvpn/server1/
    sudo chmod 700 /etc/openvpn/server1/
    sudo chown -R root /etc/openvpn/server1

If you built your keys on a separate key generation machine:

* Run these commands on your ''Pi'' (NOT the key generation machine!):
    * rm -r ~/Packages/easy-rsa/keys

## Create the Server Configuration File

<img src="/files/config-icon.png" height="200" width="200" style="float: right; margin: 0 0 10px 10px" >

We're going to create a setup for TCP connections.  Once we get it working, we'll copy it and modify the copy for UDP.  In theory, UDP is better for a VPN because you'll be running TCP inside your tunnel and you don't want TCP on top of TCP because if you get delayed packets you'll have *both* layers doing retransmits and it will make a mess.  In practice, TCP often works *better* than UDP because firewalls sometimes don't permit the UDP traffic.  It looks to me like one popular 2Wire residential gateway takes a long time to clear the port after UDP, making reconnects problematic.

The copy will get a different:

* port
* protocol
* subnet

The standard port for VPN is 1194.  That's what I use here.  Some hotel and fast food WiFi will only let you make outbound connections to ports 80 and 443.  I'm not running an HTTPS server, so I'm not using port 443 for that.  I will configure my external router to forward from its external IP on port 443 to my VPN server on port 1194.  (Let's keep the weird port knowledge isolated to the router's port-forwarding.)

Edit /etc/openvpn/server1/config.ovpn on your Pi as root.  Make it contain:

    # Run in daemon mode (send output to /var/log instead of stdout), label your output as 'server1'
    daemon server1

    # Run as a layer-3 VPN (IP, not Ethernet).
    # If you care about tun/tap, see https://en.wikipedia.org/wiki/TUN/TAP
    dev tun

    # Use TCP instead of UDP and run on the standard port.
    proto tcp-server
    port 1194

    # Tell OpenVPN where you put your certificates and keys.  ca=Certificate Authority; 
    # cert=server certificate; key=server key; dh=diffie-helman (used to securely 
    # exchange keys w/client); crl=Certificate Revokation List
    ca /etc/openvpn/server1/ca.crt
    cert /etc/openvpn/server1/server.crt
    key /etc/openvpn/server1/server.key
    dh /etc/openvpn/server1/dh.pem
    crl-verify /etc/openvpn/server1/crl.pem

    # Use HMAC, an *extra* key, used to authenticate the TLS handshake.  When the client makes its 
    # initial connection to the server, if the client doesn’t pass it, the server doesn’t respond,
    # protecting against some DDOS attacks.
    # You must specify the key file and the encryption algorithm used to encrypt the key.
    tls-auth /etc/openvpn/server1/static-ta.key 0
    auth SHA256

    # assign addresses to clients from the given network/netmask. The server will take the ".1" address
    # TODO: CHANGEME if you run multiple servers.  Put one on 10.8.x.x and one on 10.16.x.x
    server 10.16.0.0 255.255.255.0

    # Use this encryption algorithm for VPN traffic
    cipher AES-256-CBC

    # Enable adaptive compression. Reduces data transmission. If your VPN server runs with high CPU, you
    # might consider removing this. Setting it on the server compresses data leaving the server; setting
    # it on the client compresses data leaving the client. Note that 'adaptive' uses a sampling
    # interval, so if you download a zipped file, it will disable compression until the next sample.
    comp-lzo adaptive
    push "comp-lzo adaptive"

    # Send keep-alives every 15 sec, so the connection won't drop.  If you don't see traffic for 60 sec,
    # drop the connection.
    keepalive 15 60

    # If you don't do this, Tunnelblick on the Mac will append domain ".openvpn"
    push "dhcp-option DOMAIN ."

    # Permits multiple clients to connect using the same certificate at the same time.
    # If you have one cert and you want to share it among all your clients, or you use the same cert for
    # your PC and your cell, un-comment this.
    #duplicate-cn

    # What DNS server to use.
    # You don't want to use the DNS provided where you're jacked-in or on public WiFi.  It might be
    # compromised. Either provide the IP address of your home router/DNS, or use Google's public DNS.
    # TODO: CHANGEME -- Use the value of the DNS server (probably home router) for YOUR network.
    push "dhcp-option DNS 192.168.1.1"

    # Make the VPN your default gateway router.  Send ALL traffic via the VPN (except the link-level
    # frames your VPN tunnels inside).  def1 grants access to the LAN.  block-local blocks access to
    # the LAN.  You want to block access to LAN when surfing at a cheesy open WiFi.
    #push "redirect-gateway def1"
    push "redirect-gateway block-local"

    # Permit your VPN clients to see each other.
    client-to-client

    # Run the VPN under this user ID and group.
    user nobody
    group nogroup

    # Write your log file here.
    log /var/log/openvpn1.log

    # Bigger numbers produce more log info.  Change this to 1 once you are happy with your VPN.
    verb 3

    # Retain the keys across VPN restart.  If you launch VPN as root, change to user nobody, and then
    # you send a signal to the VPN to restart (as opposed to killing the process and re-launching),
    # you won't be able to read the key files because they are root-only.  This solves that problem.
    persist-key

    # Don't close and reopen TUN device or run up/down scripts across SIGUSR1
    # or --ping-restart restarts.
    persist-tun

    # Insist upon recent versions of TLS protocol because the older ones have been broken.
    tls-version-min 1.2

    #client-config-dir /etc/openvpn/server1/per-client-config

    # Consider enabling this option briefly, to tune your MTU.  It take a few minutes (literally) at VPN
    # startup, to empirically discover the best MTU. It writes results to your log file.
    # So you would enable it, connect, check the log file, make your changes, and remove it.
    # This is only permitted with UDP!
    #mtu-test

**STOP**:  You may need to edit these values in the file you just created -- use YOUR network's values for the following:

    push "dhcp-option DNS 192.168.1.1"

Note: You'll see a file /etc/openvpn/update-resolv-conf.  I *think* this is used only if you run OpenVPN as a VPN client.  We're running it as a VPN server.

-----

## Start OpenVPN Daemon and Enable Autostart

Raspbian, like many recent releases of Linux, expects you to use 'systemctl'.  This replaces the 'service' command you may be familiar with.  If you're an old guy like me, it also replaces the SysV init and init.d that you understand.

The installed Raspbian+OpenVPN expects to find anything.conf in /etc/openvpn.  I named my file config.ovpn and put it in /etc/openvpn/server1 to make it more like AsusWrt.  To reconcile these:

    sudo su
    cd /etc/openvpn
    ln -s /etc/openvpn/server1/config.ovpn server1.conf

To start OpenVPN for the first time:

    systemctl start openvpn@server1.service

**server1** must match up with 'whatever-you-named-it.conf' in /etc/openvpn.  Since I named it '*server1*.conf', I have to start openvpn@*server1*.conf.

Check to see if it started successfully.  If it didn't, fix any issues before proceeding:

    cat /var/log/openvpn1.log

If it started, enable autostart, and reboot with

    systemctl enable openvpn@server1.service
    reboot

After reboot, check to confirm it is running:

    ps -ef | grep openvpn

-----

[Back to Surf Safe at Starbucks](/content/surf-safe-starbucks#install_openvpn_server)
