---
title: Tiddlywiki or zim
layout: post
---

I've been using TiddlyWiki Classic (TWC) as a personal knowledgebase (PKB).  At first, it was real handy in that I just had a single file with the code and data and it ran in any browser.

Then that devolved to "runs in Firefox with the Tiddlyfox extension" due to browsers 'improving' their security.  (Yeah, I'm aware of the stand-alone TiddlyWiki browser.)  Soon, it will stop running in Firefox, when Firefox drops support for the old extension architecture.

I *could* keep an old copy of Firefox around, just to run the old extension.  Under Windows, I'd use an old Firefox Portable.  Under Mac, I'd go through a song-and-dance to use two Firefox.app.  And I'd also have to ensure that the different editions of Firefox never stepped on each other's profile.  No thanks.

Why not use Evernote?  It's real handy, but I'm not willing to bet they will never be compromised.  I store seriously confidential data like account numbers.

Why not use OneNote?  I use Mac and Windows, and the Mac edition does not support local notebooks.  It's real handy, but I'm not willing to bet they will nev
er be compromised.  I store seriously confidential data like account numbers.

OK.  So I'm going to run a local app (or at least an on-MY-server app).  What else do I want?

* Store each note in a separate file, searchable by my OS's search routine, with content recovery via plain-text editor.

    * I've decided on the single-file-local-search paradigm in the past.  It has many advantages (documented elsewhere).

* Need to access content from my employer-provided (and controlled) notebook, and on my Macbook.
* Need real wiki-style hyperlinking.
* Some ability to include images.  It is OK if the images must be stored separately, although integrated image management is better.  Plain copy/paste is best, with zim's "attachments" being a compromise.
* I need some way to import 700+ tiddlers from my TWC.

#### Windows Portability:

* I'm not supposed to install un-approved software on my employer's notebook.  Right now, node.js is on the approved list, but it could vanish or they could decide that "approved" means "on a server".  There are reports of how to run node.js without install, which could become my work-around, or I could move my work notebook to a personal (or Amazon AWS) web server.  Or there's zim portable. Advantage: tie

#### OS Portability:

* node.js TW and zim both can be made to work on Windows, Mac, Linux.  Advantage: tie

#### Moving the Wiki Portability:

* With the Windows portable-zim, you can just copy the directory tree to a new Windows PC.  You can't move it to OS X that way.
* Whether zim or TW5 on node.js, it isn't just copy-the-wiki-file like it was with TWC.

#### Learning:

* I'd like to better learn Python;  I'd like to better learn JavaScript.  Advantage: tie
* It might be interesting to run node.js TW via Docker.

#### File format:

* Both the node.js TW and zim store documents as separate files. Advantage: tie

#### Import:

* node.js TW is going to import my TWC tiddlers.  zim isn't.  I could import TWC into TW5, then write code to move the TW5 files to zim, along with re-formatting.  Lots of work.  Advantage: TW

#### Markdown:

* Markdown is a non-standard.  Every implementation is different. But it is at least a pseudo-standard.  TW5 and zim both use unique 'blended' markup.  But TW5 can be told to use Markdown.  Advantage: TW

#### Putzing:

* TW has a high risk of wasting time tinkering with it.  zim less so.  Advantage: zim

#### Export:

* zim has more options to export to something else.  TW exports to TW.  That's automated export.  With either one, they store data as files, so I could write my own.  Advantage: zim.
* Both can export the whole wiki as a single HTML file for viewing elsewhere.

#### Math:

* I dabble in statistics.  I need to be able to enter mathematical formulae. There's a MathJax plugin for TW.  zim has Equation Editor.  Advantage: tie

#### Table:

* I insist on being able to create tables.  Both offer some form of tables.  Neither does them as slick as Word.  Advantage: tie

#### Transclusion:

* TW does; zim doesn't.  Advantage: tie

#### WYSIWYG:

* zim has it built-in; TW has a plugin at http://bjtools.tiddlyspot.com.  Advantage: zim

#### Recent Changes:

* TW lists recently updated pages; zim doesn't.  Advantage: TW

#### Attachments:

* zim has built-in attachments;  TW5 yes, with some limits.  Advantage: not sure.

-----

As I was creating this document, I had a thought: "What about just using Jekyll?"  I'm already using Jekyll (via GitHub Pages) for my blogs.  I could focus my learning on a sigle platform if I kept a private Jekyll notebook.

* Advantage: Learn one platform; learn it well.
* Disadvantage: Higher friction to get content into it.  You can certainly create pages, and you can search pages, but you can't just add a wiki word to a page and then follow it to a new page.
* Disadvantage: Have to get Ruby onto my employer's laptop, where it is classed as "emerging" (meaning "not forbidden but you must justify its use.")

Someone really could build a hybrid of jekyll and jekyll-admin and add wiki-like features to it, but right now, friction is the killer for using jekyll as a PKB.

-----

Conclusion: zim and TW5 are roughly on par with each other.  If I were starting a new PKB, I might choose otherwise, but TW5's ability to import TWC makes moving to TW5 much easier than any other choice.  I'm moving my PKB to TW5 on node.js.

Side note: I'm going to start using jekyll-admin for my blogs.  It is simple, but handier than using vi.

