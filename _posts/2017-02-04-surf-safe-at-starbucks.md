---
categories: []
layout: post
title: Surf Safe at Starbucks
created: 1486248381
redirect_from: /content/surf-safe-starbucks
---
*Running your own OpenVPN service, and why you would want to...*

## Dangers of Open WiFi

<img src="/files/free-wifi-danger.jpg" height="70" width="130" style="margin: 0 0 10px 10px;">

It is dangerous!  <a name="dangers_of_open_wifi"></a>See [Dangers of Open WiFi](/content/dangers-open-wifi).

-----

## Solution: OpenVPN

<img src="/files/openvpn.png" style="float: right; margin: 0 0 10px 10px;" height="100" width="100" >
<img src="/files/merlin.png" height="100" width="110" style="float: right; margin: 0 0 10px 10px" >

There is a solution.  Shucks, there are two solutions!

<a name="solution_vpn"></a>

* One solution is [OpenVPN](/content/solution-openvpn) on a stand-alone computer.
* Some consumer-grade routers come with [OpenVPN built-in](https://www.amazon.com/RT-N66U-Dual-Band-Wireless-N900-Gigabit-Router/dp/B006QB1RPY/ref=sr_1_1).

Wondering how a VPN keeps your data private?  See: [How Does a VPN Work?](/content/how-does-vpn-work)

-----

## Is This Gonna Cost a Bundle?

<img src="/files/raspberry-pi-logo.png" style="float: right; margin: 0 0 10px 10px;" height="100" width="100" >

* No.  <a name="introducing_pi"></a>See [Introducing the Raspberry Pi](/content/use-raspberry-pi-vpn-server).
<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->

-----

## Authorities, Keys, and Certificates Explained

<img src="/files/certificates-and-keys.png" height="150" width="300" style="float: right; margin: 0 0 10px 10px" >

If you're not clear on Certificate Authorities, Keys, and Certificates, [read this](/content/certificates-keys-and-authorities).


## Keys, Certificates, Certificate Authorities, and Your U.S. Passport

Your server will not have a list of authorized users, yet only authorized users can use your server!  How is this possible?  It is sort of like the State Department, your passport, and the INS.

<a name="your_passport"></a>See [Keys, Certificates, Certificate Authorities, are Like Your U.S. Passport](/content/keys-certificates-certificate-authorities-are-your-us-passport).

<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->


-----

## Master List of Keys and Certificates

OpenVPN uses [a lot of keys and certificates](/content/kevins-table-openvpn-keys-certificates-and-authorities).

-----

## Generate Your Certificate Authority, Certificates, and Key

<a name="build_all_keys"></a>Before you can run your VPN, you're going to need [create keys and certificates](/content/build-keys-and-certificates-you-need-your-openvpn-server-and-clients).

-----

## Install the Operating System

<img src="/files/raspberry_pi_sd_card_inserting.jpg" height="110" width="150" style="float: right; margin: 0 0 10px 10px" >

<a name="install_the_os"></a>The OS for the Raspberry Pi is called Raspbian.  It is based on the Debian distribution of Linux.  If you're familiar with Ubuntu, you'll feel right at home.

For install instructions, see [Basic Raspberry Pi Setup - Installing Raspbian](/content/basic-raspberry-pi-setup-installing-raspbian)

You don't *have* to use a Raspberry Pi and Raspbian.  If you happen to have a Linux server at home, any Debian-based distribution will be similar.  Other distributions will have differences in the commands to install packages and/or file locations, but the concepts will be the same.

Of course, if you're setting up OpenVPN on a consumer-grade router which bundles it, your router already has its OS.

-----

## Install OpenVPN and Configure the OpenVPN Server

<a name="install_openvpn_server"></a>If you're using a Pi, the next step is to set up an OpenVPN server on your Pi.  You can use [PiVPN](http://www.pivpn.io/) but that means you're trusting the folks at pivpn.io.  I don't know them.  They're probably wonderful people who never make a mistake.  OpenVPN is pretty thoroughly vetted, but PiVPN somewhat less so.  I'm going to set up OpenVPN on my own.

* See [Install and Configure an OpenVPN Server](/content/install-and-configure-openvpn-server-linux), if you're using a Pi.
* See [Set-up OpenVPN using Asus](/content/set-openvpn-using-merlin-asus-router-and-tunnelblick-mac-os), if you're using an Asus router.

-----

## Installing Clients

Once you've done that, download and install your OpenVPN client.

<img src="/files/setup-exe.png" height="139" width="200" style="float: right; margin: 0 0 10px 10px"><a name="configure_windows"></a><a name="configure_android"></a>

* For Windows, [follow these Windows instructions](/content/install-openvpn-windows).
* For Android, [follow these Android instructions](/content/install-openvpn-android)
* For Mac, go to [the Tunnelblick site](https://tunnelblick.net/) and download and install Tunnelblick (if you don't have it already).  It is the only sensible VPN client for Mac.
* For Linux, [here's a tutorial](https://www.linux.com/learn/configure-linux-clients-connect-openvpn-server).
* For iOS, you're on your own.  I haven't had to do this one yet.

<br /> <!-- to make space for the image -->

-----

## Configuring Clients

You've got the server configured and you have key files for the clients.  You still need configuration files for the clients.  These files must line up with the server configuration.  For example, if you told the server to use TCP instead of UDP, you have to tell the client the same.  Likewise for which encryption algorithm to use, etc.

* <a name="build_client_config"></a>[Build Configuration Files for Your OpenVPN Clients](/content/build-configuration-files-your-openvpn-clients)

    * In order to bring up a client, transfer the .ovpn file for that client from ~/easy-rsa/keys (on the machine where you built your keys).  To transfer the file you can use scp, sftp, sneakernet, etc.  You should choose a secure method because you don't want someone else to get that file.
    * Import the .ovpn file into your OpenVPN client.  This varies by client.
        * For Tunnelblick: Just open (double-click) a .ovpn file and Tunnelblick will load it.  Rename the loaded configuration to something like homeaddress-raspivpn-kevin-mac or homeaddress-routervpn-kevin-mac.
        * For other clients, you'll have to poke around in the menus or RTFM for your client.  Most of them have something like "File >> Import Configuration". 
    *Once you import it, delete any temp copies.  You *really* want to keep this file secure because it will grant anyone who has it access your VPN.

-----

## Open Your Firewall on Your Pi

<img src="/files/firewall.png" height="139" width="200" style="float: right; margin: 0 0 10px 10px">

You can't connect to a VPN on your Pi if your firewall blocks access.  Your Pi came with a built-in firewall.  We need to open the necessary ports on your Pi.

<a name="open_pi_wall"></a>See [Open Your Firewall on Your Pi](/content/open-your-firewall-your-pi-vpn).

<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->

-----

<img src="/files/pinhole.png" height="130" width="160" style="float: right; margin: 0 0 10px 10px">

## Open a Pinhole In Your Gateway

You probably have a telco-provided router.  If you're with AT&T, it is called a "Residential Gateway."  If you get your Internet from a cable company, it is called a "Cable Modem."  Regardless of what it is called, it is a router (among other things).  You'll need to configure it so that when a computer *outside* your LAN tries to get *into* your LAN, the router forwards traffic to your Pi.  The way you do this is probably to point your browser to your router's IP address.  You may have to call your ISP and ask them how.  I can tell you that on a 2Wire residential gateway, you do this by browsing to http://192.168.1.254 and looking under 'Firewall'.

Port 1194 is the standard for OpenVPN, and I use that port internally.  However, for the EXTERNAL port I like to use 443.  Occasionally, I run into a hotel or an open WiFi that blocks non-browser traffic.  By using port 443, the router thinks my VPN is just a browser's https traffic.

However you do it, configure your telco router to send incoming traffic that hits port 443 to get passed to port 1194 on your Pi.

<br /> <!-- to make space for the image -->

-----

## Test Your Connection

* Copy one of the "bogus" .ovpn files from the server to your local workstation.
* Import the .ovpn file into your local OpenVPN client
* Connect.
* [Debug](/content/openvpn-troubleshooting)
* Run a traceroute to google.com.  The first hop should be 10.16.0.1.  If it isn't that, your VPN client isn't sending all traffic via the VPN.  Fix it.

-----

## Practice Revoking a Certificate

<img src="/files/revoked-passport.png" height="160" width="120" style="float: right; margin: 0 0 10px 10px">

Sooner or later, someone is going to lose a laptop or a cell phone and you'll need to revoke his/her certificate so that the thief can't use your VPN.  When you put a .ovpn file on an client, be certain that client has a good password (e.g. a good screen-lock PIN on your cell phone or a strong Windows password on your Windows PC - with a short timeout on the lock-when-idle.)

<a name="revoke_cert"></a>See [Practice Revoking a VPN Certificate](/content/practice-revoking-vpn-certificate).

<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->
<br /> <!-- to make space for the image -->

-----

## Making UDP Work Too

I'd like to have a UDP instance too.  As I've mentioned, in theory, running a VPN over UDP should work better than running it over TCP.  When you have TCP layered over TCP, if you run into network latency, you can have both layers retransmitting, and the upper layer can exacerbate the latency of the lower layer with the extra traffic.

<a name="udp_from_tcp"></a>See [Build a UDP VPN Config File from TCP Config](/content/build-udp-vpn-config-file-tcp-config).

-----

## Auto-connecting

<a name="autoconnect"></a>

You may decide that you'd like your cell phone or computer to automatically connect to your VPN.  Conceptually, this is easy -- if I'm connected to WiFi and I'm not on my home network, start my VPN.  I had this set up for my phone and my Macbook but I never really got it as smooth as I wanted.  If you're interested in pursuing this:

* For Android, the tool is [Tasker](https://play.google.com/store/apps/details?id=net.dinglisch.android.taskerm).  See [Use Tasker to Auto-enable VPN on Android](/content/use-tasker-auto-enable-vpn-android).
* For Mac, the tool you want is [ControlPlane](https://www.controlplaneapp.com/).  
    * It allows you to define rules such as, "If I'm connected to *this* Wifi network and I have *these* GPS Coordinates, then stop Tunnelblick; otherwise, start Tunnelblick.  
    * Then, you tell Tunnelblick that it should auto-start your home VPN whenever it starts.  
    * This works pretty well, but *every* time I wake my Macbook at home, it stops Tunnelblick.  I do so much tinkering that I didn't really want this.
* To make Windows auto-connect, I couldn't find anything off the shelf.  You'll have to do some scripting with AutoHotkey, Ruby, Python, etc.
* iOS?  So sad.  Apple won't let software auto-connect you.  It's a sandbox limitation.

-----

## Grant Dad Access to the Home LAN When He's Out of Town

<a name="grant-dad"></a>
<img src="/files/dad.jpg" height="133" width="180" style="float: right; margin: 0 0 10px 10px">

There's another use-case for VPN, besides tunneling on an unsafe WiFi.  When you're out of town, whether you're in a hotel or visiting Grandma, you might like to fetch a file from your home LAN.  Wouldn't it be nice to to connect to your home LAN?

In our walk-through above, we set up your VPN server so that everyone on your VPN has access to your home LAN.  But maybe you don't trust your kid to keep his phone safe.  Remember: If he loses that cell phone, he loses one of the keys to your VPN and if someone nefarious finds the key, *he* can connect to your VPN.  

See [Grant Only Dad Access to the Home LAN](/content/grant-only-dad-access-home-lan)

-----

## Wrap-up

<img src="/files/christmas-present.jpg" height="133" width="180" style="float: right; margin: 0 0 10px 10px">

* We took a $50 compter or an $80 router.
* We installed a free Linux operating system.
* We installed OpenVPN.
* We used EasyRSA to generate our keys and certificates.
* We installed a VPN client on our clients.
* We imported the client configuration file.
* We discussed auto-connect options.
* We granted special permissions to a special user.

## Learn More / Other Options
* If you want more info, [this book](https://www.amazon.com/Mastering-OpenVPN-Eric-F-Crist-ebook/dp/B0112ES3SI/ref=tmm_kin_swatch_0?) is an option.
* It looks like [this guy](https://www.amazon.com/Build-Smart-Raspberry-VPN-Server-ebook/dp/B00TI7LDWU/ref=sr_1_15?) wrote a book which tells how to do the same thing as this blog posting.  I haven't read it, but if you need more details than I provide, it is an option.
* [This post](http://envyandroid.com/setup-free-private-vpn-on-amazon-ec2/) describes using an Amazon server instead of a Raspberry Pi.
    * You can actually [purchase the commercial OpenVPN Access Server](https://aws.amazon.com/marketplace/pp/B00MI40CAE/ref=mkt_wir_openvpn_byol) in the AWS Marketplace.
    * Note that with AWS, you can set up a privacy-VPN, but it clearly isn't going to let you access your home LAN!
    * Free lasts for a year.  Then you have to start paying for your AWS.  It is surprisingly cheap, if you're a lightweight user.  Consider pro/con of using comp-lzo (trading CPU time of compression vs network bandwidth).
