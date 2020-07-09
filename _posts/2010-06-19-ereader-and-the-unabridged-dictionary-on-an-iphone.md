---
excerpt: "eReader was doing e-books long before Amazon or iTunes, so I own a number
  of eReader e-books.  One of them is Webster's Unabridged Dictionary.  If you tell
  eReader to download this book, it will warn you that it will probably time out on
  the download.  It is right.  It will.  Here's how to get a large book onto your
  iPhone.\r\n\r\nIf you haven't done so already, go to the eReader site (www.ereader.com)
  and download every one of your books to your Mac/PC.  Disk space is cheap, and eReader
  could go out of business.  They could be in business for another 100 years, but
  why take chances?\r\n\r"
categories: []
layout: post
title: eReader and the Unabridged Dictionary on an iPhone
created: 1276979124
---
eReader was doing e-books long before Amazon or iTunes, so I own a number of eReader e-books.  One of them is Webster's Unabridged Dictionary.  If you tell eReader to download this book, it will warn you that it will probably time out on the download.  It is right.  It will.  Here's how to get a large book onto your iPhone.

If you haven't done so already, go to the eReader site (www.ereader.com) and download every one of your books to your Mac/PC.  Disk space is cheap, and eReader could go out of business.  They could be in business for another 100 years, but why take chances?

As near as I can tell, the problem with downloading really big books is that the eReader server won't let a download run for long enough to download to your iPhone.  The solution: Download the book from your own, local web server.

Here's how to do it on a Mac:

<ul>
<li>Go to System Preferences and then Sharing, and enable Web Sharing.
<li>Copy the dictionary's .pdb file to /Library/WebServer/Documents/dictionary.pdb
<li>On your iPhone, start eReader, select the Reference category, and click on the "+" button.
<li>Select "Another Site" and enter the URL ereader://your-mac-ip-address/dictionary.pdb
</ul>
Note: Make sure you use the "ereader://" protocol and not http://.
