---
categories: []
layout: post
title: Write Raspbian to SD Card from Mac
created: 1486341520
redirect_from: /content/write-raspbian-sd-card-mac
---
* Run:

        diskutil list

* Review the output. Identify the device for your SD. On mine, it was "disk2".  Substitute 2 (or your digit) for # below.
* Run: 

        diskutil unmountDisk /dev/disk#

* Run (this takes a few minutes): 

        sudo dd bs=1m if=2017-01-11-raspbian-jessie-lite.img of=/dev/rdisk#

* Create a "ssh" file on the SD card to enable ssh on first boot and un-mount the SD card:

        > /Volumes/boot/ssh
        sudo diskutil eject /dev/rdisk#

-----

[Return to Basic Raspberry Pi Setup](/content/basic-raspberry-pi-setup-installing-raspbian)
