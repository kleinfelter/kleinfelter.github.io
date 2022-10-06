---
categories: []
layout: post
title: Visual Studio 2013 Community Edition Install Fails/Crashes
created: 1424998015
redirect_from: /content/visual-studio-2013-community-edition-install-failscrashes
---
I was totally unable to get the install for Visual Studio 2013 to run to completion.  I kept running it.  It kept running a little farther than the previous time and silently quitting.  There are 3 parts to the answer:

1. Download and install the 8 GB DVD ISO file from VisualStudio.com.  Do not use the much smaller online installer.
2. After it appears to run to completion, there will still be a vs_community.exe plus two "vs...KB....." processes running in task manager.  Let them run to completion.
3. Then reboot and it will complete installation.
