---
layout: post
title: Jekyll Not Updating Front Page With Incremental
date: 2017-11-14 17:39 -0500
---
When I used '--incremental --watch', it looked like Jekyll was not updating. It turns out that it was rebuilding the page itself, but not the content which was loaded to the landing page (a.k.a. the front page).  The solution is to add this to index.html in the main site directory:

~~~~~~~~~~~~~~~
regenerate: true
~~~~~~~~~~~~~~~

Works much better now.
