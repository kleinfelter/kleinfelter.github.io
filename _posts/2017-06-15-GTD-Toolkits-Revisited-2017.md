---
categories: []
layout: post
title: GTD Toolkits Revisited (2017)
---
### Motivation

I've been using [Nirvana](http://nirvanahq.com) for Getting Things Done (GTD) with some success, but it is falling down for me in two areas:

1. When my project count is high, moving items from Inbox to the project is cumbersome because you can't practically drag-and-drop to a project that's 35 rows off the page. (Right-click and move is a little more compact, but still cumbersome with 35+ projects.)
2. I want sub-projects.  (Not sub-tasks -- subprojects.)  I have large projects at work.  Those large projects have multiple deliverables.  I need to attach tasks to those deliverables.  Yes, I could set up each deliverable as a GTD project, but when I ask the question, "What can I do today to move along the top-level project?" separate GTD projects fails for the sub-projects.  Nirvana supports one level of sub-tasks, but you can only view those sub-tasks from the parent task.  (I think of Nirvana as having implemented "task steps.")
3. My Someday list is huge, and I'd like an outline for better managing/reviewing the things I'm not going to be doing this week.
4. If I'm going to add outlining, I'd like a *good* outliner, with support for folding/collapsing child nodes.

### Requirements

* Inbox, for dumping uncategorized items
* Segregation of tasks and projects
* Manual tagging as starred/today
* Work vs personal segregation
* Supports adding new items at *top* of list.  (When I add something, it is often urgent.)
* Fast response.  (Lag harshes my mellow.  This sugests but does not require that there be client-side code which is static, and it works with just *data* over the wire.)
* Mark item complete (and archive it forever)
* Throw item away
* Manually resequence tasks
* Ability to view the tasks at the Project level for the project, even if the project contains sub-projects.
* Some kind of export, in case my employer decides to block access to the web site and I have to leave it
  * Maybe: runs adequately on a kindle fire, so i could use that at at&t if blocked
* Offline capture and display of pre-synched data on Android phone.  (I'd really like it to work well offline, but this is a minimal subset.  I *do* spend time outside of cell coverage.)
* outline: checklists, project break-downs
* Easy move-to-area/project
* Filter for not-assigned-to-work-or-personal
* Identify errands
* Review open tasks by project
* Review just stared/today-tagged items
* Daily preview-review
* Completed item stays with project until move-to-archive (or forever).
* Works well on Mac, Windows, Android phone.  Synched data. Desktop apps would be nice, if they add something a site-specific-browser doesn't.
* HTTPS
* Outline folding.
* Outline formatting.
* Checklists (I prefer checkbox over strike-through.  I prefer roll-up completion tracking.  i.e. auto-complete the top-level if all children are marked complete.)
* Value commensurate with cost.
* Send to to-do via my command-line launcher (e.g. Alfred or Slickrun)
* Things which cannot be done by an outliner with full tagging:
  * Recurring tasks.
  * Tasks which are hidden until a future date. (e.g. Semi-annual car maint.)
  * Deadline (e.g. auto-urgent it on a date)





### Candidates

After some preliminary review, here are the candidates:

* Checkvist
* moo.do
* Nirvana+Workflowy
* Remember the Milk (RTM)+Workflowy

Checkvist and moo.do integrate an outliner and to-do.  I expect that integration will be more convenient for moving items between the outliner and the to-do list.  OTOH, part of my trouble is that Nirvana isn't giving me enough separation between the two.  From a skills perspective, I'd prefer one tool over two.



### Pre-filter

I selected the "Candidates" above via a cursory review of capabilities.  i.e. They provided to-do items and outlines.  After a little more investigation I came up with some strategic differences:

* Nirvana supports GTD natively.  It understands Inbox, tasks, and projects.  It isn't ever going to do sub-projects.
* Checkvist and RTM are general-purpose task-list managers, which can be tailored to GTD via tags, but you're really going to have to tag everything religiously, or else they fall apart for GTD.
* moo.do wants to integrate itself into my Google ecosystem.  I'm not certain I'm comfortable with that. GMail credentials is something I do *not* want compromised.  When I tried to access it via my employer's network, it spun forever at "Loading document."  I suspect that the browser is trying to access Google Drive, and the firewall is blocking that.

That leaves me with:

* Native GTD support, but no sub-projects: Nirvana+Workflowy
* DIY GTD, with sub-projects: Checkvist or RTM+Workflowy



RTM has all the DIY-ness of Checkvist, without bringing an outliner to the table.  When compared with Nirvana, it would add subprojects but the DIY-ness adds substantial "friction" to my process.  So that leaves me with:

* Nirvana+Workflowy - incremental change; need a sub-project hack; friction of moving between to-do and outline.
* Checkvist - revolutionary change; daily friction of non-native GTD; ease of moving between to-do and outline.


Alternatives:

* I could use Checkvist as my outline, and see whether I want to fully migrate to it.
* I could use Checkvist or Workflowy solely for list management, and move all date-related stuff into my calendar.  The gap here is that the only way to find what I want to work on today is to scan all the sub-list, but I already do that each day, to see what to star.
* Todoist+Workflowy.  Todoist isn't really going to work for me.  You can't control recurring appointments with precision; you can't indent an item from the keyboard in Chrome (because they re-use the Chrome next-tab keystroke).  I don't see anything like the Next or the Focus folders from Nirvana.  It gives you sub-projects but it doesn't do anything to make them useful.



### Random

* Workflowy supports OPML; Checkvist supports OPML;  Nirvana doesn't.  That's a barrier to easy info sharing.  To move between Workflowy and Nirvana is going to be item-by-item, open-item, copy-text, switch-tab, paste.  I don't see a good copy/paste path for Todoist either.
* There is no "not" in Checkvist tag search.  You can't search for items with neither #project nor #task.  Without KNOWING all items are either project or task, I'm going to worry about losing items.  (Items which I enter but do not get found by my project search or my task search.)  
  * I could keep projects and tasks in separate lists, or give up on sub-projects, and rely on tasks being at level 2 and projects at level 1.
  * I could trust my daily scan for star-this items to either identify un-tagged or to simply star items which I must deal with today.
  * Tag as #na items which are Next Actions and ready to act on.  Everything else is just for review anyhow.
* Workflowy *does* seem to have complete search with and/not/or.  They *say* they are working on due dates.



### Workflowy vs Checkvist

* Workflowy puts more lines on the page.  Denser spacing.

* Workflowy has a Zen-like simple appearance.

* Workflowy has a (beta) offline desktop app.  Checkvist has no desktop app.

* Both have OPML export.

* Checkvist has auto-backup to Dropbox.  Workflowy Pro has a "backup" but they say it is not in a user-readable form.   (Dunno if it is really non-readable.  It is "Pro" so I can't just look.)

* Neither has "Someday".  You have to create a separate Someday node in your outline.

* Workflowy has nice drag-and-drop (plus keyboard) item move; Checkvist's drag/drop is adequate but a little twitchy.

* Checkvist has a few things in Zapier.  Neither has anything useful in IFTTT.

* The big differences (for my use:)

  * **Checkvist has an API**.  Workflowy has limited [unofficial API which requires PHP](https://github.com/johansatge/workflowy-php), [unofficial Perl API](https://github.com/cotto/www-workflowy/), and  [unofficial Python API](https://github.com/kvch/wfw).
  * **Worflowy has complete tag search** - Checkvist can't do "not" and "or".  This is a big deal.
  * **Workflowy puts more lines on the page**.  Denser spacing.
  * **Checkvist** has right-click, move-to-another-list; Workflowy has only drag-and-drop or move by 1 row at a time (from keyboard).  Moving long distances (e.g. from Someday to active) is going to be a pain in Workflowy; I'll need to keep separate lists in Checkvist.  (Maybe I could write something using the API.)

* The big gaps for GTD use:

  * **Neither has anything like Nirvana's "Scheduled"**, which hides/defers the task until the scheduled date.

  * Checkvist has "due dates" but not starred/focus items, so due dates show up only in a due search.  **Workflowy has no due dates** but says they are working on them.

  * Upshot: If I'm going to use either for GTD, I'm going to need to invent some way long-distance moves and of calling attention to:

    * Deferred items which should be moved to active status, based on date.
    * Active items which should be starred, based on date.
    * For the date issues:
      * Manual resolution: Use tags like #undefer-yyyy-mm-dd and #escalate-yyyy-mm-dd.  That will put the earliest up-status items at the top of the tag list.  Review the tag list daily.
      * Code resolution: Use the API (official or unofficial) and run a daily report (or a daily up-status job).
    * For the long-distance move issue:
      * Checkvist: Maintain separate, modest-sized lists, and move in 2 steps. (Move to list; position in list.)
      * Workflowy: Tag source and dest; search by tag; drag-and-drop; remove tags.
      * A big thing I wanted to improve about Nirvana is the long-distance move problem, and neither Checkvist nor Workflowy fully solves it.

    ​

### What Am I Going to Do?

Real choices:

* Use Workflowy or Checkvist as the electronic equivalent of paper-based GTD lists.
* Make sub-projects work in Nirvana and use Checkvist/Workflowy to hold my Someday-not-soon.



Actions:

* Checkvist/Workflowy - decision = Checkvist:
  * Although Workflowy is more elegant and more compact, Checkvist renders Markdown and Workflowy doesn't.  This is important when embedding epically long links.  But Workflowy is so much more compact than Checkvist, that it make not matter that the links are longer.  You can use custom CSS with Checkvist Pro ($40/year).  I should be able to use Stylish for CSS.  I'm going to assume I can make Checkvist fit better via Stylish or Checkvist Pro.
  * Manually move epic-Someday items between my GTD tool and my outline.
* GTD Tool: Stick with Nirvana
  * Figure out how to better manage sub-projects of projects ("cases" at work) in Nirvana.
    * Don't try to manage the whole project in Nirvana.  Tasks should be atomic; projects should be the final outcome plus any tasks I need to get out of my head.  The purpose of a project entry is simply to track the outcome which occurs down the road AFTER it's next-action.
  * Keep the active list for projects small enough that I can drag a new task from bottom to top of list.

