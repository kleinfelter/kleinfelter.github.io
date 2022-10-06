---
categories: []
layout: post
title: PKB, Word, Textedit, Markdown, nvalt and File Portability
created: 1490223207
redirect_from: /content/pkb-word-textedit-markdown-nvalt-and-file-portability
---
I [left Evernote](/content/leaving-evernote).  As a result, I'm re-thinking my Personal Knowledge Base (PKB) a.k.a. Personal Knowledge Management (PKM).

As givens, I use a Mac, I share data with my Windows-using wife, and I want to be able to read my documents for the next 50 years.  I need:

* A document format which works on Windows and OS X (or has a high-fidelity, low-effort conversion).
* It works for, "Hey Susan! Take a look at this," and then email the document or a link.
* Works for text and images. (See "Take a look at this.")
* Not a lot of fuss and complexity.  My personal technology environment is so complex that it sometimes dominates my free time to keep things running.
* Fast data capture.
* Attractive output with good formatting (rich text).

There are different kinds of documents:

* Published documents.  I don't modify these.  e.g. Bank statements, utility bills, user guides, etc.  In the physical world, these are things I would store in a file cabinet or a bookcase.  These don't change.
* Personal documentation.  I modify these slowly, after initial creation.  e.g. "How to Set Up My Router", "What I Gave My Wife for Christmas", "How to Load Points to Google Maps From a CSV".
* Quick capture.  When I'm working on a project, I capture lots of snippets and what-I-tried.  This frequently results in me having dozens of TextEdit/Notepad files with a few sentences or fragments.  These *should be* short lifetime, but sometimes live for years.

I need Quick Capture and some Personal Documentation to be available quickly-to-immediately when I'm rebuilding my PC/Mac.

## Options and Problems

* Markdown: This is really for just **text**.  
    * Yes, you can write markup to display an image, but the image is stored separate from the Markdown file.  
    * You can store the image in a separate file or you can host it on a web site, but you can't store it in the file.  
    * This creates a problem for "Take a look at this" emails to my wife.  
    * It also breaks if I forget about the relationship between the image file and the text file and I move one but not the other.  
    * (Most of my text files really are just text, but when I have an image, I don't want the document to lose it.)
    * It works well for the "can read it in 50 years."  It renders well on Mac and Windows (if I don't lose the image).
    * Dialects of Markdown are a problem.  I can't really just pick "Markdown."  I have to pick a particular dialect.  (Tables aren't in core Gruber Markdown.) Then I have to pick Markdown tools for that variant which work on Windows and Mac.
    * Note: When I say "Markdown" I mean "Markdown without HTML."  I know you can switch to HTML in the middle of a Markdown document, but that loses the readability of raw Markdown and you have to start worrying about the evolution of HTML across 50 years.
* TextEdit/Wordpad and RTF.
    * Sounds good.  Fails in practice.  When you include an image in a TextEdit document, it flips from .rtf to .rtfd (at least with El Capitan's TextEdit).
    * .rtfd is NOT a file.  It is a folder which contains files.  The images are stored separately from the .rtf.  This makes delivery to Windows from Mac bothersome.
    * .rtdf is NOT readable on Windows.  Yes, you can view the .rtf file contained in the .rtfd folder, but the images are separate files and are not rendered when you view the .rtf.
    * You can't convert a .rtfd with images (and retain the images) with TextEdit, textutil, Pandoc, etc.  It is rumored that you can do so with Pages.
    * Use TextEdit and save everything as .webarchive?  Whoops!  Safari and TextEdit know .webarchive.  Other browsers speak .mhtml. This flunks the "Look at this" and the read-in-50 tests.
* TiddlyWiki is OK for some data.
    * It invites excess fiddling.
    * It fails for "Take a look at this" email.
    * It has similar image problems as Markdown.  Image files are stored separately from the wiki. You can embed a small amount of images but the wiki will load slowly if you get a lot of graphics.  They are stored in base-64.
    * It is 'iffy' on the read-in-50.  Yes, it is just HTML, but browsers and HTML evolve over time.  Try loading a 10 year-old web site you saved in HTML and see whether it renders perfectly.  Will JavaScript still be in the browser in 2065?  I doubt it.
    * It is great for being available right away, when I'm rebuilding my Mac/PC.
* nvalt is spiffy for Quick Capture, but it really only works if you write in Markdown or plain text, and you've got the separate image and the Markdown variant problems again.
* zim might be interesting, but I couldn't get it to run reliably on Mac with about 20 minutes of effort.  It is reported to work on Mac, but detailed install instructions which work on all OS X versions aren't available.
    * This link has steps for making the Windows version run in a Wine bottle, and someone says he got it to work with the brew version of python. https://bugs.launchpad.net/zim/+bug/1633812
    * Update: This one seems to work.  This link has steps for making it run in brew python as of 2015: http://reagle.org/joseph/zwiki/Archives/2015/Zim_on_Mac_OSX.html
    * zim uses plain text with markup.  It is different markup than Markdown, but similar in concept.
    * zim plusses: plain text files, support for images, Win/Mac/Linux/Cygwin.
    * zim minuses: tables are funky - use the table plugin, attach LibreOffice spreadsheet, or hand-code the LaTex for the table using the equation editor
* CherryTree is a popular alternative to zim, but it stores its DB in a single XML file or a sqlite DB.  I want my separate notes in separate files, so plain-old Spotlight search can find them.
* Just store everything in .doc or .docx.
    * That's a pretty damn complex file format.  I'm not sure it passes the read-it-in-50 criterion.
    * I don't have Word on my Mac.  
        * I could use LibreOffice.  LibreOffice launches so slowly that I'll start stashing things elsewhere when I'm in a hurry working on a project.  It isn't there early in the OS rebuild process.
        * I could install Office for Mac.  I really hate the whole activation thing.  "Hello Microsoft.  May I please run the software I purchased 10 years ago?"  Sure.  $150 too.
        * I could run Office in a Windows VM.  (I do, actually.) If I leave VMware Fusion running when I hibernate my Mac, it creates an intermittent wake-from-sleep failure.  Microsoft product activation is a problem here too. $150 (plus Windows) too.
* Google Docs?  I left Evernote because I don't trust my confidential data to cloud providers.  Not all of my data is confidential, but keeping track of which is which and which is where is friction.
* ODF/ODT instead of .doc?  Well, it isn't proprietary, but I still would have the LibreOffice issues or the issues of cost and product activation with Word.
* Maybe I'll create all my documents using LaTex.  (Snark.)

Sheesh!  I begin to understand why RFCs are issued in *plain* plain text.

The big thing I miss, if I use discrete files (whether plain or rich text) is hyperlinking from idea to idea (document to document).  That's something which a wiki (including TiddlyWiki) or Evernote/OneNote give me.

Pointers:

* [This is a good document](http://www.unmanned.aero/news/2013/11/28/markdown-in-aerospace) on document lifetime.  Good perspective.  They seem to prefer the MultiMarkdown dialect.
* I could use [Archivematica](https://wiki.archivematica.org/index.php?title=Main_Page) to address long-term document readability.  Archivematica's media-type preservation plans convert .doc, .rtf, and other word processing files to Open Document Format (ODF) for preservation and to Adobe's PDF for viewing. It fails the simplicity test.  It would complicate my technology platform.

