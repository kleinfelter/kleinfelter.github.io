---
categories: []
layout: post
title: Clojure Gibberish
created: 1447542617
redirect_from: /content/clojure-gibberish
---
If you see a word in a clojure program (e.g. apply, map, defn...) you can use Google to find out what it means.  Just search for "clojure" and the word.  Try that with something like curly braces or #' or '( or...  This makes it tough for a beginner to read code written by someone at a higher skill level.

This is a list of the non-word character sequences which have a special meaning in Clojure that I had to look up at one time or another.

* `"xyz"`
    * string containing xyz
* `#"`
    * Regular expression.  e.g. #"[A-Z]+" is a regular expression for a string of one or more upper-case letters.
* `'`
    * It designates a literal. If you put it before something, it means don't evaluate it.  The literal may be referred to as being escaped.
    * e.g. `'(1 2 3)` gives you a list with 1, 2, and 3 instead of attempting to call the function 1 with arguments 2 and 3)
* `{}`
    * map (or some might call it a hash table).  e.g. `{:a 1, :b 2, :fat "tuesday"}`
* `#{}`
    * set.  e.g. `#{:a :b :c}`
* `[]`
    * Vector
    * Arguments to a function are indicated as a vector, so you could be looking at formal parameters if you're inside a function definition.
* `()`
    * A list or a sequence.  Often escaped.  e.g. `'(1 2 3)`
    * Or you could be looking at a function call.  e.g. `(str "a" "b")`* `#(...)`
    * Define an anonymous function.  e.g.  `#(str "a" "b" %)`
* `%`
    * A single argument in an anonymous function
    * e.g. `#(str "a" "b" %)`
* `.`
    * It might indicate a Java function call.  e.g. `(.toUpperCase "hello")`
* `->`
    * thread-first macro.  Take the first argument and run it through a each of the listed functions as the first argument.  e.g. `(-> [9 1 2 4] sort str)` returns "(1 2 4 9)" (because sort returns a seq, rather than the type of its arg)
* `->>`
    * thread-last macro.  Take the first argument and run it through a each of the listed functions as the last argument.
