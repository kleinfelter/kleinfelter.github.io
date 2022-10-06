---
categories: []
layout: post
title: Windows Not Hibernating / Windows Not Sleeping
created: 1474735596
redirect_from: /content/windows-not-hibernating-windows-not-sleeping
---
I have a Windows 10 computer that was failing to hibernate after inactivity and it was waking immediately after hibernating AND the mouse would wake it up, even though I'd told Device Manager that the mouse should NOT wake the computer.  It seems to behave better now.  Here are some changes I made and techniques I tried.

The mouse was waking the computer even though I disabled "Allow this device to wake the computer" in Device Manager for the mouse device.  It turns out that my mouse also thinks it is a keyboard.  I had two Keyboard devices listed.  Dis-allowing one of them prevented the keyboard from waking the computer (as expected).  Re-enabling that Keyboard and dis-allowing the other Keyboard prevented the MOUSE from waking the computer. 

* From an Administrator command prompt:
    * powercfg /lastwake
        * This is supposed to tell you why the computer last woke.  It might do that sometimes, but it didn't help in this case.
    * powercfg /requests
        * This is actually pretty helpful.  It tells you what programs are running RIGHT NOW that would prevent sleep.  I found that Google Chrome was playing a YouTube video in the background.  On this particular computer, I want it to sleep unless someone is actively using the mouse/keyboard.
    * powercfg /requestsoverride PROCESS chrome.exe AWAYMODE DISPLAY SYSTEM
        * This tells Windows to ignore chrome.exe, when deciding whether the computer is busy.
    * powercfg /requestsoverride PROCESS javaw.exe AWAYMODE DISPLAY SYSTEM
        * This tells Windows to ignore javaw.exe, when deciding whether the computer is busy.  This is what it takes to prevent Minecraft from preventing sleep.
    * powercfg /requestsoverride
        * This shows you what overrides you have previously created.
    * powercfg /requestsoverride PROCESS chrome.exe
        * This will REMOVE your override for chrome.exe

There's one more related item of interest.

* Create a registry key: HKLM\Software\Policies\Microsoft\Power\PowerSettings\A4B195F5-8225-47D8-8012-9D41369786E2
    * (Yes, use that number.  It isn't something that changes from PC to PC.)
* Create a DWORD ACSettingIndex
    * This applies to when running on AC power.  If you want it to apply when running on battery, use DCSettingIndex.
* Set the value to 0 to ignore applications when deciding whether busy.
* Set the value to 1 to respect applications when deciding whether busy.

If you set it one way and it doesn't work, you might try the other way.  I'm not certain that the doc doesn't have the values backwards.
