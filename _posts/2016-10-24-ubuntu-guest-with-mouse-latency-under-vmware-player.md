---
categories: []
layout: post
title: Ubuntu Guest With Mouse Latency Under VMware Player
created: 1477316833
redirect_from: /content/ubuntu-guest-mouse-latency-under-vmware-player
---
Mouse performance is poor when I'm running an Ubuntu 16.4 guest in a VMware Player VM.  The mouse periodically hangs for a second or two when I move it around the guest.  The latency is a major annoyance.

I found [this to be relevant](http://superuser.com/questions/694464/vmware-mouse-pointer-stops-for-a-sec-when-changing-focus-to-guest).

NumLock is indeed on in the VM and off in the host, and the mouse hangs at the edge of the VM window.  (The Num Lock keyboard LED does not light, but typing with the numeric keypad reveals the on/off discrepancy.)  Toggling Num Lock via the NumLock key within the VM fixes the latency.

My host boots with NumLock off, by default.

To disable Numlock-on-boot in the VM:

* Shut down the VM.
* Edit the .vmx file and add (after the config.version line):
    * bios.forceSetupOnce = "TRUE"
* Start the VM.  It will boot to the BIOS.
* Select "Keyboard Features" on the Main BIOS settings page
* Ensure it is OFF.  (It was already off for me, so UBUNTU was setting NumLock, not the BIOS.)  I cycled it through its values and re-saved the BIOS settings and rebooted.
* It came up with NumLock off.
* I shut down the VM, exited VMware, and re-launched the VM.
* It came up with NumLock off and no pauses.

It could be that re-saving the settings fixed it.  It could be something funky about having to toggle NumLock once per host boot, to get the state in synch.  I'll have to watch to see if it comes back when I reboot the host.

I've read that this has to do with Dell touch pads and the TouchGuard feature "thinking" that NumLock gets toggled when you enter/exit the VM.  TouchGuard thinks you just typed a key and so it pauses the touchpad to prevent touchpad actions while typing.  This matches the observed behavior -- it does not hang when using a non-touchpad mouse.




 
