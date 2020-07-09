---
categories: []
layout: post
title: MacBook Keyboard and Windows Keystrokes In Parallels
created: 1320366537
redirect_from: /content/macbook-keyboard-and-windows-keystrokes-parallels
---
Had a devil of a time finding some of these.  Windows key listed first, followed by Mac keystrokes.  All of this is on an early 2011 aluminum unibody MacBook Pro, with Lion, Parallels 7, and Windows XP.  Some of these probably apply to Vista, Windows 7, and Linux:
<ul>
<li>Insert = Fn + Enter
<li>Home = Fn + Left (arrow)
<li>End = Fn + Right
<li>PgUp = Fn + Up
<li>PgDn = Fn + Down
<li>Break = Can't be done.  See note on Break below.
<li>Print Screen = 
<li>Scroll Lock = 
<li>Num Lock = 
<li>Context Menu (the keyboard equivalent of right-click) = 
<li>The RIGHT-SIDE Control Key = 
</ul>

Note that if all else fails, run osk.exe and you can mouse-click on the key you want to send.  It is awkward, but awkward beats "can't be done."  

Parallels does not support mapping a key to Break (or Control-Break) per http://kb.parallels.com/en/112637 . You can also use  Autohotkey to map an alternative keystroke to the key you want.  I've been using Control-F12 as a substitute for Control-Break, but that will break when I need to use Control-F12 for real. (I chose F12 because it is pretty close to where the Break key lives on my Windows keyboard.)  To make this work, you have to tell Parallels preferences to map F12 to Pause, and then use the following Autohotkey script:
<code><pre>
#persistent
^Pause::Send {CtrlBreak} 
</pre></code>

To save you the trouble of installing Autohotkey, I've generated an .exe file that maps Control-Pause to Control-Break.  It is attached to this blog post.
