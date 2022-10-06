---
categories: []
layout: post
title: Coffeeshop Wi-Fi Safety With Windows
created: 1396633976
redirect_from: /content/coffeeshop-wi-fi-safety-windows
---
If you use a public Wi-Fi hot spot, and it is configured to use WPA or WPA2, it is probably safe to use the hot spot.  If you don't know whether the hot spot uses WPA/WPA2:

* If you don't have to enter a password, it is NOT using WPA/WPA2.  Be careful.
* If you have to enter a password to use the Wi-Fi, it might be using WPA/WPA2 or it might be using WEP.  Check the following:
    * Click on the Wi-Fi signal bars in your Tray.  You'll see a "Wireless Network Connection" list near the bottom of the pop-up window.
    * Hover over the name of the hot spot, in the list of connections.  You'll see a cream-background pop-up (on top of the existing pop-up).
    * Look for the "Security Type" row.  If it says WPA2-xxxx or WPA-xxxx, you're probably OK.  (If this really is the hot spot you think you are using.  Somebody could have a hot spot with the same name in the building next door, and they could have set it up to be nasty.)
    * WEP is cheap and tawdry and generally does not protect you from a determined hacker

So if you don't have WPA/WPA2 what's the problem?  See https://en.wikipedia.org/wiki/Firesheep

How can you defend against that sort of thing?

* Install and use a VPN.
* Use Chrome, and (before you go to the hot spot) go to https://chrome.google.com/webstore and download and install the HTTPS Everywhere extension.
* Visit only HTTPS sites.  Watch the address bar while you're at the hot spot.  If you ever see the address bar NOT containing a padlock icon on its left side then:
    * If the site you are on knows who you are (i.e. it has a cookie for you), you just risked your account on that site.  Leave the site, go to a SAFE network connection, and change your password.
* Go into Control Panel / Windows Firewall.  Ensure that the shield icon for Public Internet is green, indicating that you are using the recommended settings.
* Go to Control Panel / Network and Sharing Center, 
    * Click on "Change Advanced Sharing Settincgs" and scroll down to the Public section
    * Turn off:
        * Network discovery
        * File and print sharing
        * Public Folder Sharing
        * Media Streaming

Do I need to do all of these or just one of these?

* Check for WPA2.  If the access point uses WPA2, you don't have to worry about VPN or HTTPS Everywhere.
* If you have a VPN and it is set up 100% correctly, you probably don't need the rest.
* HTTPS Everywhere is good, so long as you visit solely HTTPS-enabled sites.
* The Control Panel stuff is good for general protection, but it won't protect you from Firesheep.

My advice is to do all of these.  Maybe you rushed your check for WPA and made a mistake.  If your VPN leaks, but you visit only HTTPS, you're still safe.  You have to have both a bad VPN setup and an HTTP session before your data is at risk.

Don't forget that in addition to your browser talking to remote sites, if you have other applications that sync data or fetch data, if they use HTTP instead of HTTPS, they could expose your data too.  Best to shut them down while using an insecure hot spot.

There is still a small risk.  Suppose you're using the hot spot in a Starbucks, and the hot spot is named STARBK1.  Suppose that the teenager in the Baskin-Robbins next door also set up a hot spot named STARBK1, and he hacked his hot spot to have high power and to mess with your data.  Your PC might connect to the Baskin-Robbins hot spot instead of the Starbucks hot spot.

There is a way to protect against this, but it is impractical.  You'd have to ask the barista what his MAC address was, his external IP address, and the address of his gateway router.  Then you could run geeky utilities on your PC to confirm that you were going through his hotspot.  (You have to go beyond his MAC address because the kid at Baskin-Robbins could spoof that.)

If the ice cream kid is really doing this, if you wander around Starbucks with your laptop, at some point you'll probably see two STARBK1 hot spots, and then you can freak out.

Find out the name of the Starbucks hot spot.  It might be named "STARBKS" and the Baskin-Robbins kid might name his "Free Starbucks Wi-Fi".  Ask the barista or check the sign.
