---
categories: []
layout: post
title: Synchronizing Work with Google with IOS
created: 1420983416
redirect_from: /content/synchronizing-work-google-ios
---
Assorted notes:

* http://www.pppindia.com/calendar-sync/index.html - free version syncs 30 days; $10.  Has a "portable" edition.
    * I see a problem report: "Failed in 1 way sync O->G to delete a single event within recurring appointment"
    * A little "hacky" setting up recurring sync with OAuth.
    * Says it works through proxy, but it does not go through my work proxy nor my home proxy.  Sync is OK without a proxy.
        * I edited the config file and changed <defaultProxy enabled="true"> to <defaultProxy enabled="true" useDefaultCredentials="true"> and that didn't seem to help.
        * Then I turned on Fiddler to debug, and loaded my Google Calendars and chose the one I wanted successfully.  After that, Sync seems to run OK, even when Fiddler isn't running.
* http://www.fieldstonsoftware.com/software/gsyncit3/ - $20
* http://sourceforge.net/projects/googlesyncmod/ a.k.a. http://googlesyncmod.sourceforge.net/ - open source.
    * There is a time tolerance of 2 minutes to cope with time differences on Server and Client side, therefore please wait at least 2-5 minutes, before you Change an appointment, contact or note and resync afterwards
* CompanionLink says Sync Outlook calendar, contacts, notes, tasks, journal, and contact photos.  $50
    * Some Amazon users complain of duplicate events
    * They have been around since the days of Palm, so they have a successful business.
* https://outlookgooglecalendarsync.codeplex.com - open source.  Reportedly does not require admin.  One way (in either direction); NOT bidirectional and not both uni-directions at the same time.  Crashed on startup (I think this was because I had an open calendar reminder, blocking the Outlook GUI.  Or maybe I cured it by moving it to a directory with a short path.)

-- - - - - - -

* http://technology.s-sheth.com/publish-outlook-calendar-to-gcal  - one way, Outlook to Google, 90 days only.  Zero software to install on your work PC.
- - - - - - -
* Sync Reminders with Google Tasks: http://tasket.mobi/faq - free
* http://sync2.com/ - $40
* SyncMyCal - I own a copy of this.  32 and 64-bit support (separate download pages). Discontinued.
* http://www.gooout.net/index2.php  $40
    * Deal-killer: "Google Calendar is always the master calendar. It's only possible to delete or update items via Google calendar."
* EVO Collaborator for Outlook - $30.  I'm not certain this will work.  Google does CalDav.  This adds CalDav to Outlook.  It *should* work.
* http://www.bynari.net/products-page/product-category/bynari-webdav-collaborator/ - $30
