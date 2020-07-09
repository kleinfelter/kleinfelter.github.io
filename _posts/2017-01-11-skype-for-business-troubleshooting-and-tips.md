---
categories: []
layout: post
title: Skype for Business Troubleshooting and Tips
created: 1484148547
redirect_from: /content/skype-business-troubleshooting-and-tips
---
We're transitioning from dedicated phone handsets to PC-based telephony at work.  i.e. We are taking away desk phones and telling people to use Skype for Business (SFB) on their laptops.  We block ordinary Skype, so our users must use SFB (a.k.a. Microsoft Lync).

Here are some observations from the user perspective, following from that experience.

*   There is no PC headset that's as good as the Plantronics CS50 (which only works with real telephones).  
    * If you need to be able to roam your floor, walk around corners, etc., you aren't going to find anything with the same range.  The closest I found was the Plantronics Savi.  It is flimsy, it doesn't fit as well, the range isn't as good, and the controls aren't as easy to use.
* Talk to your SFB administrators and get access to the POTS system via SFB.  In our culture, they call it a "DID" (Direct Inward Dial) number.
    * My DID was behaving poorly.  It turns out they re-allocated my number to someone else, without telling me, because why not?
* SFB was telling me "We didn't find an audio device, which you need for calling".  It started off as just being mute, but then it added the message after I restarted it.  Shucks.  
    * I have two audio output devices and two microphones.  
    * I could right-click on the speaker icon in the tray and confirm that my laptop speakers and microphone were the default audio devices (input and output) and that my wireless headset was set up as the default communication devices.
    * I resolved the issue by restarting the "audio endpoint builder" service via Control Panel's "Administrative Tools" icon.


