---
categories: []
layout: post
title: OneNote 2016 Quick Notes Is Empty and Shows Loading Please Wait
created: 1477594845
redirect_from: /content/onenote-2016-quick-notes-empty-and-shows-loading-please-wait
---
I upgraded from OneNote 2013 to 2016.  The "Quick Notes" pseudo-notebook (the Quick Notes icon at the bottom of the list of open notebooks) came up empty, showing "Loading... Please Wait" -- forever.  Bummer.

There's a bug in OneNote 2016.  The Quick Notes button must be connected to a folder in a *closed* notebook.   i.e. I have an open notebook with an "Unfiled Notes" folder.  I went into File >> Options >> Save & Backup and set my Quick Notes Section to this folder.  So long as this notebook remains open, the "Quick Notes" button at the bottom of the notebook list shows "Loading... Please Wait".

If I close the notebook, exit and restart One Note, then Quick Notes is populated.

Solution: Move your Quick Notes into their own notebook, and leave it closed -- or just ignore the Quick Notes pseudo-notebook, because your quick notes are saved in the folder you told it to use.
