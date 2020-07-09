---
categories: []
layout: post
title: Set up Edimax AC600 WiFi Dongle to Auto-connect to VMware Guest on a Windows
  Host
created: 1449236940
redirect_from: /content/set-edimax-ac600-wifi-dongle-auto-connect-vmware-guest-windows-host
---
Automatically connect EDIMAX AC 600 USB WiFi to VMware Player guest:

Do this with VMware shut down!

* Plug in the device when the VM is not running.
* Confirm that the device shows up in Device Manager as "Edimax AC600 Wireless LAN USB Adapter"
* Search within HKLM\System\CurrentControlSet for "Edimax AC600 Wireless LAN USB Adapter"
    * You will find an entry with DriverDesc = this value.  Check that entry and you should find multiple values that contain "vid_7392&pid_a812".  This is the VID and PID for your device.
* Edit the .vmx file for your VM.
    * Check for other usb.autoConnect entries.   If they exist, increment "device0" to a higher number than zero in the following instruction.
    * Add a row with the vid and pid values, separated by a colon, with each one prefixed by "0x":
        * usb.autoConnect.device0 = "0x7392:0xa812"
