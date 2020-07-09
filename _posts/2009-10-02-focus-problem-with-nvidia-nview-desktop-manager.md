---
excerpt: "<p>One feature provided by NVIDIA nView Desktop Manager is that it can add
  some icons to your title bar (just to the left of the minimize/restore/close buttons)
  to support window roll-up, move-to-next-display, and maximize-across-multiple-displays.</p>\r\n
  \ <p>However, when you enable these, you can wind up with some obscure focus problems:</p>"
categories: []
layout: post
title: Focus Problem With NVIDIA nView Desktop Manager
created: 1254514779
---
<p>One feature provided by NVIDIA nView Desktop Manager is that it can add some icons to your title bar (just to the left of the minimize/restore/close buttons) to support window roll-up, move-to-next-display, and maximize-across-multiple-displays.</p>
  <p>However, when you enable these, you can wind up with some obscure focus problems:</p>
  <ul>
    <li>Sometimes the color-coding of your title bar (that indicates which window has the focus) can be backwards.&nbsp; i.e. It shows the focused color when you don't have the focus, and vice versa.</li>
    <li>If you open an application window, the title bar will show you that it has focus (see problem above), but pressing Alt-F4 doesn't close the window (because it doesn't really have the focus).</li>
  </ul>
  <p>I suspect that focus is on the added icons, instead of the real window.&nbsp; If you're a mouse user, you might never notice, but I'm a heavy keyboard user.</p>
  <p>Work-around: Either:</p>
  <ul>
    <li>Disable all nView Desktop Manager or</li>
    <li>On the nView Desktop Manager window's User Interface tab, clear all 4 of the Title bar buttons check-boxes.</li>
  </ul>
