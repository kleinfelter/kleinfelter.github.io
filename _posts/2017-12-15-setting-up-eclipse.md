---
title: Setting Up Eclipse
layout: post
---

Setting up Eclipse for Java, Python, and Clojure


* Ensure you have Java 8 JDK (run "javac -version")
* Download Eclipse from https://www.eclipse.org/downloads/
    * Select "Download Packages" and install "Eclipse IDE for Java Developers".
    * I got the "Oxygen 1a" version.
* Launch Eclipse
    * I set my workspace to ~/Sync/Code and I made it my default location.
    * Help > Eclipse Marketplace > search for pydev.  Install pydev (all features). Restart when asked.
    * Help > Eclipse Marketplace > search for StartExplorer.  Install. It is unsigned. Restart when asked.
    * Help > Eclipse Marketplace > search for counterclockwise.  Install. It is unsigned. Restart when asked.
* Note: It takes about 8 seconds to launch before installing Counterclockwise. CC adds another 3-4.  Slow for an editor, but OK for an IDE.
* General Eclipse Configuration:
    * In the upper-right corner, to the right of "Quick Access", you'll see some icons.  Right-click on any of them except for the first one.  Choose "Show text".  These icons allow you to quickly switch Eclipse "perspectives."
    * Install "Eclipse Moonrise UI Theme" via Help > Eclipse Marketplace.
    * Install Eclipse Color Theme plugin.
    * Preferences > General > Appearance.  Select "Appearance" and set the theme to "Moonrise (standalone)".  There is a "Color Theme" in the hierarchical menu.  Don't use that one for this step.  Choose Appearance and ON THAT TAB select the theme.
    * Preferences > General > Appearance > Color Theme.  Select Color Theme from the hierarchical menu; not on the Appearance tab.  Select "Vibrant Ink" color theme.  You have to do both themes in order to get the ancilliary panes to be dark.  Vibrant Ink only colors the editor.
    * I was getting black on black in the Package Explorer.
        * Preferences > General > Appearance > Colors and Fonts.  Search for "Uncommitted Change (Foreground)". I set it to FFADA8.  This fixed some nodes in Package Explorer.  Editing "Ignored Resources (Foreground)" got the others. 
    * Still about 12 seconds to launch Eclipse...
* Clojure Eclipse Configuration:
    * Preferences > Clojure > Editor > 
        *  Editor text autoshift
        *  Highlight matching brackets
        *  Displayed tab width = 2
        *  On file launch, switch the Repl...
        *  Start editors in strict/paredit mode
        *  DO NOT: Escape text when pasting...
        *  Tab reindents the current line
        *  Auto activate code completion
        *  Display namespace in tabs instead of file name
    * Preferences > Clojure > General.  Turn OFF "Launch REPLs with cider-nrepl".  Otherwise, your REPL will just die for no reason, after being idle for a few minutes and at random times.  It is a known problem. 
    * Mac users - REPL command history is via Ctrl-UpArrow and Ctrl-DownArrow.  These have Mac meanings, so redefine them to use Cmd instead of Ctrl:
        * Preferences > General > Keys.  Search for "command from repl".  
* Eclipse elements to be familiar with:
    * Java perspective
        * Package Explorer - Left panel.  Browses the file system.
            * To launch a REPL without loading a file: Select the project in the Package Explorer; Run > Run Configurations > Clojure > (pick a configuration) > Run.
				* Source code - Main panel in the middle.  IF a repl is running, you get fly-over syntax help.  (Clojure > Load file in repl. There are other ways to launch a repl, but you don't seem to get fly-over unless you load the file in the repl.)
				* Outline (a.k.a. namespace browser) - Right panel.  Lists the functions in the currently selected source file.  Use the sort icon at the top, to choose between show-in-alpha-sequence and show-in-source-file-sequence.
				* Bunch-of-views-at-bottom-of-page: There are several here in a single panel.  
				    * The ones I find useful:
				        * Console - shows output from println.
				        * REPL
				    * The ones I closed:
				        * Problems, Javadoc, Declaration

Things to do or look into:

* Alt-L brings up a Leiningen menu.  You can Launch Headless REPL.  You can run 'lein anything here' in the current project directory.
* You can generate a new Clojure project via File > New > Clojure Project, but it uses the 'default' project, which is a library.  You probably want to drop to the command prompt and use ```lein new app app-name-here```
* When you generate a new Clojure project from Eclipse, it appears to always put clojure 1.6 in the generated project.clj.  Find this line in project.clj and set it to the Clojure version you are using: ```:dependencies [[org.clojure/clojure "1.6.0"]]```
* Note: It takes almost 20 seconds to launch a Clojure repl in Eclipse.  Can I speed that up?
* Refactor this page, to move getting-started-with [Java/Python/Clojure]-in-eclipse to separate pages.
* Look into Clojure JUnit integration via https://github.com/mikera/cljunit
