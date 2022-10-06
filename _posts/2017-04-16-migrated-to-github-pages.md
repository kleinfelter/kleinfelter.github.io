---
layout: post
title: Migrated to Github Pages
---
I moved my blog from a self-hosted Drupal site to GitHub Pages with Jekyll.  I did this for two reasons:

* I observed an 'unauthorized update' to the configuration of my web server.
* All of my content is static.

I can't say for certain whether the unauthorized update was an intrusion or my virtual server host updated my configuratino by default.  The only change I observed was that someone moved my ssh port.  Whoever did it, carefully checked to ensure that the new port was open on the firewall.  I can find no evidence of any other changes or activity.  My VPS provider states that they did NOT make the change.  I suspect that the owner of a different site on the same provider requested a port change on his host and the provider changed mine by mistake.

In the end, there is very little difference -- an unauthorized change was made on my server, so now I can't trust its integrity.

Because my content is entirely static (with the exception of user comments, which I've suspended due to spam), Drupal was really overkill.  By migrating to GitHub pages, I make someone else responsible for server security -- someone who can put a lot more time/effort into it.  I retain a local copy of the entire site, so even if GitHub melts down, I can re-publish elsewhere, with no loss of content.

I'm using Jekyll to create my site from Markdown files.  Actually publishing a blog post with GitHub + Jekyll is more work (and more technical) than with Drupal, so I've wrapped it in a script. At this point, my script assumes that I solely post to my blog from my Macbook.  I need to tweak my process and my script so that I can safely add a page from another laptop/PC when I'm away from my Mac.

[Prose](http://prose.io/#about) is a spiffy tool for updating GitHub pages from a web browser.  All of the logic is run by the web browser *except* for authentication.  Ohh... Not good. That means that Prose can do anything to GitHub that I can.  They say you can host the auth part on your own web server.  That might be worth investigating.  Links:

* http://prose.io/#about
* https://github.com/prose/prose/blob/master/DEPLOYMENT.md
* https://github.com/prose/browser-extensions - can run from Chrome or Firefox

It looks like it is mostly abandonware.  In theory, the only really scary thing  is that they could delete my repository.  For any other malicious change, I could always revert git.

Ahh... Silly me.  You can do this from the GitHub user interface.  To edit a file, just browse to the file and press the Edit button.  To create a new file, browse to the _posts directory and press the Create New File button.

Prose does have a Preview feature, which GitHub doesn't.
