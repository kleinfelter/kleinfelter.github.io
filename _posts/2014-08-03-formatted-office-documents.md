---
categories: []
layout: post
title: Formatted Office Documents
created: 1407086814
redirect_from: /content/formatted-office-documents
---
I recently had a hardware problem with my Mac.  Effectively, I was without a laptop for 3 weeks.  This has left me contemplating the fallibility of computers, and seeking a solution.

I'd like to be able to edit my files on one machine and, if it fails, just pick up at another machine where I left off.  I'd also like to have local, editable files, to protect me agains some online provider suddenly disappearing, and I'd like to be able to read these files in 50 years.  Tall order...

**Google Docs**: Seems like a nice idea, except that your local files aren't editable if Google Docs vanishes.  Yeah, I know about offline editing mode.  Per Google, "Drive stores at most 4,000 items or 5 GB of data offline."  I'd like access to all of my files if Google vanishes (or drops support for Docs).  Google Drive has great prices though.  Could use Office locally, and if you ever need to get to the online edition you can convert it to Docs format.  That's OK for read-only online access; you have to convert back to Office format or else you have 2 copies of the file.  Converting/read-only might work to bridge a period while your laptop is getting repaired.  As of June 25, 2014, Google claims, "both the web and mobile apps for Docs, Sheets, and Slides let you edit Office files—without conversion—so you can now edit and send back files in their original format."

I want to emphasize that .gdoc and .gsheet files in your Google Drive folder are just special URLs that point to your online document.  Your content is **not** safely backed up to your local computer.

**Office Online**: Very limited versions of Word/Excel/etc.  Can edit the files online/offline, if you have a local Office.  Fidelity when you mix edits between online/offline editions is poor unless you stick with the simplest features.

**iWork**: Only available when I have a Mac.  I do have a Mac, but if it fails, I'd like to be able to get to my documents via a web browser on a borrowed Windows PC.  But the deal-killer for iWork is that you can't open a 3-versions old edition of a file with the latest version of Pages/Numbers.  I don't want to have to convert all of my Pages/Numbers files, every time a new release comes out.

**Markdown**: You could manage all your files in Markdown and use Markdown viewers/editors.  You'll be able to read unformatted editions of those documents in 50 years.  But there are 11-teen versions of Markdown, and the original Markdown doesn't support tables (unless you jump to HTML).  Oh, and I regularly need tables that can do inter-cell calculations (e.g. like a spreadsheet). [Dillinger] (http://dillinger.io/) is interesting, in that you can use it to edit your Markdown files on Google Drive.

**HTML**: I could use a text editor or a GUI editor to edit HTML files.  That ought to be readable in 50 years.  But I regularly need tables that can do inter-cell calculations (e.g. like a spreadsheet).

**OpenOffice/LibreOffice**: Could edit locally.  Can't edit online unless you use Google Drive and you convert them to Docs format.  Could use xxxxOffice locally, and if you ever need to get to the online edition you can convert it to Docs format.  That's OK for read-only online access; you have to convert back to xxxxOffice format or else you have 2 copies of the file.  Converting/read-only might work to bridge a period while your laptop is getting repaired.

**Writing a Book**:If I decide to write a real book, I'll use offline Word and all of its features.  That's a special case.  99.999% of my documents will be only a few pages, and I'll optimize my planning for the most common case.

**Offline Office**: I really like OLE.  I want to have a master document, with reusable 'facts' in it, include those facts in multiple documents, and be able to have them all change when I change the source.  Only **Windows** Office offline supports this.  (Mac Office does not.  So far as I can tell, none of the online or offline office suites do this except for Windows Office.)  I think I'm going to have to live without this if I want pick-up-where-you-left-off on another computer.

**Conclusion**: OK, maybe my vision of seamless online/offline/multi-computer access to Office files isn't fully available in August 2014, as I write this.  What would be an incremental improvement on my current situation, taking into account my experience with hardware failure?  Although Word/Excel format isn't an official standard, almost every Office-type application can import most Word/Excel documents with pretty good fidelity.  I'm thinking I'll use offline Office to edit my Word/Excel files, sync with either Google Docs or Office Online, and treat the online edition as a viewer (mostly) or to make simple edits to a simple document, with import/export/convert as required.  I'm going to start with Google Drive and Office 2010 (offline).  
