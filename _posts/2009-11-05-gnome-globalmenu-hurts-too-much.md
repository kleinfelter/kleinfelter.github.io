---
excerpt: "I've run into multiple issues using gnome-globalmenu.&nbsp; I like it, but
  it doesn't play well with others.\r\n  <br />\r\n  <br />Its latest offense is that
  it causes the gnome screenlets manager to die on start-up with:\r\n  <br /><strong>Attempt
  to add property GtkMenuBar::local to class after it was derived</strong>\r\n  <br
  />\r\n  <br />Just removing globalmenu from the panel isn't enough to get past the
  issue.&nbsp; You have to delete (or rename) /usr/lib/gtk-2.0/modules/libglobalmenu-gnome.so\r\n
  \ <br />"
categories: []
layout: post
title: Gnome Globalmenu Hurts Too Much
created: 1257468903
---
I've run into multiple issues using gnome-globalmenu.&nbsp; I like it, but it doesn't play well with others.
  <br />
  <br />Its latest offense is that it causes the gnome screenlets manager to die on start-up with:
  <br /><strong>Attempt to add property GtkMenuBar::local to class after it was derived</strong>
  <br />
  <br />Just removing globalmenu from the panel isn't enough to get past the issue.&nbsp; You have to delete (or rename) /usr/lib/gtk-2.0/modules/libglobalmenu-gnome.so
  <br />
