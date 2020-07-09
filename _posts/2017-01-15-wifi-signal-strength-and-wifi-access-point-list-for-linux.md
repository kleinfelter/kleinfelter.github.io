---
categories: []
layout: post
title: WiFi Signal Strength and WiFi Access point List for Linux
created: 1484498334
redirect_from: /content/wifi-signal-strength-and-wifi-access-point-list-linux
---
Need a way to list all the visible access points, with signal strength and signal quality, on a Ubuntu Linux system?

For a one-shot listing (with color coding):

    nmcli d wifi

For ongoing listing:

    watch nmcli d wifi

For something fancier:

    sudo apt-get install linssid

Yeah, I know about WiFi scanners for Android and iPhone.  In this case, I don't actually need to know the WiFi signals -- I need to know how well my **Linux system's WiFi card sees** the signals.
