---
categories: []
layout: post
title: PC World Won't Open In Google Chrome
created: 1397856292
redirect_from: /content/pc-world-wont-open-google-chrome
---
Google started reporting "This webpage is not available" (and "ERR_CONNECTION_REFUSED") if I clicked the More button, when I went to pcworld.com.

It turns out this was caused by the HTTPS Everywhere extension.  HTTPS Everywhere was redirecting links from http://www.pcworld.com to https://www.pcworld.com, and PC World does not work with https!

To fix this, look in your address bar, at its right side.  There is a blue circle with arrows coming out of it.  Click it.  Turn off HTTPS for PC World.  Bask in the glory of success.
