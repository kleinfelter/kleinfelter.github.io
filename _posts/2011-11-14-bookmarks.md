---
categories: []
layout: post
title: Bookmarks
created: 1321318942
redirect_from: /content/bookmarks
---
Bookmarks.  I've got a lot of them.  I've got a few I use often.  Sometimes I think the chief value of bookmarks is that I can park something there and pretend like I'll have it when I want it.<p>
For the moment, I've signed up for a <a href="http://pinboard.in">Pinboard</a> account, and I loaded all my Google Chrome bookmarks into it.  Now I've got to come up with a policy for what goes into Pinboard and what goes into my browser bookmarks.<p>
I tried using a <a href="http://www.upway2late.com/projects/chrome-pinboard-extension-bookmark-sync">Chrome extension</a> to synch Pinboard with Chrome bookmarks.  It <em>sounds</em> like a good idea.  The problem is that Chrome uses folders to organize, and Pinboard uses tags to organize.  Pinboard synch takes a rational approach.  It maps a folder to a tag, 1 for 1.  So if you have a bookmark B, in folder F in Chrome, it lands in Pinboard as a bookmark B tagged with F.  So far, so good.<p>
But what happens when you tag B with F, G, and H?  It winds up in Chrome in folder F, folder G, and folder H.  Not so good, but tolerable.<p>
But what happens if you have bookmark B, and it is stored in folder F, which is a sub-folder of G, which is a subfolder of H?  i.e. H/G/F/B.
<ul>
<li>First it syncs to Pinboard with tags H, G, and F.
<li>Then in syncs back to Chrome in folders H, G, and F.
<li>Then you realize that it just flattened your folders into a single level, and you restore from your <a href="http://xmarks.com">Xmarks</a> backup.
</ul>
So here's how i'm going to decide what goes into Pinboard and what goes into Chrome.
<ul>
<li>If I use it frequently, it goes into Chrome.
<li>If it is a bookmarklet, it goes into Chrome.
<li>If it is something that applies only to the local compter (e.g. a file:// URL), it goes into Chrome.
<li>Everything other than bookmarklets and local URLs goes into Pinboard.
</ul>
What I'd <em>like</em> is to have a way to replicate Chrome bookmarks into Pinboard, tagged as from-Chrome, and if I delete a bookmark in Chrome which is tagged solely as from-Chrome, the delete gets replicated too. I'd happily settle for replicating new/changed bookmarks to Pinboard.  (I can live with deletes that didn't happen.)<p>
I don't see how to make that happen using off-the-shelf tools. I could cobble together something -- perhaps a Perl script run from cron to download from Xmarks and push to Pinboard (without creating duplicates).<p>
While Xmarks doesn't offer a proper API, you can get an RSS feed by selecting "Classic View" (not "Grid View"), selecting your top-level Bookmarks folder, and clicking "Share" on the toolbar.
