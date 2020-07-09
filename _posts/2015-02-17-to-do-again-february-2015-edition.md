---
categories: []
layout: post
title: To-do Again (February 2015 Edition)
created: 1424208783
redirect_from: /content/do-again-february-2015-edition
---
I'm tweaking my task management system again.  I've been using [Nirvana](app.nirvanahq.com).  I got really good at capturing everything into it.  Then I got so much stuff in it that I just couldn't bear to look at it.

I thought to myself, "Self, you need more powerful tools.  So I wrote [an AppleScript](/content/convert-nirvana-omnifocus) to import my Nirvana data into [OmniFocus](https://www.omnigroup.com/omnifocus).  Then I realized that I still had too much 'stuff' in it, so I needed to get my fuzzy, non-committed stuff off my plate.  The canonical way to do that would be to dump my stuff into [OmniOutliner](http://www.omnigroup.com/omnioutliner).  Then I started thinking that this was getting to be entirely too complex

Maybe I could keep all my stuff in OmniFocus, and use two contexts: "@yes" and "@no".  "@yes" would be stuff I'm really going to do.  "@no" would be all the stuff that could have gone into OmniOutliner.  Since OmniFocus has filter-by-context and also a no-context context, I could ensure everything was tagged (contexed).

This just feels too complex.  If I explained it to my wife, she'd ask why I was making it so complicated.  How would I do task management without a computer?  I'd use a big notebook or index cards.  The problem with a notebook is that it is a chore to move a task from one page/section to another.  I also like the ability of an outliner to fold pieces of the outline, so I can focus on an area.

* I could use Circus Ponies Notebook.  There is still friction in moving lines around, but copy/paste is easier than re-writing pages.  Getting new items into Circus Ponies isn't something I can do from a command line, and that's important to me.  Bring-to-foreground doesn't happen.  They sync due dates to Calendar, but that's not what I'm looking for.  You can tell it to sync those with Calendar/Reminders, but you have to sync it and it doesn't change the presentation in Notebook.
* I can get things into Evernote or OmniFocus or OmniOutliner from a command line.  Evernote has outlines, but no folding; and Evernote's presentation leaves a lot to be desired.  Evernote is my file cabinet, not my notebook.  I'd never attempt to manage my tasks via a file cabinet.
* I think I need sub-projects/folders.  Projects have sub-projects in real life.  Maybe I could manage the sub-projects outside of my task manager?
* Some people like nvAlt.  It is a lovely piece of software.  It doesn't do outlining and it doesn't move things to the foreground at a future date.
* The thing I like about a real task manager (such as OmniFocus), is that I can tell it to move an item into the foreground at a future date.  That's important.

Simplicity.  Foldable outline.  Bring to foreground on a date (start date and deadline). Easy capture.  Sub-projects.  I don't think I can get all of these.

Work-arounds:

* I have a strong preference for simple, because complex just might not happen.
* Foldable outline: I have to have this, but I might not have to have it in my task manager.  I could just put tasks in my task manager, and keep projects and sub-projects in my project support repository.
* Start/Due dates: I could put these in the calendar.  I might have to shuffle tasks around in my task manager on the start/due date. This is bad because you might update the task but forget to update the calendar item.
* Easy capture: I could *capture* in a million different ways.  The issue is easily entry of the items into my task manager (or my stuff repository, if it isn't actionable yet).  Copy/paste is high friction.  Easy entry includes entry from my Mac and my PC.

Any way I go, I must have a good project support system and stuff repository, separate from the task manager.

* Notebook gets simplicity, outline, repository.  It misses on dates and easy entry.  You'll have to use the calendar for dates.
* OmniFocus misses on simplicity.  It has everything else if I use Notebook or OmniOutliner for project support.
* nvAlt gets simplicity, misses on outlines, misses on dates  (No, searching for a date tag doesn't suffice.), easy capture.  
* Evernote gets simplicity, misses outlines, gets dates (via reminders and shuffling the items), and easy capture.  But it has 10,000 other things in it.  Big cringe factor.

OK.  I'm going to have to use OmniFocus and hope that complexity fades with experience.  I can combine it with Evernote, OmniOutliner, Notebook, or even OneNote for project support.

Principle: Evernote is my filing cabinet (and for a few other items that I *must* have on all my platforms).  That leaves OO, Notebook or OneNote for project support.  If I need to put project support into the file cabinet at the end of a project, I can print to PDF and load the PDF to Evernote.  I don't like OneNote on the Mac because it uses solely cloud storage.  

OO or Notebook?  I like Notebook.  Really, I do.  But I keep thinking I've found a use for it and then I discover it doesn't really work for me.  My concern here is the lack of AppleScript or API support.  Without that, the data is locked up in Notebook.  I think I'm going to want scripts to shuffle stuff between my task manager and my project/stuff support system.

I could move stuff *from* Notebook to OF by selecting the item and using Alfred to cut it and paste it into the OF inbox.  Because my capture goes to the OF inbox, I'm going to need to move from OF into my support system.  Often.  That points to OO.

Ohmygosh.  I just discovered [nvremind](https://github.com/ttscoff/nvremind).  nvAlt can do dates, albeit somewhat roughly.  It still misses outlines.  Maybe combine nvAlt with Notebook?  No.  It is just too unstructured.  And I still couldn't move stuff into Notebook.

Wait.  Wait.  There *is* a way to move stuff into Notebook.  They call it a "clipping service."   Maybe I could use two clipping services -- one for uncommitted stuff and one for project support.  With OO, I could do something more refined (as in move from OF <project name> to OO <project name>).
