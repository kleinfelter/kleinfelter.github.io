---
categories: []
layout: post
title: Install OpenVPN for Android
created: 1489586553
redirect_from: /content/install-openvpn-android
---
* Transfer the ''.ovpn'' file you built for that user from ~/easy-rsa/keys (on the machine where you built your keys -- in my case that is my Macbook at ~/Packages/easy-rsa/keys).  
    * Don't copy the .crt or the .csr or the .key files -- just the .ovpn.  easy-rsa bundled those other files into the .ovpn for your convenience.
    * This is hard to do on an Android, if you've never transferred a file before.
    * Here are instructions for using a Windows PC to transfer the file.  (Of course, you'll have to *first* put the .ovpn file somewhere on your Windows PC!)
        * Connect your phone to your PC with a USB cable.  If this is the first time you've done so, you will see an installation message on your PC. Wait for the driver install to complete.
        * On your phone, pull down the notification/settings.  You'll see a "USB for charging" notification.  Tap it.
        * Choose "Transfer files (MTP)"
        * On your computer, you *might* have a new Windows Explorer window.  If not, open Windows Explorer and click on the new "removable disk" icon for your cell phone.  On my PC it shows up as a little cell icon labeled "XT1095", but unless you have the same model of phone, your label will be different.
        * You should see "Internal storage" inside that Explorer window.  Open "Internal storage".  Then, open the "Download" folder inside it.
        * Copy the .ovpn file from your PC to the Download file on your phone using Windows Explorer.
        * Delete the .ovpn file from your PC.  If you used a USB drive to transfer the .ovpn file, delete it there too.  You really want to keep this file confidential.

The rest of these instructions are done on your phone unless otherwise stated:

* Open "Play Store" on your Android phone.
* Search for "OpenVPN Connect".
* Install it.
* Open it.
* From the menu (the three dots stacked vertically, in the upper-right corner), choose "Import Profile from SD card" (even if it isn't on an SD card).
* Navigate to your Download folder, tap the .ovpn file, and press Select.  You should see (on a very busy page) "Profile successfully imported".
* Using your PC, delete the .ovpn file from your phone's Download folder.  You don't want to leave extra copies of this file sitting around.
* Press Connect.  It will tell you it is about to connect.  Press OK.  You should see "OpenVPN: Connected".
* Press Disconnect.
* From the menu, choose Settings and enable *Battery Saver* and also *Notifications*.
* To the right of "OpenVPN Profile", you should see a Notepad icon.  Tap it.
* Choose *Rename Profile*.  Rename it to "my-home-vpn-1".
* Tap the Notepad icon again and choose "
* Select "Create Connect Shortcut"
* Give it a name of your choosing.  I like "My Home VPN".  Tap "Create Shortcut".
* Return to your phone's launcher screen (typically by pressing the circle icon at the bottom of your screen).
* Unplug your phone from your computer.

In normal use, here's how you will run OpenVPN:

* Tap the "My Home VPN" icon (or whatever you decided to call it) on your phone's launch screen.
* When you want to disconnect, tap the icon again and tap "Disconnect".
* That's it!

If you want to confirm that you're really using VPN:
* Install *PingTools Network Utilities* from Play Store.  (You want the one by "StreamSoft".)
* While you're on VPN, confirm that you can ping the IP address of your home router, and do a Traceroute to google.com and confirm it goes via your 10.16.x.x VPN subnet.

-----

[Return to Surf Safe at Starbucks](/content/surf-safe-starbucks#configure_android)
