---
categories: []
layout: post
title: Convert to PDF - OS X Command Line (Terminal)
created: 1488239507
redirect_from: /content/convert-pdf-os-x-command-line-terminal
---
To print to PDF (convert) most SINGLE PAGE files in OS X:

    cupsfilter foo_name_here > foo.pdf 2>/dev/null

If you run this with a mult-page TIF as input, the output will truncate everything after the first page.
