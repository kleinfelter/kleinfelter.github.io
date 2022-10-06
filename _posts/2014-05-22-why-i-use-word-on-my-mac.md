---
categories: []
layout: post
title: Why I Use Word On My Mac
created: 1400804055
redirect_from: /content/why-i-use-word-my-mac
---
I like the Mac's elegance.  I like the elegance of Apple's programs.  But I use the "bloatware" of Microsoft Office -- by choice.

You often hear that 90% of Word's features go unused.  Well I'm here to tell you about one of those obscure features that drives me to use Word, despite owning a Mac and Pages: Paste Link.

I've got a library of trip plans.  Every trip plan has some common boilerplate text, some text that is unique to the trip, and a schedule (in a table).  Boilerplate, unique content, and a spreadsheet.

From time to time, I come up with a change that I want to apply to the boilerplate text -- in all the documents.  I do not want to edit 200 documents and make the same change in each document.

I need the ability to store the boilerplate in a single location and to embed it in each trip plan at the appropriate point.  (C programmers would recognize this as "#include".)

I can't do includes in Pages.  I can do includes with Markdown, if I use Marked for rendering.  (There are other Markdown tools that handle includes.)

But Markdown (and HTML) can't handle spreadsheets.  My schedule is a real spreadsheet.  I have a column of durations and a column of times.  I enter the start time, and all of the rest of the times are calculated, by adding the prior row's duration and time.

With Word, I can embed the schedule as an Excel spreadsheet, and I can use Paste/Special/Paste Link to paste a reference to text from another document.  I have one document with all of my boilerplate in it.  Then, as I create my plan documents, I can copy bits of boilerplate from the boilerplate document, and I paste-link them into the plan document.

The only document tool I can find that supports this is Word.  Not Pages; not Google Docs; not Markdown.  (OK.  I admit that OpenOffice and LibreOffice can maybe do this.  They are kinda clunky on the Mac. LibreOffice 4.2.4.2 gave me spinning beach ball and crashed twice in about 10 minutes of light use.  OpenOffice 4.1.0 crashed once, and it failed to properly render the paste-linked text.)
