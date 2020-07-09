---
title: I Want My Data Protected From Device Failure and Provider Failure, Securely
layout: post
created: 1407287708
redirect_from: "/content/i-want-my-data-proteced-device-failure-and-provider-failure-securely"
---

My laptop failed recently.  I had a backup.  The backup was good, but I still couldn't get to my data for about 3 weeks.  First, there was the week while my laptop was sorta failing and I was figuring out that it was a hardware problem and not a software problem.  Then there was the week while it got shipped to be repaired.  Then there was a day while it got repaired.  Finally, there was the 5 days for it to get shipped back.

During all of that time, my backup was comforting, but otherwise useless, because I had no practical way to access it.  I certainly wasn't going to buy a new laptop for 2-3 weeks.  I had no way to access my backed up data, except to restore it somewhere.  The only other computers I had access to were my employer's laptop (where I'm not going to put personal files) or my Linux file server (which runs in text mode).

I want to be able to *use* my data from any computer.  That sounds like a cloud solution... maybe Google Docs or Office Online for word processing and spreadsheets.  But Google has demonstrated that it sometimes drops products, and they are not unique.  If my data is only usable in the cloud, there's a risk of losing access to it.  At a minimum, I can't get to it when my Internet connection is down (and that does still happen).  A pure cloud solution is no good to me; I want cloud *and* local access to my data.

Oh, and not everything is a word processor or spreadsheet document.  I have important GPS data and Quicken data.

I thought about putting everything in Google Drive (or the Microsoft equivalent, OneDrive).  You can even edit .docx and .xlsx files via Google Docs now, if you have the right Chrome extension.  I tried it.  Don't.  For non-trivial Word documents, making a minor edit via Google Docs can really mess up the formatting.  Think of Google Docs as a useful way to view/print Word docs when you can't use Word, but for heaven's sake, don't try and edit them.

Google Drive / OneDrive aren't going to let me use my GPS data or my Quicken file.  Worse than that, the data is not stored encrypted.  I'm not putting my medical or financial documents on an unencrypted service.  I'm only marginally willing to trust them to Evernote, and Evernote takes data security pretty seriously.  I've confirmed that I can export my data out of Evernote, even when offline, so I'm not trapped in Evernote if they go out of business.

Here's what I think I'm going to do.  

* I'll store static documents as PDFs in Evernote (my file cabinet).  For simple, linear 'live' documents, those will go in Evernote notes.  i.e. Things I could do in Markdown, I'll do in Evernote's editor, which stores them as HTML.  
* Evernote is no good for documents where presentation is important (such as my info-dense SOTA activator crib sheets).  Those still go in .docx files.  Spreadsheets go in .xls files.  Although Microsoft Office formats are not really a standard, everybody who is anybody can import them, so I'm not trapped in them when MS stops activating my old version of Office.
* I'll set up a shared folder on my NAS and use Unison to sync my laptop to my NAS.  If I lose access to my laptop, I'll boot a Linux live CD on a borrowed laptop, and access my files on the NAS.  When my real laptop gets repaired or replaced, I'll Unison them back.  The thing that Unison buys me that backup doesn't, is that I can update the files while they are not available on my laptop.
* I'll continue to use CrashPlan for backup.  If the house burns down, I'll have to buy a new laptop quick and restore my files.
* I want to stay with standard file formats (or defacto standards, such as .docx), because they give me maximum options across Linux/Windows/Mac for my plan-B access.  (See also [http://kleinfelter.com/content/why-i-do-not-use-pages-mac](/content/why-i-do-not-use-pages-mac).)
* When I'm in Plan-B mode, I won't have access to my Quicken or my GPS data, although I could install Quicken on my wife's laptop and use that to update the Quicken data on the NAS.  (Or, I could Unison the data to her laptop and Unison it back.)

It isn't a perfect plan, but it is an incremental improvement over my current state.