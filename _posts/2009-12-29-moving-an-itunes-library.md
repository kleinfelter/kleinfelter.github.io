---
excerpt: "I do not have iTunes configured to copy music files to my iTunes library.&nbsp;
  (I don't need another copy of my files, which are on a network drive.)\r\n  \r\n
  \ <br />\r\n  <br />I found stories on the net, saying to delete the content of
  &quot;iTunes Library.itl&quot; and to edit &quot;iTunes Music Library.xml&quot;
  to reflect the new location.&nbsp; The story is that iTunes would detect the corrupt
  .itl file and rebuild from the xml file.&nbsp; I tried it.&nbsp; It didn't.\r\n
  \ \r\n  <br />\r\n  "
categories: []
layout: post
title: Moving an iTunes Library
created: 1262131343
---
I do not have iTunes configured to copy music files to my iTunes library.&nbsp; (I don't need another copy of my files, which are on a network drive.)
  
  <br />
  <br />I found stories on the net, saying to delete the content of &quot;iTunes Library.itl&quot; and to edit &quot;iTunes Music Library.xml&quot; to reflect the new location.&nbsp; The story is that iTunes would detect the corrupt .itl file and rebuild from the xml file.&nbsp; I tried it.&nbsp; It didn't.
  
  <br />
  <br />My new 'protocol' is to make all of my music accessible via M:\, where I have subdirectories named mp3 (where my music lives) and books (where audio books live).&nbsp; If I move the library, I have to move M: to point to the same structure.&nbsp; In the simple case, I do this with a new drive mapping.&nbsp; In the more complex case (suppose the share points to \foo\bar and mp3 and books live in bar) I would then map the share to a different letter (e.g. N:) and then use subst (e.g. &quot;subst M: N:\foo\bar&quot;).
  
  <br />
