---
categories: []
layout: post
title: Plantronics Savi W440 Savi W440 Wireless Headset
created: 1484166201
redirect_from: /content/plantronics-savi-w440-savi-w440-wireless-headset
---
The Plantronics Savi W440 Savi W440 Wireless Headset is the worst headset for PC-based VOIP... except for all the others, which are worse.

I really want a comfortable, high audio quality, long-range, wireless headset for use with VOIP on my laptop.  I need to be able to roam the floor, to visit the break room, etc.  I'm often on the phone all day and I can't stay at my PC.

I was very happy with my Plantronics CS50 headset, but then my employer stopped putting real telephones in cubes, so I have to move to VOIP or use my cell.  I need wired-qualiity audio.  I work with people from around the world and some of them don't articulate very clearly.  Using cell is not an option because it adds just enough fuzz to the audio that I can't always understand what someone from another culture is saying.

The W440 has less range than the CS50, a cheaper-feeling build, it is less comfortable, it is less securely fitting, the mute button is twitchy, and the volume isn't as loud.

I hate this headset, but after spending about $500 on a variety of headsets, I'm going to make do with this one.

What does the blinking LED mean?

**Common LED values:**

* Solid red = headset not "subscribed"
* Flashing red = headset muted
* Flashing red+yellow = incoming call
* Flashing green = talk mode
* Solid green = headset "subscribed"; no activity

**Uncommon LED values:**

* Flashing green+red = adapter subscription
* Flashing green+yellow = adapter conference subscription
* Flashing yellow = on multi-headset conference call

**What does the white LED mean?**

* Blinking = charging
* Solid = fully charged

**VM Problems**

This is lovely.  I use a Vmware VM.  I don't want to use the headset with the VM.  In the VM settings, I have told it not to autoconnect USB devices.  I have not defined an autoconnect for the headset in the .vmx file.  This headset should not autoconnect to the VM.

When I start the VM, it connects to the headset.  Of course, this removes it from the host.  When I fire up Lync (Skype for Business), it doesn't see the headset and it routes audio through my laptop speakers.

The only work-around is to maunally tell VMplayer to disconnect the headset.  This restores its availability in the Windows host.  The problem appears to happen only when starting the VM, so disconnecting after the VM is running is a work-around.
