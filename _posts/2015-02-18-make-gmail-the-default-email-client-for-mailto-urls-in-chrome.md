---
categories: []
layout: post
title: Make GMail the Default Email Client for mailto URLs in Chrome
created: 1424277342
redirect_from: /content/make-gmail-default-email-client-mailto-urls-chrome
---
* Open a *window* in Chrome and load GMail in it
* Press Ctrl+Shift+J (or Cmd+Opt+J on a Mac) to open Chrome's JavaScript console
* Paste this code into the JS console

    navigator.registerProtocolHandler("mailto","https://mail.google.com/mail/?extsrc=mailto&url=%s","Gmail");

* It will tell you "undefined".
* Open a new *window* in Chrome and open your Gmail in it.
* Look in the address bar, at the right edge.  There will be a double diamond.  Click it.
* Chrome will ask you if you really want Gmail to handle your email.  Tell it 'yes.'
