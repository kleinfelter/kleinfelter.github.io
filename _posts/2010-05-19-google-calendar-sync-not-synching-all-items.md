---
excerpt: "I had trouble with Google Calendar Sync (GCS) deleting some of my Outlook
  calendar items when I set it up for 2-way synch between Outlook and Google.  Then
  I dialed it back to 1-way sync, and found that some Outlook items weren't getting
  copied to Google.  Bummer.\r\n\r\nI looked in \"C:\\Documents and Settings\\kk4056\\local
  settings\\application data\\google\\Google Calendar Sync\\logs\" and found the error
  message:\r\n<pre>\r\nParticipant is neither attendee nor organizer\r\n</pre>\r"
categories: []
layout: post
title: Google Calendar Sync Not Synching All Items
created: 1274308778
---
I had trouble with Google Calendar Sync (GCS) deleting some of my Outlook calendar items when I set it up for 2-way synch between Outlook and Google.  Then I dialed it back to 1-way sync, and found that some Outlook items weren't getting copied to Google.  Bummer.

I looked in "C:\Documents and Settings\kk4056\local settings\application data\google\Google Calendar Sync\logs" and found the error message:
<pre>
Participant is neither attendee nor organizer
</pre>
Well excuuuuuse me!  For some reason, if Google doesn't see your email address in the invitation (perhaps you were a BCC?), it refuses to add what it considers to be someone else's appointment to your calendar.

In my case, my Exchange ID was something like k12345@example.com.  I went to GMail, and told it that I sometimes send email as k12345@example.com, and now it believes that appointments for k12345@example.com are appointments for me.
