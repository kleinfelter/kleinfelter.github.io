---
categories: []
layout: post
title: Mouse Wakes Windows 7 Even Though Allow this device to wake up the PC is Unchecked
created: 1442431943
redirect_from: /content/mouse-wakes-windows-7-even-though-allow-device-wake-pc-unchecked
---
I have a computer that wakes from sleep when the mouse gets jiggled.  The mouse is so sensitive that it gets jiggled when someone walks across the floor.

I went into Device Manager and I cleared the checkbox for "Allow this device to wake up the PC" on the mouse device, and that didn't help.

It is a Logitech wireless mouse, and it added a second keyboard device, in addition to the "HID-compliant mouse" device.  You have to disable wake for both the mouse device and the faux-keyboard device.  

I didn't want to disable wake-from-sleep on the real keyboard, so I unplugged the real keyboard, then I disabled wake-from-sleep on the remaining "keyboard" and the mouse.  Then I plugged the real keyboard back in.

Problem solved.
