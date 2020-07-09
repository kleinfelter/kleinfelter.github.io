---
title: Microsoft Office Apps - Tick, Tick, Tick
---

For no apparent reason, most of my Office 365 apps started ticking about once per second.  Tick, tick, tick.  The ticking would stop several seconds to minutes after I exited the app.  It happened even when I launched the apps in "safe mode."  It affected Word, Excel, Access, and Powerpoint, but not Outlook.  (I didn't try Publisher or the other, lesser Office apps.)

I went into Control Panel and set the Windows sound scheme to "No Sounds" and the sound went away.  So I drilled down to the "Windows Explorer" grouping and discovered that I could just disable the "Start Navigation" sound, and that silenced it.

That led me to run Fiddler to see what the navigation was.  It was loading some Microsoft authentication URLs, over and over.

That led me to notice my name on the Office (Word, Excel, Powerpoint, Access) title bar.  Office 365 wants you to be logged in to Office.  There was an exclamation point next to my name, indicating some sort of error.  I logged out of my Office 365 account and back in.  The exclamation point was still there, but clicking it gave me a complaint about the status of my account (which disappeared too quickly for me to capture it).

Eventually I clicked on a message about re-authenticating.  That displayed a blank dialog, which eventually loaded and told me I was re-logged in.  THAT cleared the exclamation point.  A few seconds later, the ticking (and URL loading) stopped.

So tick, tick, tick from Office apps is telling you that you're not successfully logged into Office 365.  Microsoft says you have to login to Office 365, even if all you wanted to do was to view a Powerpoint.