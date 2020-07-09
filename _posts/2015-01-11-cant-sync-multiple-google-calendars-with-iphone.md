---
categories: []
layout: post
title: Can't Sync Multiple Google Calendars With iPhone
created: 1421016161
redirect_from: /content/cant-sync-multiple-google-calendars-iphone
---
I have multiple calendars with Google Calendar.  There's doc that tells how to choose which of these calendars synchs with your iPhone via https://www.google.com/calendar/iphoneselect.  But it didn't work!  After going to the web page and selecting multiple calendars, my iPhone saw only a single calendar -- the original calendar.

It turns out that I had set up my iPhone to synch via Exchange protocol.  Exchange supports only a single calendar.  I had to tell it to synch via Gmail protocol (which is really CalDav).  

But... GMail/CalDav won't synch Contacts.  So I have an Exchange account and a Gmail account set up for sync, and Contacts uses Exchange and Calendar uses Gmail.

I'll have to be really careful not to accidentally enable Calendar sync via both methods.  No telling what damage that would do.
