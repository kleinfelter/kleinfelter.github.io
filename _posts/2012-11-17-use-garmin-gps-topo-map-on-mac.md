---
categories: []
layout: post
title: Use Garmin GPS Topo Map on Mac
created: 1353186652
redirect_from: /content/use-garmin-gps-topo-map-mac
---
I bought a Garmin eTrex 30 GPS, bundled with Garmin topo maps.  I expected the bundled maps to come on a CD/DVD.  To my surprise, they were on a micro SD card, tucked inside an SD Card adapter.

I want to use the maps on my computer via Garmin BaseCamp and on my GPS.  Garmin's idea is that you'll insert the micro SD into your GPS, and tether your GPS to your computer.  I want to use the topo my Mac, even when it isn't tethered.

1. Create a 3.5 GB, FAT32 disk image, using Disk Utility.  I named mine Garmin-Topo-for-Mac.dmg and the partition was named GARMIN_IMG.
2. Copy the Garmin directory from the SD Card into GARMIN_IMG.
3. Un-mount GARMIN_IMG.
4. Start BaseCamp.
5. Open Garmin-Topo-for-Mac.dmg, mounting GARMIN_IMG.
6. The map *should* appear in BaseCamp.  If it doesn't, there are actually a couple of things I did beforehand, while tinkering.  Some might be important.
    1. I formatted a USB flash drive FAT32
    1. Copy the Garmin directory to the USB drive.
    1. Unmount and remove the USB drive.
    1. Start BaseCamp.
    1. Insert the USB drive.
    1. Wait.  Wait. Wait.  Lotsa LED flashing on the USB drive, while BaseCamp loaded the entire map.
