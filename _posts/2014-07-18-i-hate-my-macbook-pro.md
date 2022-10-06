---
categories: []
layout: post
title: I Hate My MacBook Pro
created: 1405704222
redirect_from: /content/i-hate-my-macbook-pro
---
I have an early 2011 MacBook Pro.  I'm one of the people who has been hit by the solder problem on the GPU [see https://discussions.apple.com/thread/4766577?start=480&tstart=0](https://discussions.apple.com/thread/4766577?start=480&tstart=0).  Of course, it happened a few months after my AppleCare expired, when my MacBook was just over 3 years old.  At this point, I can use my MacBook only if I never activate the discrete graphics chip.  If I activate the chip, the Mac crashes within a few minutes.

I could send it off to have it "[reballed](http://www.ps3specialist.com/macbook-pro-gpu-reballing-repair-service/)" for about $200.  That would be OK except I'd be out of service for about a week, and I have to deal with packing and shipping it, and it might get ruined.

For now, I'm trying to live with it. I'm really upset with Apple.  I expect a $2000+ computer to last much longer.  I'm considering moving back to Windows.  In the meantime, I have to get by with this laptop, so here's where I'll capture the tweaks to prevent use of the discrete graphics card.

This whole episode has left me feeling vulnerable to hardware failure.  It came at a very bad time.  If I were using a Windows PC, I'd be creating a P2V (physical to virtual) backup on a weekly basis, and I could pick up where I left off on any machine that runs VMware, by copying my VM there.  Can't do that with OS X.  I *like* OS X, but hardware failure has to be part of my planning since it just happened.

* Install gfxCardStatus 2.3 and set it to Integrated
* Edit each Parallels VM and configure it as follows (to prevent Parallels from overriding gfxCardStatus and setting Discrete mode)
    * Options/Optimization/Power = Longer Battery Life
    * Hardware/Video/3D Acceleration = Off
    * If you set 3D off, (Parallels says)[http://kb.parallels.com/en/9607] you need only 32MB  of video memory
* I have read that for both Parallels and Fusion, you need to force Integrated graphics before you start the app -- not just before you start a VM.  i.e. If you need to force Integrated, shut down ALL VMs, set gfxCardStatus to Integrated Only, then start Parallels or Fusion.

Update: See [MacBook Pro Video Repair Success](/content/macbook-pro-video-repair-success)
