---
excerpt: "I wanted to use Quicken 2011 under Crossover Impersonator.  I'm running
  Ubuntu 10.10 (Maverick Meerkat).  I was getting black buttons, black graphs and
  black charts.  I had installed Quicken using the generic Codeweavers install for
  Quicken 2011.  It *is* a 'supported application.'\r\n\r\nComparing Quicken running
  in a VM with Quicken under WINE, I noticed that everything that was rendered in
  black under WINE, had shading to make it look 3D in the VM.  Using a native GDIplus.dll
  solved the problem.\r\n\r\nHere's the full Quicken 2011 install:\r\n<ol>\r"
categories: []
layout: post
title: Quicken 2011 Deluxe With WINE (Crossover Impersonator) on Ubuntu 10.10 (Maverick
  Meerkat)
created: 1299423059
---
I wanted to use Quicken 2011 under Crossover Impersonator.  I'm running Ubuntu 10.10 (Maverick Meerkat).  I was getting black buttons, black graphs and black charts.  I had installed Quicken using the generic Codeweavers install for Quicken 2011.  It *is* a 'supported application.'

Comparing Quicken running in a VM with Quicken under WINE, I noticed that everything that was rendered in black under WINE, had shading to make it look 3D in the VM.  Using a native GDIplus.dll solved the problem.

Here's the full Quicken 2011 install:
<ol>
<li>Application -&gt; Crossover -&gt; Install Windows Software</li>
<li>Choose Quicken 2011 under Supported Applications</li>
<li>Select an Installer -&gt; Choose an Installer Folder -&gt; Browse to your Quicken CD (or folder where you copied the CD) </li>
<li>Run the install.  Do NOT launch Quicken at the end of the install.</li>
<li>Browse (Nautilus) to ~/.cxoffice/Quicken 2011/drive_c/windows/system32</li>
<li>Rename gdiplus.dll to gdiplus-hidden.dll</li>
<li>Copy a real (Microsoft) gdiplus.dll to ~/.cxoffice/Quicken 2011/drive_c/windows/system32</li>
<ul><li>I've got a folder named windows-patches-and-MS-add-ons, where I keep all sorts of DLLs like this one.</li></ul>
<li>Application -&gt; Crossover -&gt; Manage Bottles</li>
<li>Select the Quicken 2011 bottle -&gt;Control Panel -&gt; Wine Configuration and press Launch Selected Item</li>
<li>In the Applications tab, select qw.exe</li>
<li>Set Windows Version to Windows 7, and press Apply.</li>
<li>On the Libraries tab, select "gdiplus (builtin)" in the Existing Overrides section, and press Edit</li>
<li>Set the gdiplus override to "native, then builtin"</li>
<li>Save everything, and run Quicken.</li>
<li>When you get to the registration prompt, choose "Register Later"</li>
<li>While holding control-shift, choose Tools/One-step Update.  Quicken will promise never to nag about registration again.</li>
</ol>
