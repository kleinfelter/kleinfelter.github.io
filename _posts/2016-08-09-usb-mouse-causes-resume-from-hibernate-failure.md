---
categories: []
layout: post
title: USB Mouse Causes Resume From Hibernate Failure
created: 1470768822
redirect_from: /content/usb-mouse-causes-resume-hibernate-failure
---
Windows 7, Dell Precision 7510 - When I resumed from hibernate, it would show the "Resuming" splash screen, then the video went dark, and it locked up.  The problem did not occur on resume-from-sleep.  The problem only occurred when the laptop was docked.

It turned out to be a USB mouse, plugged into the docking station, which was causing the problem.

I tried tweaking BIOS settings for USB, and boot options, but that didn't fix it.  I tried two different mice (same manufacturer, same model) and it happened with both.  I tried running the mouse through a USB hub and that didn't help.  I tried a USB2 and a USB3 hub with the same results.  The problem also occurs when the mouse is connected to the laptop directly (i.e. not via the dock).

The only solution is to not connect the mouse until AFTER the login (re-enter previously logged on session) screen appears.

**Important Recovery Note**: When you run into the problem, your resume is NOT lost.  Unplug the mouse, power off (via the power button), power on, and when Windows asks, tell it to try the resume again.
