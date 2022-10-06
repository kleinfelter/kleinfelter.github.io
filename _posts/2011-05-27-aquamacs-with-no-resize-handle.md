---
excerpt: "I'm running Aquamacs on my Macbook.  One day I started it and it had no
  resize handle in the lower-right corner.  There was no way to resize the window.
  \ Maybe using \"(set-frame-size (selected-frame) <width in characters> <height in
  characters>)\" in Emacs would have done it.\r\n\r\nIt turns out that the \"emacs
  starter kit\" killed it.  \r\n\r\nThe solution is easy.  Do NOT disable the menu-bar.
  \ I commented out the following line\r\n<pre>\r\n;;(if (fboundp 'menu-bar-mode)
  (menu-bar-mode -1)) \r\n</pre>\r\n\r\nDo NOT disable menu-bar-mode under OS X, because
  it takes the resize handle with it."
categories: []
layout: post
title: Aquamacs With No Resize Handle
created: 1306534739
---
I'm running Aquamacs on my Macbook.  One day I started it and it had no resize handle in the lower-right corner.  There was no way to resize the window.  Maybe using "(set-frame-size (selected-frame) <width in characters> <height in characters>)" in Emacs would have done it.

It turns out that the "emacs starter kit" killed it.  

The solution is easy.  Do NOT disable the menu-bar.  I commented out the following line
<pre>
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) 
</pre>

Do NOT disable menu-bar-mode under OS X, because it takes the resize handle with it.
