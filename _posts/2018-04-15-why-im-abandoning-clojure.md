---
title: Why I'm Abandoning Clojure
---

Clojure is a lovely language idea.  It is elegant.  It is clever.

Clojure is an abysmal language reality for my purposes.

* 35 lines of java dump for a syntax error?  It makes me miss the original Wirth Pascal compiler, which seemed to have the singular error message "Syntax error, possibly missing semicolon on line above."
* I really, really want compile-time type checking on my parameters.
* If I run my program via "lein run", I have no trouble reading a data file.  If I package it up into an uberjar, the code fails.  I'm supposed to master class loaders just to be able to read a file when I package my app as a jar?  I'm sure that Clojure and Java are doing something that is absolutely essential for somebody, but the environment is making simple stuff hard, and I won't tolerate that.
* I insist on an interactive debugger.  You can actually get one via the Cursive IDE, and you can sorta, kinda get one via a plugin for Visual Studio Code.  The Cursive one actually works... until it freaks out and you have to either restart the REPL or you have to do something called "Invalidate Caches/Restart".  (There's no real indication whether your observed bad behavior is a bug in your code or if you need to invalidate caches.  It's just a Hail Mary you try when you don't like the results you're getting.)  The plugin for Visual Studio Code -- I'm sure it works for its developer, but I really tried to make it work.  Maybe someday.  If the language doesn't have an interactive debugger, it's just plain immature in my book.
* I want to be able to code a 'premature return' from a function.  Yeah, I know it's 'unnecessary.'  But I'll tell you, it really simplifies real-world code when I can code if-exceptional-condition-return-error.  The Clojure way seems to be to just issue a stack trace on bad data.
* There's an awful lot of cognitive overhead for an occasional programmer.  In addition to the language itself, you've got Leiningen and a baroque directory structure to re-master, every time you take 6 months off from programming.  It reminds me of J2EE, and that's the epitome of excess cognitive overhead.