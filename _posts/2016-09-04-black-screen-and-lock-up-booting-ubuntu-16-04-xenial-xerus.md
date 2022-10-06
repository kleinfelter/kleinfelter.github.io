---
categories: []
layout: post
title: Black Screen and Lock-up Booting Ubuntu 16.04 Xenial Xerus
created: 1473000682
redirect_from: /content/black-screen-and-lock-booting-ubuntu-1604-xenial-xerus
---
At some point, I started having trouble getting the Black Screen and Lock-up Booting Ubuntu 16.04 Xenial Xerus GUI to boot if there was no monitor attached.  Then it seemed to start happening even if I had a monitor attached. I'd get a black, text-mode screen with a cursor blinking in the upper-left corner and nothing else. This fixed my black-screen-mid-boot problem:

* sudo vi /etc/default/grub
* Adding "vmalloc=256MB video=LVDS-1:d" to the GRUB_CMDLINE_LINUX_DEFAULT
* sudo update-grub
