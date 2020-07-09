---
title: Programming Languages for the Occasional Programmer
---

*Work in progress (a 'living document')*:

I'm an occasional programmer.  I might code intensively for a few months, then do other things, then return to programming.  I don't get to spend all day, every day, coding on any project.  I need to be able to productively pick up a project after having set it aside.  I need to be able to program in an environment without being intimately familiar with every nook and cranny of the environment.

I need to be able to write code for Windows, Mac, and web (client and server side), and Linux server administration.  I have an interest in data science, so the ability to work there would be helpful.  Of necessity, a discussion of languages will also include a discussion of platforms related to those languages.

Fewer languages is better than many languages.  I've dabbled in many.  The fewer I have to try to stay current in, the more time I can spend coding, rather than re-learning.

### Popularity ###

Current popular multi-platform general purpose languages (in many rankings): 

* JavaScript - way, way most popular at GitHub
* Java
* Python
* Ruby
* Much lower frequency: Go, C, TypeScript, Scala, Clojure, R, Perl, Julia, Haskell

### Clojure and ClojureScript

Conceptually, I like Lisp.  In reality, I run into a problem with un-typed languages.  After I pass a string into a routine expecting an integer, and it bubbles down through a half-dozen layers before it blows up, and I spend a long time tracking down where the defect was *injected* (as opposed to where it was *detected*), I then start writing code to check the type of actual parameters.  Checking type at runtime is stupid; it is more effective to check at compile/load time.  An occasional programmer really needs typing of formal parameters.  clojure.spec (requires Clojure 1.9, released December 2017) is the Clojure way to check this at runtime.

Clojure/ClojureScript solves the problem of one language for client and server.

I find coding in Clojure to be pleasant and rewarding, but the moment I start trying to test/run the code, it gets real frustrating, real fast, because trivial changes result in run... damn... run... damn... run... cycles.  

Slow startup is a problem for some categories of scripts.  e.g. If you wanted to write a utility like 'cat' or 'more'.

Clojure can be annoyingly pure sometimes:

* It won't let you prematurely exit a function.  Often you could remove a level of nesting from a function if you could code something at the top of the function like "if argument is bad then return nil".

Debugging - You lose the strict source line to what-is-happening-now relationship due to lazy eval.  This is worse in ClojureScript, where the compiler minifies the JavaScript

User-hostile error messages.

And Clojure doc is written for the person who already knows the answer.  (I'm not the only person to notice this.)

I think the Clojure ecosystem might be really appealing if I coded in it all day, every day.  It appears to serve the SME really well.

I did about 6 months of part-time programming in Clojure, writing an app to rebalance my complex investment portfolio.

### Ruby ###

Ruby is a pleasing language for small projects.  I really Matz's notion that using the language should please the programmer.

In common platforms such as Rails, there is *so* much magic happening behind the scenes that it takes me a couple of weeks to refresh myself on what is really happening, every time I pick it up.

The absensce of typed formal parameters leads me back to run-type type checking.  An occasional programmer really needs typing of formal parameters.

Ruby really has to be one of multiple languages.  You can't *really* do your browser UI in Ruby.

The gyrations (tools) necessary in order to effectively develop with multiple versions of Ruby on a single system is off-putting.

###  Java ###

If you're going to organize an expedition to Mt. Everest, you need lot of supplies and lots of logistics.  If you're walking to the corner bodega, you *could* apply the same level of planning and effort, but you'll probably just put on your shoes and walk to the corner.  Java is really a good tool for the programming equivalent of an Everest expedition.  It is probably the tool you want if you're going to have 100 people working to create a mega-app.  But it applies the same level of congitive overhead when you build a little utility.  Java makes EVERY trip an expedition.

Someone captured the essence of Java nicely.  Java is the COBOL of the 21st century.  Verbose.  No fun to work in.

Yes, it does have typed formal parameters.  Yes, you can write Java that compiles to JavaScript to run in the browser.  Yes, you can write cross-platform GUI apps in Java.

Slow startup is a problem for some categories of scripts.  e.g. If you wanted to write a utility like 'cat' or 'more'.

I don't want to write in Java, and, frankly, I don't like running Java apps.  Even if you use something to give you a native look and feel, they still *feel* like Java apps.

### Python ###

I want to like Python.  I don't quite.   I can live with the indentation thing.  Maybe I just need to do more coding with it.

Python 3.6 does support optional typing of formal parameters.  I like the concept of optional typing, if all of the published libraries come with typing.  I want *me* to be able to dispense with typing while hacking, but I want to see typing whever I use someone *else's* code, and I want to throw a switch and require typing when I begin to production-ize my code.

Pyjamas, Brython, Skulpt, PyPy, Transcrypt: might let you write your browser-side code in Python.   Need to check which of those actually works on iPhone and Android browsers.

It runs on almost *all* platforms.  It is used in data science (behind R in popularity, of course).

"Batteries included" is an effective philosophy.  "There's only one right way to do it," chaps my butt.  As philosophers, I like Matz and I'm not sure I like Guido.  (Guido may be a fine person to know; I'm just referring to his programming philosophy.)

It doesn't really fit well with functional programming, although you can bend it to your will.  I wish it supported a flag to say "make data immutable."

Global Interpreter Lock - only one thread per interpreter can be active at a time.

Python has similar virtual-environment issues as Ruby, when you need to develop with multiple different versions.

### JavaScript, TypeScript ###

JavaScript has the appeal of one language for client and server sides.  Yes, JavaScript has good stuff, but you have to know which pieces to avoid using.  TypeScript supports optional types, solving my need for typed formal parameters (except that many JavaScript libraries don't come with types).

Electron... I want to use Electron, without the footprint of electron.  File size I can live with; huge RAM use, not good; high CPU use, exhausts my battery.  Shucks, with the Chromium footprint, I'm reminded that I have to switch from Chrome to Safari on my Macbook whenever I go on battery power.

If you get node.js involved, slow startup is a problem for some categories of scripts.  e.g. If you wanted to write a utility like 'cat' or 'more'.

If you're going to use JavaScript, use a lint.

I love this quote

> The thing is, there is a mass psychosis about JS and it’s like everybody is pretending that it isn’t awful.

And this one: "According to Namcook Analytics (Table 16), JavaScript is one of the least productive programming languages in the world (measured by “economic productivity” in terms of number of work hours to deliver 1,000 function points)"

### Go (golang) ###

Statically typed.  Simple by design.  Fast compile.  Quick learn.

Verbose. Because it chooses to leave things out of the language, developers must create them.

"The language could be described as C with training wheels."

I love this quote from movio: "For the first time ever, we actually read the language spec when we’re unsure of how something works. That's how simple it is; the spec is readable! For my average-sized brain, this actually means a lot. Part of my frustration with Scala (and Java) was the feeling that I was never able to get the full context on a given problem domain, due to its complexity."

Another good quote: "if your main focus is around data science you might be better off with the Python stack."

### Scala ###

Functional.  Strongly typed.

SLOW compile.  Slow JVM startup for simple apps.

Rumored to have a somewhat hostile community.

### Haskell ###

?

### Rust ###

"Rust is a programming language that’s focused on safety, speed, and concurrency."  It is a systems programming language.  Think of it as C, with functional features and memory safety.

Static typing; inferred types.  By default variables are immutable.  Functional.

In function signatures, you must declare the type of each parameter.

`x = y` may invalidate y; use `x = y.clone()` if you really want a copy.  Only one reference to heap data at a time.


### Smalltalk ###

This has some interesting assertions: https://medium.com/smalltalk-talk/smalltalk-s-proven-productivity-fe7cbd99c061

### Pascal ###

Yeah, other than Delphi, nobody really programs in Pascal anymore.  I really loved that "train track" syntax diagram.  Pascal was the last language where I really felt, "I know every iota of this environment."

### VB5 ###

Yeah, it is a dead language and Windows-only.  It was really a spiffy tool for exploration.  You could change code on the fly, half-way through a function, and continue execution.  You could explore the methods of an object at run-time.  Lots of support for the occasional programmer.

The language itself was not real interesting.  The built-in bugs were frustrating.  The *environment*  support for tinkering has never been surpassed.

### Bugs ###

Interesting chart: https://medium.com/javascript-scene/the-shocking-secret-about-static-types-514d39bf30a3 shows bug density (bugs per LOC).  Lowest 5:

* Clojure (lowest)
* Go
* Erlang
* Ruby
* Scala


Clojure, Go, Erlang, and Ruby are about 1/2 the density of Scala.  Everything else is worse.  Python and Java are similar at about 4x the level of Go.

The article also says, "You want to reduce bugs? Use TDD. You want useful code intelligence tools? Use static types."

### Most Loved ###

Per https://fossbytes.com/most-loved-and-most-hated-programming-languages/ , the most loved languages are:

1. Rust
1. Smalltalk
1. TypeScript
1. Swift
1. Go
1. Python
1. Elixir
1. C#
1. Scala
1. Clojure
1. JavaScript
1. F#
1. Haskell
1. SQL
1. C++
1. Julia
1. Java
1. R
1. Ruby
1. C

And the most hated:

1. Visual Basic 6
1. VBA
1. CoffeeScript
1. VB.NET
1. Matlab
1. Objective-C
1. Assembly
1. Perl
1. Lua
1. Hack
1. Groovy
1. Common Lisp
1. Dart
1. Erlang
1. PHP
1. C
1. Ruby
1. R
1. Java
1. Julia