---
excerpt: "From time to time you may read that Intuit needlessly dropped QIF import
  from Quicken.&nbsp; Intuit has stated that QIF was dropped because it wasn't robust
  enough.&nbsp; I won't speak to the strengths or weaknesses of QIF as a format, but
  I can tell you that Quicken 2006's support for QIF is lame.\r\n  <br />\r\n  <br
  />Others have documented that, despite Quicken's claims to the contrary, you can
  import QIF files, so long as they have a &quot;!Account&quot; header added.&nbsp;
  This is true -- to a limited extent.\r\n  <br />\r\n  "
categories: []
layout: post
title: Quicken and QIF Files
created: 1249951972
---
From time to time you may read that Intuit needlessly dropped QIF import from Quicken.&nbsp; Intuit has stated that QIF was dropped because it wasn't robust enough.&nbsp; I won't speak to the strengths or weaknesses of QIF as a format, but I can tell you that Quicken 2006's support for QIF is lame.
  <br />
  <br />Others have documented that, despite Quicken's claims to the contrary, you can import QIF files, so long as they have a &quot;!Account&quot; header added.&nbsp; This is true -- to a limited extent.
  <br />
  <br />I've got a Quicken file with over 22,000 transactions in it.&nbsp; Pretty much my entire financial history for about 30 years.&nbsp; (At one point, I went back and entered data from before Quicken existed.&nbsp; I had waaay too much time on my hands.)&nbsp; Because I had reason to suspect that there was some corruption in the data file that super-validating wasn't fixing, I decided to &quot;clean up&quot; my data by exporting the entire file to QIF, creating a new Quicken data file, and importing the QIF back in.
  <br />
  <br />After exporting, I checked the QIF file, and it looked good.&nbsp; After importing the first time, the results were terrible.&nbsp; One of the problems I had was incomplete import of split transactions, and another was that import had somehow renamed all my utility bills to &quot;My Bank Home Mortgage&quot;.&nbsp; So I created a new file, and turned off transaction renaming, and I imported my accounts with many &quot;split&quot; transactions first.
  <br />
  <br />This worked better, for some small value of better.&nbsp; Instead of being off by a million dollars over 30 years, I was off by only $100,000.&nbsp; 
  <br />
  <br />I spent some time comparing the before-export and the after-import files, and comparing them to the QIF file.&nbsp; When the QIF file has a transaction with many split items, and some of the later splits are transfers to other accounts, they aren't imported.
  <br />
  <br />Ouch!
  <br />
  <br />
