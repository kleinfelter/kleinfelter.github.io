---
title: Tiddlywiki vs Jekyll for PKB
layout: post
---

Due to increasing browser security and it having become abandonware, I'm going to move away from Tiddlywiki Classic.  I tried using it in a .hta file, but IE has some problems with its JavaScript and I'm unwilling to fix the source myself.

I need two distinct personal knowledge bases: work-related and personal.  I'd like to be able to edit each from my work laptop and my personal laptop, at the office and at home.

For a variety of (undocumented) reasons, I've narrowed my options to Tidddlywiki 5 (node.js edition) and a Jekyll-generated web site.

Some features I want:

|             | TW Support | Jekyll Support |
|-------|----------------|--------------------|
| Inter-wiki linking | Y | Y |
| GFM Markdown | Y | Y |
| MathJax | * 1 | * 2 |
| Images    | Y * 3 | Y * 3 |
| Send my wife a URL | Y | Y |
| Usable at work and home | Y | Y |
| Need not store my personal data in the cloud | Y | Y |
| Can search with my native OS search (e.g. Spotlight) | Y | Y |
| Export/migrate if support vanishes | Y | Y |
| Maintains a history of changes | N * 4 | N * 4 |
| Dual-master support | Y * 5 | Y * 5 |
| Easy up and running when I rebuild my machine | N | N |
| Edit/view from Mac, Windows, Linux | Y | Y |
| Reduced tool count (I'm using Jekyll for other sites). | N | Y |
| This page referenced by... | Y | N |
| Edit this page | Y | N * 6 |

* 1 Tiddlywiki: http://mathjax-tw5.kantorsite.net/ renders in text/x-marked, but throws an error.  This one fails too: https://gist.github.com/kpe/cc0547b318e6f8d4ddaa. Some debugging required.
* 2 Jekyll: https://alan97.github.io/random/mathjax/ has a tutorial for MathJax.
* 3: May have to manually put images into a local folder and link to them from the Markdown.
* 4: Neither product maintains a change history.  You'd have to use something like git to version your data.
* 5: I have a Mac laptop and a Linux server at home.  I want to be able to edit and view data when either is getting rebuilt. I can do this with either by using my Linux server as a git server.
* 6: I think I could write something to do this for Jekyll with an edit button to link to the corresponding admin interface edit page.

=====

If I put them only on my linux server, I can access them from anywhere EXCEPT offline, and I can't index them on my Mac.  I can't share with my wife if it is only on my Macbook.  I can't put my work PKB on my Macbook because I have no network connection between the two.  I could use git to sync laptops with Linux server, and edit on either side.  Need to make this low-friction.

Use Jekyll on  as my PKB.  That reduces my tool count, but when I'm looking at a page in Jekyll, navigating to EDIT it is a bother.  Could I add an "Edit Me" button that is visible only locally? (Asked this on StackOverflow.)  I'd use git-with-github for the public sites and git-with-mac-and-boxtop for the local sites.

Tagging is better in TW than Jekyll, but it exists in Jekyll.

Spotlight will find two copies of every page in Jekyll - one for the markdown and one for the HTML, unless I tell it not to index one of the folders.

If I use Tiddlywiki, it is very easy to mess it up or break part of it.  I'll need to use git agressively, so I can roll back changes.  Sometimes rolling back a change seems to require stopping/starting the server (on my Mac):
{% raw %}
{{{
launchctl unload /Users/kevin/Library/LaunchAgents/com.kleinfelter.tiddlywiki.plist
launchctl load /Users/kevin/Library/LaunchAgents/com.kleinfelter.tiddlywiki.plist
}}}
{% endraw %}
