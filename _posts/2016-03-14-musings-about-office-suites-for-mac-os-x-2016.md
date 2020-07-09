---
categories: []
layout: post
title: Musings About Office Suites for Mac OS X - 2016
created: 1458001762
redirect_from: /content/musings-about-office-suites-mac-os-x-2016
---
I started running el Capitan in a separate partition, to see if it is ready for me to upgrade from Yosemite.  Since this is a leisurely upgrade, I'm carefully considering which software to put on it.

I looked at being done with Windows in a VM.  I can't do that because there really is nothing comparable to Quicken for Windows if you're a comprehensive user.  (If you just want a checkbook register, there are plenty of alternatives.)  So I'm going to have Windows.

What to use for an office suite?  I have a million Word files, a bunch of spreadsheets (one with epic VBA), a few PowerPoints, and a critical MS Access database with lots of VBA.

* I could use iWork.  Whoops.  They quickly drop support for old formats.  I don't want to have to update all of my office documents every time (or every other time) iWork comes out with a new version.  I have some pretty serious VBA I'd have to convert, too.  There's nothing comparable to MS Access.
* I could use Office 2013 for Windows.  I own a copy of that.  It does Office compatibility well.  ;-)  But... I'd like to use VirtualBox for my VM, and you can't click on a .doc file in Mac and have it open in Windows Word with VirtualBox.  (You have to go to windows, browse to it with File Manager, and open it from Windows.  Eeeew!)  If I use Windows Office, I have to upgrade Fusion or Parallels.  If I could get everything out of Windows except Access and Quicken, I could still use VirtualBox, because I could live with opening those two apps without click-in-Mac-open-in-Windows.
* I could use Office 2016 for Mac.  It doesn't have Access.  The VBA editor in Excel is abysmal, but it reportedly runs *most* VBA.  (I have lots of VBA.)
* I could use LibreOffice.  I have some pretty serious VBA I'd have to convert, too.  There's nothing comparable to MS Access.  (Don't tell me Base is comparable.  It is comparable, so long as you don't actually have a complex application.)
* I could use Google Documents.  Backing up Google Documents is a problem.  Yeah, I know, you don't back up a cloud app.  I do.  If a glitch/hack consumes all my files, I want to restore them.  I have some pretty serious VBA I'd have to convert, too.  There's nothing comparable to MS Access.  What if Google decides to lock out my account for some reason?
* I could migrate all of my Word documents to Markdown.  But there's still Excel and Access.  And I really want to control page layout better than you can with Markdown.  (This is important for printing cheat sheets and SOTA summit guides.)  I could migrate Word to a combo of Markdown and TeX.  But then I'd have to get serious about learning TeX.  And I've got work samples from old jobs and the like, and I don't want to convert them.  (Maybe I could convert them to PDF/A.)

With my Access and Quicken need, I'm going to continue to have to support Windows.  The big advantage to using something other than Windows Office is that I wouldn't have to always have that VM running.  Given my need for Quicken, I'm going to have to upgrade Windows periodically, because Quicken forces that.  I'm not going to the cloud without an offline backup comparable to what I get with CrashPlan.

I don't want to mess about with some obscure backup for Google Documents that backs them up to someone else's server.  I want a local copy.  I could go the Google Takeout route, and download a copy of my document periodically, but if I have to do one more manual backup I feel as if I'm going to explode.  (I already manually backup my to-do list and my passwords weekly, plus my employee laptop.)

OS X Preview does a pretty good job rendering most Word and Excel files.  It doesn't do VBA, of course, and it doesn't handle OLE (particularly document fragment embedding) or complex Excel calculations, but I could recover most Office content, if I had to.

I really like the way Evernote works.  When I set up a new machine, I install Evernote and then I have all that content on the new machine.  Very handy.

I really like Spotlight searching everything.  I don't want to have to go to Google to search for Word/Excel files because I don't want to have to know the document type in order to use the right search tool.

I think I'm going to have to use local files and let CrashPlan back them up.  LibreOffice, Office Mac, Office Windows, or Markdown+TeX?  Markdown+TeX won't cover spreadsheets.  Since I own a copy of Office, the only disadvantages are the complexity of having an active VM, upgrading VMware for el Capitan, and possible file obsolescence.  So I think the sensible thing to do us to use the Windows Office I have.  But... I hate the whole software activation thing.  MS could lock me out of my files if I get the activation key over-used.  They don't seem to decrement the use count when I un-install Office from an old machine.
