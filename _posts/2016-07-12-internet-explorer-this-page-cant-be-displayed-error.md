---
categories: []
layout: post
title: Internet Explorer - "This page can't be displayed" error
created: 1468343243
redirect_from: /content/internet-explorer-page-cant-be-displayed-error
---
Sometimes, IE shows a "This page can't be displayed" error.  This is IE's all-purpose "I'm sorry, I can't do that Dave" message.  It can have multiple causes.

One cause I've seen more than once is an infinite redirect loop.  This can be particularly difficult to recognize, if you have users trying to reproduce the problem, because they'll reload the page again and again, trying to produce the problem.  That looks a whole lot like a redirect loop, reloading the page again and again.

So if you get "This page can't be displayed", use Fiddler or Wireshark (or even just a server-side log, showing the full request/response content).  If you see status "302 Found" returned, with a Location header of the page you just fetched, that's a redirect loop.  The browser will redirect for a while and then give up.

I've seen two applications which were *supposed* to redirect to a *login* page (if the user's session expired) from the landing page and they redirected back to the *landing* page instead.
