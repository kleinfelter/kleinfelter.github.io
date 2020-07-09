---
excerpt: "I'm an occasional Mac user.  When I do use a Mac, I've got spreadsheets
  that contain lots of things which Numbers won't handle, so I need to use Microsoft
  Office.  (Also, when I send a resume, I can't go with pretty close Word files --
  I need real Word files.)\r\n\r\nOK.  So I'm going to use Microsoft Office on the
  Mac.  That leaves 3 choices:\r\n<ol>\r\n<li>Microsoft Office for Mac (The OS X edition
  of Office.)</li>\r\n<li>Crossover or Wine</li>\r\n<li>Parallels or Fusion (VM)</li>\r\n</ol>\r\n\r\n"
categories: []
layout: post
title: Why I Run Office Via a VM Instead of Crossover (or Wine)
created: 1286243460
---
I'm an occasional Mac user.  When I do use a Mac, I've got spreadsheets that contain lots of things which Numbers won't handle, so I need to use Microsoft Office.  (Also, when I send a resume, I can't go with pretty close Word files -- I need real Word files.)

OK.  So I'm going to use Microsoft Office on the Mac.  That leaves 3 choices:
<ol>
<li>Microsoft Office for Mac (The OS X edition of Office.)</li>
<li>Crossover or Wine</li>
<li>Parallels or Fusion (VM)</li>
</ol>

I own a license for Office for Windows, and, similar to Numbers, Office for Mac can't handle some of my spreadsheets. (e.g. I have a ham radio logbook spreadsheet that uses macros to build a SOTA export and to fetch data from QRZ.com.)  That rules out Office for Mac.  (No, I'm not going to rewrite my spreadsheets.  I want to *use* my spreadsheets, not develop them.  See http://www.rondebruin.nl/mac/mac027.htm for info on VBA issues.)

So now I'm down to Crossover/Wine versus VM.  If I'm going to use Crossover/Wine, the price of Crossover is a bargain, when compared with messing with Wine settings all day.  (Or maybe for a week or two.)  Crossover simplifies all that.  Just install Office per the Crossover instructions and it works.  I could get Wine to work... eventually.  Life is too short for that.

Now I'm down to Crossover versus a VM.  I haven't really settled on Fusion or Parallels yet.  For the sake of discussion, I'm going to refer to Parallels, but everything I say about Parallels can pretty much be said about Fusion.

Crossover doesn't render fonts just right.  Most of them are readable, but ugly, and they don't quite match what prints.  Furthermore, every time I start an Office application, I have to wait 30 seconds while Crossover spins up and loads its libraries plus the application.  With Parallels, I pay a 60 second penalty the FIRST time I launch an Office application, while it spins up the VM, but it leaves the VM running in the background, so Office starts in 2 seconds every time after the first.

You could make a good argument that using Parallels requires a Windows license, and Crossover doesn't.  But I already own multiple Windows licenses, so that only matters if I'm a crusader against Windows.  (I'm not.  See "Life is too short," above.)  
