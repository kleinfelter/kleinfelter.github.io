---
excerpt: "Programmers sometimes use a program called 'diff' to compare two files.
  \ While diff is a tool created by geeks, for geeks, there are only 4 rules you need
  to know in order to read the output from diff.\r\n"
categories: []
layout: post
title: How to Read Output From diff
created: 1287855461
---
Programmers sometimes use a program called 'diff' to compare two files.  While diff is a tool created by geeks, for geeks, there are only 4 rules you need to know in order to read the output from diff.
<!--break-->
Here is sample output from running diff to compare two files, which we'll call File1 and File2.  The geek might tell you (s)he ran "diff File1 File2".

<code><pre>
0a1,4
> This is an important
> notice! It should
> therefore be located at
> 
11,14c14
< This paragraph contains
< text that is outdated.
< It will be deleted in the
< near future.
---
17c17
< check this dokument. On
---
> check this document. On
</pre></code>

<ol>
 <li>Ignore all lines except those that begin with either "&lt;" or "&gt;".
 <li>A line which begins with "&lt;" is in File1 but not in File2.
 <li>A line which begins with "&gt;" is in File2 but not in File1.
 <li>If you see a line which begins with "&lt;" and it is followed by a similar line which begins with "&gt;", then the line in File2 is a changed edition of the line from File1 (i.e. the line was deleted from the first file and added to the second file, with revisions).
</ol>

In the example above,
<code><pre>
This is an important
notice! It should
therefore be located at
[blank line here]
</pre></code>
is in File2 but not File1

<code><pre>
This paragraph contains
text that is outdated.
It will be deleted in the
near future.
</pre></code>
is in File1 but not File2

There is a line in File1 which reads:
<code><pre>
check this dokument. On
</pre></code>
and File2 corrects the spelling of "doKument" to "doCument", and the line in File2 is
<code><pre>
check this document. On
</pre></code>

Piece of cake!  Just remember the 4 rules:
<ol>
 <li>Ignore all lines except those that begin with either "&lt;" or "&gt;".
 <li>A line which begins with "&lt;" is in File1 but not in File2.
 <li>A line which begins with "&gt;" is in File2 but not in File1.
 <li>If you see a line which begins with "&lt;" and it is followed by a similar line which begins with "&gt;", then the line in File2 is a changed edition of the line from File1 (i.e. the line was deleted from the first file and added to the second file, with revisions).
</ol>

<i>Some content adapted from http://en.wikipedia.org/wiki/Diff#Usage.</i>

