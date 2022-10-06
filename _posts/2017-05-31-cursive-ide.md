---
title: Clojure With the Cursive (IntelliJ IDEA) IDE
layout: post
---

I'm developing an app in Clojure, for personal use.  I *will* have a source-level debugger.  The only games in town are Counterclockwise (Eclipse), Cursive (IntelliJ), Visual Studio Code with the 'Clojure Code' extension, and Emacs.

If you are using Eclipse or Emacs for other things, you'll probably want to use them for Clojure too.  Otherwise, Cursive is your best bet.

I'm capturing my learnings/observations from an attempt to make the Cursive IDE my primary Clojure development environment. If you use it for commercial purposes, you have to pay an annual fee.  (Maybe the 'Clojure Code' extension for Visual Studio Code is ready for prime time if that becomes relevant).  You must request a new non-commercial license every 6 months, after a 30-day eval period.

Note: "IdeaIC2017.01" will be updated for newer versions.  The 1st and the 5th letters are both capital "i".

* Note: To uninstall
  * Drag the .app to the trash.
  * Let Hazel auto-delete the settings files.
  * Delete ~/Library/Application Support/IdeaIC2017.1
  * Delete ~/Library/Preferences/IdeaIC2017.1
  * Delete ~/Library/Caches/IdeaIC2017.1
  * Delete ~/Library/Logs/IdeaIC2017.1
  * Note: It looks like if you delete all of these things and then you re-install, you re-start the 30-day eval.
* Installing:
  * Download IntelliJ Community Edition from http://www.jetbrains.com/idea/download/index.html. I got version 2017.1.3.
  * Install it
  * Launch it
  * Do not import settings
  * Select the Darcula theme
  * Select the "I've never used IDEA" keymap scheme
  * Select "Create a launcher script" as /usr/local/bin/idea
  * On "Tune IDEA to your tasks":
    * Disable all the build tools
    * Enable git and github VCS
    * Disable all test tools
    * Disable Swing
    * Other Tools: Enable only Terminal, YAML, and XSLT
    * Disable Plugin Development
  * Do not install Featured Plugins
  * On the Welcome screen, select Configure > Plugins > Browse Repositories > search for Cursive > Install > Restart
  * Configure > Plugins:
    * Disable Groovy, Java Bytecode Decompiler, Kotlin.  Restart.
  * Open *any* existing Leiningen project or create a new, throw-away project. 
    * When prompted, decline EAP (beta) updates.
    * When prompted, Setup SDK.  /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk.  It should populate a whole bunch of Classpath lines.
  * Install "Dark One" color theme:
    * Download from https://github.com/yurtaev/idea-one-dark-theme
    * Unzip idea-one-dark-theme-master.zip
    * mkdir ~/Library/Preferences/IdeaIC2017.1/colors
    * Copy "One Dark.icls" to ~/Library/Preferences/IdeaIC2017.1/colors
    * Restart
    * PAY ATTENTION: IntelliJ IDEA > **Editor** > Colors & Fonts > Scheme = One Dark > When prompted, "For all IntelliJ IDEA"
* Define keymaps.  Preferences >> Keymap
  * Load file in REPL (either one): Shift-Alt-Cmd-F.  (To match Atom.)
  * Switch REPL ns to current file: Ctrl-N
* Define an IDE command (and assign a keystroke) to execute a REPL command:
  * *Tools→REPL→Add new REPL Command*
  * *Settings→Keymap*
  * See "REPL Commands" at https://cursive-ide.com/userguide/repl.html
* TAB key auto-completes intellisense
* Shift-F6 = rename symbol (under cursor and all references)
* Alt-up-arrow: expand selection to next semantic unit.
* Importing the "rebalance" project:
  * File >> Open >> Navigate to /Users/kevin/Sync/code/clojure/rebalance, and press the Open button.
  * edit core.clj from the project tree.
  * Run >> Edit Configurations. 
    * Press the "+" button.
    * Navigate to Clojure REPL/Local in the tree.
    * Run nREPL with Leiningen should be selected.
    * Press OK.
* You should now have a REPL toolbar in the upper-right corner, with a Run and a Debug icon, among others.  If you run/debug, you may see a message:
  * objc[47281]: Class JavaLaunchHelper is implemented in both ...
  * Ignore it.  It is inconsequential, difficult to suppress, and will go away with a future release of the JDK on Mac.
* Troubleshooting:
  * File>>Invalidate Caches seems to fix some problems.
  * Note: If the Cursive project gets hosed, go to the project directory and "rm .idea *.iml" and then re-import it.
  * Remember that src AND test have code, and a messed up namespace in one can affect ability to load the other.
  * Remember that when backing up a file within the project structure, you better rename .clj to .something-else, because it WILL compile .clj files.