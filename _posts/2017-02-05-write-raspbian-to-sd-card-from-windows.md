---
categories: []
layout: post
title: Write Raspbian to SD Card from Windows
created: 1486341346
redirect_from: /content/write-raspbian-sd-card-windows
---
* Download [Win32DiskImager](https://sourceforge.net/projects/win32diskimager/) 
* Unzip it to Win32DiskImager.exe
* Right-click Win32DiskImager.exe and select *Run as Administrator*
* Select the image file you extracted (2017-01-11-raspbian-jessie-lite.img)
* Select the drive letter of the SD card in the device box.  Be careful!  You don't want to write to C:\
* Click *Write* and wait for it to finish
* Create an empty file named "ssh" in the \boot folder of the drive  (via right-click in Windows Explorer, create a .txt file, and rename it.)
* Right-click on the SD card drive in Windows Explorer and click Eject.

-----

[Return to Basic Raspberry Pi Setup](/content/basic-raspberry-pi-setup-installing-raspbian)
