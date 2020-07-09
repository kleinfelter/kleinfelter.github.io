---
excerpt: "I thought I'd take a look at Chandler for GTD.&nbsp; I downloaded and installed
  Chandler_win_1.0-rc1.exe.&nbsp; That was the easy part.&nbsp; Then I had to import
  my Outlook data.\r\n  \r\n  \r\n  <br />\r\n  <br />Chandler can import .ics files
  (only). In case you're unaware, Outlook 2003 can export a .ics file, but it\r\nexports
  one per event.&nbsp; This doesn't work for my 1000+ events.\r\n  \r\n  \r\n  <br
  />\r\n  "
categories: []
layout: post
title: Chandler PIM, iCalendar, and Outlook (Oh my!)
created: 1217871505
---
I thought I'd take a look at Chandler for GTD.&nbsp; I downloaded and installed Chandler_win_1.0-rc1.exe.&nbsp; That was the easy part.&nbsp; Then I had to import my Outlook data.
  
  
  <br />
  <br />Chandler can import .ics files (only). In case you're unaware, Outlook 2003 can export a .ics file, but it
exports one per event.&nbsp; This doesn't work for my 1000+ events.
  
  
  <br />
  <br />I tried outlook2icalv1.04.zip from SourceForge (plus others, that either did a worse job, or would only export a SMALL number of events).&nbsp; When I imported the file it created, Chandler threw the following error:

  
  <pre>  File "C:\Program Files\Chandler1.0-rc1\release\bin\lib\site-packages\dateutil\rrule.py", line 948, in _handle_BYWEEKDAY
    n = wday[:i] or None
exceptions.UnboundLocalError: local variable 'i' referenced before assignment­
</pre>
  <br />Since I know just a bit of Python
  I edited &quot;C:\Program Files\Chandler1.0-rc1\release\bin\lib\site-packages\dateutil\rrule.py&quot; and inserted at line 945:

  <pre>    i = 0
</pre>I'm guessing that under some conditions, the i isn't defined upon exit from the loop, so I moved its scope to be outside the loop.
  <br />I had to delete the corresponding .pyo file in order to force the recompile.
  <br />
  <br />This still wasn't enough to let Chandler import my .ics file, so I edited my .ics file and mass-replaced &quot;INTERVAL=0&quot; with &quot;INTERVAL=1&quot;.&nbsp; This is a bug in outlook2icalv1.04.zip.&nbsp; INTERVAL must be a positive integer, and, as some of us learned in the 3rd grade, &quot;positive&quot; is not the same as &quot;non-negative,&quot; because zero is neither negative or positive.
  <br />
  <br />And it was also necessary to mass-replace (regular expression) &quot;;BYDAY=$&quot; ($ means EOL) with nothing.&nbsp; outlook2icalv1.04.zip outputs BYDAY=(nothing) when it shouldn't output BYDAY at all.
  <br />
  <br />Then I realized that none of this debugging was going to import my Outlook Tasks, because outlook2icalv1.04.zip only exports appointments.&nbsp; I could have modified outlook2icalv1.04.zip, since it is just VBA imported into Outlook, but I had to get some things done (i.e. work).
  <br />
  <br />New personal rule -- PIM data goes in Outlook.&nbsp; No synchronizing with Outlook.&nbsp; No export from Outlook.&nbsp; No add-ins to Outlook that make my data unusable in a plain-old-Outlook.&nbsp; (I am open to using add-ins that store all their data in Outlook Appointments or Tasks -- just not add-ins that store data that doesn't show up in Outlook when I open my PST from another computer.)&nbsp; 
  <br />
  <br />Outlook is the data store for my PIM data.&nbsp; The counting of the Holy Hand Grenade shall be Outlook -- not 2, nor 4. 
  <br />
