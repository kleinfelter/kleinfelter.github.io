---
categories: []
layout: post
title: TP-LINK AC1200 Archer T4U USB 3.0 WiFi Dongle Installation for Ubuntu 16.04
  Yakkety Yak (Debian-based Linux)
created: 1469564170
redirect_from: /content/tp-link-ac1200-archer-t4u-usb-30-wifi-dongle-installation-ubuntu-1604-yakkety-yak-debian
---
Note: Chipset is RTL8812au 

* sudo apt-get install linux-headers-generic build-essential git
* git clone https://github.com/abperiasamy/rtl8812AU_8821AU_linux /tmp/rtl8812AU_8821AU_linux
cd /tmp/rtl8812AU_8821AU_linux
* sudo cp -R /tmp/rtl8812AU_8821AU_linux /usr/src/rtl8812AU_8821AU_linux-1.0
* sudo dkms add -m rtl8812AU_8821AU_linux -v 1.0
* sudo dkms build -m rtl8812AU_8821AU_linux -v 1.0
* sudo dkms install -m rtl8812AU_8821AU_linux -v 1.0

You might have to reboot or to remove/re-insert the dongle.  The first connect can take a minute or two.

This is the largest USB dongle I have ever seen.

---------

Update: When I did the above, it worked well on my home network, using WPA2. I was using it from an Ubuntu 16.04 VM, running with VMware Workstation Player 12 on a Windows 7 host laptop.  Then I took the laptop to an attwifi network, and it wouldn't connect.  Here's the steps that I took before it started working.  I don't know which of them fixed it, or if it just fixed itself, given time.

* I told Network Manager (the network icon on the menu bar) to connect to the scanned attwifi SSID.  It reported 'Disconnected' after a few seconds.  I tried again and again.  Maybe 6-8 times.
* I ran some command lines:
    * "iw dev" showed that my device is named wlxec086b12e51c
    * "ip link show wlxec086b12e51c" showed state DOWN.
    * "ip link set wlxec086b12e51c up" gave a not-permitted error.
    * sudo ip link set wlxec086b12e51c up
    * "ip link show wlxec086b12e51c" still showed state DOWN
    * sudo ip link set wlxec086b12e51c up
* I went back to Network Manager and told it to associate to attwifi (again).  After a few seconds, it showed it was associated.
* "ip link show wlxec086b12e51c" now shows state UP.
* "ping google.com" failed DNS.
* "iwconfig" shows we are associated with attwifi at 2.412 GHz.
* "iw wlxec086b12e51c link" shows we are associated.
* "iw wlxec086b12e51c scan" shows lots of output...
    * associated to SSID attwifi
    * no security (WPA/WPA2/WEP) for attwifi
* "sudo dhclient wlxec086b12e51c"
* "ifconfig wlxec086b12e51c" now shows an IP address.
* ping works!
* Shut down VM and VMware.  Do NOT Unplug Wifi.  Wait a few minutes.
* Disable that WiFi device in Windows device manager.
* Remove and replace the Wifi.
* Start VM and login.
* Network Manager reports failure, then a few seconds later it reports success.  Total time to connect is about a minute.  ping works.

--------

* I moved the Wifi dongle to another USB port.
* I had to tell VMware to connect it. (It sees that as a new device.)
* Network Manager tried to connect and failed.
* "ip link show wlxec086b12e51c" says state is DOWN.
* Waited abou 10 minutes, occasionally telling Network Manager to connect and getting "Disconnected".
* It associated.
* A few minutes later, "ip link show wlxec086b12e51c" showed state up, but ping google.com failed.
* A few minutes later, ping worked.

-------

In the future, for debugging Network Manager, this may be helpful : https://wiki.ubuntu.com/DebuggingNetworkManager

Once you are connected, you can use this to monitor signal quality (numerically):
* watch -n1 iwconfig
