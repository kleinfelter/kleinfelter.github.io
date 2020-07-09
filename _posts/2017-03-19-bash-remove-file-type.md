---
categories: []
layout: post
title: bash - Remove File Type
created: 1489971672
redirect_from: /content/bash-remove-file-type
---
I never can remember this:

    filename=foo.txt
    echo ${filename%.*}

will remove the trailing ".txt".  Mnemonic: % sorta looks like dividing two circles.  "%.*" says to divide at the period, matching any file type.

I often use a for loop which looks something like:

    for f in foo*.txt ; do
        echo ${f%.txt}
    done

-----

Keyword fodder: bash, shell script, remove file type, remove file extension, basename, base name, Linux, Unix
