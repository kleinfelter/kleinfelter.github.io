---
categories: []
layout: post
title: FoldingText Cheat Sheet
created: 1475965065
redirect_from: /content/foldingtext-cheat-sheet
---
My cheat sheet for using the Atom editor with the FoldingText package.  See official doc at https://jessegrosjean.gitbooks.io/foldingtext-for-atom-user-s-guide/content/editing.html

Must-do:

* Must choose File >> New Outline and save as .ftml, to create an outline.

How-to:

* Hyperlink: Cmd-Shift-K
* All sorts of formatting: Cmd-Shift-P "Outline Editor: Toggle"
* Edit tags: t (or Cmd-Shift-t in Text Mode)
* Fold all to a given level: Edit >> Folding
* Toggle fold: Cmd-period (or just period, if not in Text Mode)
* Toggle "complete" tag: Ctrl-space (or just Space, if not in Text Mode)
* Toggle priority: digits 1-9
* Indent: Tab
* Outdent: Shift-tab
* New line: Enter
* Fold: Click the triangle
* Unfold: Click the triangle
* Move: Drag the triangle (hold Option to copy instead of move). Hold Ctrl while *dropping* (not dragging) to copy a hyperlink back to the original. (Can link across files.)
* Enter Text Mode: press i or a or left/right arrow key or click where you want.
* Exit Text Mode: press Esc.
* Get full list of commands: Cmd-shift-P and type "outline editor"
* Focus on children: Cmd-Opt-Down
* Unfocus: Cmd-Opt-Up
* Filter by text: Cmd-F, then type string to match.  Search syntax is at https://jessegrosjean.gitbooks.io/foldingtext-for-atom-user-s-guide/content/appendix_a_search_syntax.html
* Filter by tag: Click on a tag or use Cmd-F and search for the tag text (e.g. #mytag)

Formatting:

* Command-B to bold text.
* Command-I to italicize text.
* Command-U to underline text.
* Command-Shift-K to insert and edit links.
* Control-C to clear text formatting.

Concepts:

* Text mode: When a line is selected, you can't change the text.  You enter "text mode" to get an i-beam cursor.
* Focus: Show me just the children of this row.
* Filter levels is funky.  This shows up most often if you put a "complete" status on a parent and filter for "not @status = complete", and it will show you the complete parent if a child is incomplete. 
