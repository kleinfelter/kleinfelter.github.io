---
categories: []
layout: post
title: Repair a PDF Which Doesn't Fit the Paper
created: 1445647551
redirect_from: /content/repair-pdf-which-doesnt-fit-paper
---
I downloaded a PDF book.  It looks like someone added a footer to each page of the original, and that pushed the content up on each page so that the first half inch of each page's isn't visible.

I fixed the PDF by:

* Downloading and installing the brew (homebrew) package manager.  (I use a Mac.)
* Running "brew install ghostscript".
* Running 

    gs  -sOutputFile=output.pdf  -sDEVICE=pdfwrite  -sPAPERSIZE=a4  -dCompatibilityLevel=1.4  -dNOPAUSE  -dBATCH  -dPDFFitPage  input.pdf

See http://ghostscript.com/doc/7.07/Use.htm#Known_paper_sizes

Or use "-dDEVICEWIDTHPOINTS=w -dDEVICEHEIGHTPOINTS=h" where w is width and h is height, in 1/72" (points).

OS X Preview can show you the page size via Tools > Show Inspector.  Then multiply the dimensions in inches by 72 and round up to an integer.
