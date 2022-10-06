---
categories: []
layout: post
title: Text Editors
created: 1447354446
redirect_from: /content/text-editors
---
I'm an intermittent programmer.  I program for a while, then I work on other things, then I do some more programming.  I may take a break of months or even years between programming sessions.  I need a text editor, suitable for programming, that doesn't require intense familiarity with it in order to be moderately productive.

Years ago, I was pretty good with emacs.  I can do simple text editing with vi today.  For both of these editors, my skills have a tendency to quickly fade to such a level that I just can't be productive.  They are great editors -- if you use them daily.

I'm currently learning Clojure, and I really want an environment that supports source-code debugging, with breakpoints and variable inspection, when I invoke a function from the REPL.

**The Clojure Summary Before the Details**:

* Atom is a decent Clojure editor, but no source-level debugging.
* Cursive is irksome; it has opinions about how to enter code which don't sit well with me, but it has a working debugger.
* Visual Studio Code with 'Clojure Code' shows promise.  It is a good editor.  The debugger is twitchy; it might be really good soon or it might remain twitchy.
* None of the others come close.

If you are going to use a debugger, your options are Emacs, Eclipse, Cursive, or Video Studio Code.  The only debugger which is *close* to prime time, in an editor I can bear, is Cursive.

What I need:

* Plain text editing.
* Syntax highlighting for most, if not all, languages.  If an obscure, new language piques my interest, I want my editor to support it.
* REPL support (for suitable languages).  I don't want to have to manually copy/paste between my editor and my REPL.
* Fast load time.  (That pretty well rules out Eclipse.)
* Enough menu/prompting support that I don't have to be *current* in my use of the editor.  (This rules out vi and emacs.)
* Rainbow paren support.  Yup.  I do Lisps.  I need to see which paren I missed.
* Windows and Mac.  Linux is nice too.  Windows version should run from a flash drive, so I can run it on work machines where I'm not allowed to install software.
* Some sort of file browser.  Show me the directory/file tree of my project folder.  (Show/hide capability necessary.)
* Stable.  You can still be adding features, but I need my copy of it to be rock-solid.
* Not real expensive.  I wouldn't mind spending $100 once, but I can't pay a recurring charge since I use it infrequently.  If it is non-free, I need a full-featured trial period long enough to decide to commit to it.
* Attractive (subjective) gets bonus points, but it is not a requirement.

At the moment, I'm interested in Clojure, so that gets a little weight, but I'll need good Python support, plus dozens of others.  I don't want a Clojure-only environment. Desired Clojure REPL integration:

* Load file in REPL
* Switch REPL to namespace of current file
* println output to REPL
* Execute selected code in REPL
* REPL is conveniently located/accessible
* Don't make me go through something terribly awkward to send code to the REPL
* Source code debugging (e.g. breakpoints, examine variables, etc.)

Candidates in the running:

* **Eclipse** - way too slow to start.  Has good REPL integration. Rainbow parenthesis (via Clockwise).  I might have to overlook the slow start. (It takes 10 seconds!)
    * Windows: Has to be installed, but I'm allowed to install this on work computers.
    * Clojure: It supports breakpont debugging for Clojure.  I tried it.  I didn't care for it.  It said a variable was null when it had been set; when I added a later use of the variable, it was able to show the value.  I think it might just be agressive about discarding variables when they are no longer used.    The debug perspective doesn't include the REPL output pane.  It does not have parinfer.

* **Light Table** 0.8-alpha - maybe...  It is rough around the edges.  It sure has nice REPL support for Clojure.    Configure-by-editing-config-files knowledge will go stale quickly.
    * Rainbow paren - see https://github.com/LightTable/Rainbow.  It doesn't really seem to work well.  I see adjacent parens getting the same color.
        * Try https://groups.google.com/forum/#!topic/light-table-discussion/NfVDHYoXRjM
        * With both of those applied, it seems to work
        * Supports Clojure, Python (2 and 3), JavaScript. 'Real-time' feedback as you edit. Abandoned by its creator as of January 2016. Open sourced to GitHub.
    * It does support parinfer via a plugin.
    * Windows: Looks like it runs 'portably' from any directory, including a flash drive.

* **Sublime Text 3** build 3083 - looks adequate.  Starts fast.  Clojure REPL seems a little weird with its use of load-string.  Configure-by-editing-config-files knowledge will go stale quickly.
    * Reportedly has rainbow paren support.  I can't find it.
    * Windows: Portable edition exists

* **Atom** - Linux, Windows, Mac.  Syntax highlighting for most languages.  Many plugins.

    * Clojure
        * I occasionally have to restart it when it starts throwing errors in the REPL.
        * Using these plugins, its is a very usable environment, but it does NOT have a debugger:
            * language-clojure
            * tool-bar
            * proto-repl
            * ink
            * See: http://worace.works/2016/06/14/good-enough-clojure-setup/

* **Visual Studio Code**
    * Clojure with the 'Clojure Code' extension (a.k.a. jamesnorton.continuum).
        * Looks interesting.  The debugger is marginably usable, but looks more like a proof-of-concept right now.  It works if you get it just right, but it gives stack traces instead of messages like 'unable to set breakpoint because I cannot find your source file.'
        * The developer is responsive and helpful via [gitter](https://gitter.im/vscode-continuum/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge).
        * The debugger crashes if you don't add a ```:source-paths ["src" "src/main/clojure"]``` to project.clj.
        * I had to often manually kill the leiningen process which backs the debugger.  If it errors off, you can't stop and restart it from the IDE.
        * It's a nice editor. It opens fast and it is multi-platform.

* **Cursive**

    * I finally got the debugger to work. It got confused because I copied core.clj to backup-core.clj.  It compiled and loaded both, and since they both implemented the same functions in the same namespace, thins went poorly.
    * Learning: There is no way to view the value of a lazy seq in the Clojure debugger because you can't evaluate expressions at a breakpoint and the lazy seq isn't 'realized. UPDATE: There is an Evaluate Expression icon on the right end of the Debugger panel's toolbar.  (It looks like a little calculator.)  You can use "(first lazy-seq)" or similar functions to realize the lazy seq.
    * Learning: Paste behaves in unexpected ways, converting newlines into "\n", among other things.  Swap the key bindings for Past and Paste Simple in order to get the expected behavior on Paste.
    * At one point, it started reporting a dependency loop and refusing to load files into the REPL.  I closed IDEA, deleted the .idea and the .iml files/directories, and re-opened the project directory with IDEA, and it created a new project.  Same problem. I deleted everything from the target folder too.  No good.  I created a new project in a new directory and copied files to recover.  I *think* this may have been the result of changing namespaces in my test files.  I had to do that because I tried to make some functions private (via "defn-") and then I had to be in the same namespace in the test file in order to use them.  Learning: "defn-" is an advanced subject.  Learning 2: Cursive likes to 'understand' the code and that can bewilder me.  This is similar to the core.clj to backup-core.clj problem mentioned above.  This "understand the code" philosophy of Cursive is a risk -- when it fails, it fails hard.  It may be the case that File >> Invalidate Caches/Restart was part of the solution.



    Candidates that did not make the cut:

* emacs - too hard to remember after 12 months off.  Emacs is a great tool if you use it every day, but I'm an intermittent coder and the keystroke memory fades too quickly. If and only if you're already a heavy Emacs user, the CIDER plugin is the right tool for Clojure.
* JEdit: REPL - basic support is there; not full-featured.  I don't see rainbow paren.
* Komodo Edit - no REPL support
* SciTE: REPL = no; rainbow paren = no
* Sublime Text 2 - REPL gap.  SublimeREPL stopped working with this version.
* vi - too hard to remember after 12 months off.  For Clojure, use the Fireplace plugin. See [this guy's writeup](http://blog.venanti.us/clojure-vim/) on the Clojure vim toolchain.

-----

Things I hated while working on a Clojure project:

* **Atom** - I used Atom for a couple of weeks, several hours a day. Extensions: parinfer, proto-repl, language-clojure.

    * At first, I hated parinfer.  Then it became a must-have feature.
    * Every once in a while, the REPL started throwing an Ink exception on each enter key.  I can't reproduce it on demand, but it made me have to restart.
    * I really, really want a source-code debugger.  Other than that, this is a decent environment.

* **Cursive** - I used Cursive for several days.

    * I can't disable "Emacs Tab" behavior.  I bound the Tab keystroke to the Tab action.  I unbinded the Emacs Tab behavior.  I still get Emacs Tab behavior when I press Tab. This is because parinfer mode (which I love) overrides Tab to make it be Emacs Tab.  I emailed with the developer and Cursive overrides the Tab action, not just the tab key, so you can't even do something like binding ^T to the tab action.  Settings >> Keymap >> Editor Actions >> Emacs Tab -- this simply doesn't work for disabling Emacs Tab with Cursive.
    * Up-arrow is a little wonky in the REPL.  It is easy to move it up through a multi-line expression, and then accidentally jump to the previous command in the history.
    * It tries really hard to understand the code.  When it works, it is impressive.  When it fails, it fails hard.  I've twice been nailed by it compiling things and merging them into its 'mental model' which I didn't intend.  This is high risk of project-blocking issues.
    * It is really nice, but also really frustrating.
* **Visual Studio Code** - with "Clojure Code" extension.
    * The debugger is not ready for non-hacker users. I think it works, but it is touchy and it simply crashes when an error message would be appropriate.
    * I'm all the time having to "killall java" to kill off broken REPLs running in the background.

* **Eclipse with Counterclockwise**.  I used this for a few hours.

    * It starts really slow.  I could get over that.
    * It uses Ctrl-P and Ctrl-N to move up/down the REPL command history (instead of the up/down arrows, like everyone else).
    * It doesn't do parinfer. (It does paredit.)
    * Eclipse is the GUI Emacs. So many obscure actions and keystrokes, so hard to find and remember.
    * I couldn't get dark color themes to apply to anything except the editor pane.  I want to change the colors of all those other panes too.  (I'm using stand-alone Counterclockwise; maybe this works with full Eclipse?)
