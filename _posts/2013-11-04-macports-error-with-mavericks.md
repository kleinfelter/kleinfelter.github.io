---
categories: []
layout: post
title: MacPorts Error With Mavericks
created: 1383584143
redirect_from: /content/macports-error-mavericks
---
I was trying to install KMyMoney from macports on OS X Mavericks.  In turn, this attempted a macports install of llvm-gcc42.  This produced the error:
    "The directory that should contain system headers does not exist" macports

The solution is to manually install XCode tools via 
    xcode-select --install

Note that xcode command line tools are supposed to automagically install, but when they do, they don't create /usr/include, and that's what's missing.
