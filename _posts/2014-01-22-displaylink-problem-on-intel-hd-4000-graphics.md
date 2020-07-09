---
categories: []
layout: post
title: DisplayLink Problem on Intel HD 4000 Graphics
created: 1390420990
redirect_from: /content/displaylink-problem-intel-hd-4000-graphics
---
At work, they replaced my HP ProBook 6450b with an HP ProBook 6470b.  This upgraded my video chip.  (It wasn't something I wanted.  They just do this every 3 years as a "lease roll".)

This broke my DisplayLink adapter.  Mouse was almost invisible, often left mouse droppings, and window update was abysmally slow.  I knew this wasn't USB 2.0 slowness, because the same adapter worked on the old laptop.

I don't know why, but changing from the Windows Classic theme to the Windows 7 theme made it work.  I'm guessing they don't do much testing with the classic theme, and there's a bug.  I don't really care for the Aero look, but it is better than a broken mouse pointer.

Note that it does not work with Windows 7 Basic.

DisplayLink hints that this might be the case: http://www.displaylink.com/support/ticket.php?id=260
