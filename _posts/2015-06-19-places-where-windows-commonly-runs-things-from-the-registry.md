---
categories: []
layout: post
title: Places Where Windows Commonly Runs Things From the Registry
created: 1434751818
redirect_from: /content/places-where-windows-commonly-runs-things-registry
---
Windows auto-runs things from your Startup folder (see Start/All Programs/Startup) when you login to Windows.  It also runs things via the registry. 

* HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run*
* HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run*
* HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run*  (Note: This one is relevant for running 32-bit programs on 64-bit Windows.)

There are others, but these are the common ones.
