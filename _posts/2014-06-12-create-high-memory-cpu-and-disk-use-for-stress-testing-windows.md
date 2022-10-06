---
categories: []
layout: post
title: Create High Memory, CPU, and Disk Use, for Stress-testing Windows
created: 1402597356
redirect_from: /content/create-high-memory-cpu-and-disk-use-stress-testing-windows
---
Sometimes you need to generate 100 percent CPU use, or memory exhaustion, or slow system response due to high disk I/O.

See http://blogs.msdn.com/b/vijaysk/archive/2012/10/27/tools-to-simulate-cpu-memory-disk-load.aspx

"CPU Stress" (aka cpustress.exe) is at http://download.sysinternals.com/files/CPUSTRES.zip .  It can use up from 1-4 logical processors.

Need to use up all your memory?  See http://download.sysinternals.com/files/TestLimit.zip .  TestLimit can soak up varying amounts of RAM.

SQLIO can generate lots of disk activity.  (SQL Server people like to test with it, hence, the name.)  http://www.microsoft.com/en-in/download/details.aspx?id=20163
