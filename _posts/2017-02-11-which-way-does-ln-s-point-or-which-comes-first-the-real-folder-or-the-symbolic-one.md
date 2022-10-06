---
categories: []
layout: post
title: Which Way Does ln -s point (or Which Comes First, the Real Folder or the Symbolic
  One)?
created: 1486843740
redirect_from: /content/which-way-does-ln-s-point-or-which-comes-first-real-folder-or-symbolic-one
---
I hate "ln -s".  I can never remember which to put first -- the name I'm creating or the name which already exists.

    ln -s {target-filename} {symbolic-filename}

or

    ln -s {thing-that-exists} {new-thing-that-will-exist}

or

    ln -s {old-thing} {new-thing}
