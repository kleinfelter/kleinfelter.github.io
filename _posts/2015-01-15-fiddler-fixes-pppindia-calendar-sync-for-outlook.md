---
categories: []
layout: post
title: Fiddler Fixes PPPIndia Calendar Sync for Outlook
created: 1421330093
redirect_from: /content/fiddler-fixes-pppindia-calendar-sync-outlook
---
I was helping someone set up PPPIndia's Calendar Sync for Outlook.  He was getting a check-your-proxy-settings error, but his proxy was set up correctly.  We also tried it without a proxy, after moving his PC to a location that would require no proxy.  Same error.

So we tried Fiddler, to see what was failing.  Calendar Sync worked without any problems.  Then we removed Fiddler.  It still worked!

Learnings (some of which may not apply to Calendar Sync):

* Fiddler buffers requests.  This can change the timing.  If the server has narrow time-out tolerances, Fiddler (or any other proxy) might fix this.
* Fiddler may be closing connections after queries.  If your client is exceeding the maximum-connections-per-client for your server, it can fix this.
* The Calendar Sync "proxy" problem shows up before you've picked (and saved) your Google calendar in Calendar Sync setup.  Once you've picked your calendar, it seems to be able to work properly.
    * So if you get this problem: Tell Calendar Sync to use your system proxy, run Fiddler, tell Calendar Sync to login to Google, pick your Google calendar in Calendar Sync, save your setup, set your proxy the way you really want it, quit Fiddler and Calendar Sync, restart Calendar Sync, and you should be good to go.
    * This worked for me TWICE.
    * This is only relevant for the portable version of Calendar Sync (as of January 2015) because the installed version does not support the use of a proxy server (and Fiddler is a proxy server).
