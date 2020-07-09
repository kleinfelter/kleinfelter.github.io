---
categories: []
layout: post
title: Mac OS X Says File In Use, But File Isn't In Use!
created: 1405451207
redirect_from: /content/mac-os-x-says-file-use-file-isnt-use
---
Sometimes, when you try to move or delete a file/folder on a Mac, it says "The operation cannot be completed because the item is in use".  If you are certain that the item is NOT in use, then it got locked at some point and the app ended without unlocking it.  To manually unlock a file:

    chflags nouchg filename

or

    chflags -R nouchg foldername
