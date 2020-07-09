---
excerpt: "Evernote is one of those products that I simultaneously love and hate.  With
  their 3.5 version for Windows, it started taking 90 seconds to start -- sometimes.
  \ Evernote's forums and their blog comments indicate that this is at least somewhat
  common.\r\n\r\nAfter some investigation, I realized that it was slow to start only
  when my laptop was connected to a company LAN; elsewhere it took about 5 seconds.
  \ The problem does not occur with version 3.1.\r\n\r"
categories: []
layout: post
title: Evernote Slow Start - Work-around
created: 1271422364
---
Evernote is one of those products that I simultaneously love and hate.  With their 3.5 version for Windows, it started taking 90 seconds to start -- sometimes.  Evernote's forums and their blog comments indicate that this is at least somewhat common.

After some investigation, I realized that it was slow to start only when my laptop was connected to a company LAN; elsewhere it took about 5 seconds.  The problem does not occur with version 3.1.

I checked the Evernote log, and the 90 seconds is getting spent BEFORE the log file is opened.  With 3.5, they started using .Net.  My theory is that there's something about their use of .Net that is causing it to attempt a network operation, and it has to wait for the operation to time out.

As a work-around, I created start-evernote.cmd, containing:
<pre>
ipconfig /release
start evernote.exe
sleep 5
ipconfig /renew
</pre>
(This assumes that you have a program named "sleep.exe" that will pause for the indicated number of seconds.)

Now I've got about a 10 second start-up.

The down-side of this approach is that it briefly turns off the network.  Typically, this isn't too bad, but when I'm using a VPN I have to go through the whole VPN password/connect sequence.  It also doesn't help with enscript.exe (which turns around and runs evernote.exe WITHOUT dropping/raising the network connection).
