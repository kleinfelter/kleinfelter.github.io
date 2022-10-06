---
categories: []
layout: post
title: Getting Started With Clojure (On a Mac)
created: 1444590750
redirect_from: /content/getting-started-clojure-mac
---
Note: I don't give choices here.  If you're a beginner, you don't know enough to choose an option.  Sometimes choice is a bad thing because it overwhelms.

### Check to be sure you have Java.

    java -version

"java" only comes with the JDK.  You can add Java to your browser, but without the JDK, you don't get the "java" command-line command.

If you get "No Java runtime present, requesting install", you can dismiss the dialog and google for "Java SE Development Kit".  Go to Oracle and download and install the latest Java SE development kit.  It should be a 64-bit .dmg file. Open the .dmg and run the installer.

### Install Leiningen: 

        cd ~/bin
        curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
        chmod +x lein

* If ~/bin is not already on your path, edit ~/.bash_profile and add it to your path.  Then run" ` .  ~/bash_profile`"
* Execute the command "lein" once (for the first time) to install Leiningen
* Helpful lein command lines:
    * Start the Clojure "repl" (command-line interpreter)
        * `lein repl`
    * Create a new application (as opposed to library) project
        * `lein new app my-project-name`
    * Search clojars
        * `lein search $TERM`
    * Run the project in the current directory
        * `lein run`
    * Run tests
        * `lein test`

### Learn Basic Clojure:

I found these helpful:

* http://www.amazon.com/Living-Clojure-Carin-Meier-ebook/dp/B00W4DTCSW - If you already know how to program and you want to acquire Clojure efficiently and effectively.
* https://www.cis.upenn.edu/~matuszek/Concise%20Guides/Concise%20Clojure.html - reminders of what you read in Living Clojure.  (This was a little too terse for me, without Living Clojure to help.)

### Install an IDE (or an editor and use leiningen projects to build jars (and auto-download Clojure as needed) -- I haven't decided yet):

* Light Table - I'm sure this could be a wonderful IDE/editor.  When I tried a Clojure "instarepl", it exposed a bug in displaying the intermediate results.  I found the solution online, which was to update the Clojure plugin.  Of course, the directions said to click "upgrade", which didn't exist.  I eventually did a Command window search and found a command to search for plugin updates, which revealed the missing "update".  After I updated the Clojure plugin, I started seeing a bunch of "Invalid behaviors file" messages in the console.  The solution to that is to "just build from source".  No thanks.  I didn't really want to build an editor -- I just wanted to try editing a little Clojure code.

### Some Notes on Clojure

* Note that these may not be strictly accurate.  They are approximations/abbreviations/incantations to help remember some of Clojure.

* Comment: semicolon (;) through end of line
* Data:
    * **Integer** = 123
    * **String** = "abc"
    * **Ratio** = 1/2
    * **Decimal** = 12.3
    * **Keyword** = :abc
    * **Character** = \a
    * **Boolean** = true
    * **Nothing** = nil
        * (true? nil) is false; (false? nil) is false; nil is logically false, but it doesn't satisfy "false?"; (not nil) is true.
    * **List** = '(1 2 3)
    * **Vectior** = [1 2 3]
    * **Map** = {:one 1, :two 2, :three 3}
        * Commas are whitespace
    * **Set** = #{ 1 2 3}
* Functions:
    * **Function call** = (funcName arg1 arg2)
    * **Global** var = (def aVar aVal)
    * **Local** var = (let [aVar1 val1 aVar2 val2] expr1 expr2)
    * A **function to return a function** = (fn [parm1 parm2] expr1 expr2)
    * **Abbreviated function to return a function** = #(...) = (fn [arg1 arg2] (...))
        * There must be a function to call as the first item in ...  (See [this explanation](http://stackoverflow.com/questions/13204993/anonymous-function-shorthand).)
        * Args within the function definition are %1, %2 (or just % for a single arg)
    * **Name a function** = (def funcName (fn [parm1 parm2] expr1 expr2))
    * **Name a function** tersely = (defn funcName [parm1 parm2] expr1 expr2)
    * A set can be treated as a function which takes a value and returns that value if it is found in the set.  e.g. "(#{1 2 3} 2)" returns 2, but "(#{1 2 3} 4)" returns nil.
* Visibility - Visibility is controlled by namespaces:
    * **Qualify a variable with its namespace** name via a "/" = namespaceName/varName
    * **Change/define namespace** = (ns newSpaceName)
    * Variable with **current namespace name** = *ns*
    * Load a namespace = (require 'namespaceName)
    * Load a namespace and rename it = (require '[namespaceName :as newName])
    * Change namespace and load another namespace into it = (ns newSpaceName (:require [anotherSpace :as af]))
* Misc functions:
    * **identity** returns its argument.  e.g. (identity 42) returns 42
    * **quote** = do not evaluate this.  e.g. (quote aName) returns aName and does not evaluate it
    * **Terse quote** (apostrophe) = **'**aName
    * Is predicate true for each member of a collection = (every? predicate collection).  e.g. (every? (fn [x] (= x :cigar)) [:cigar :cigar])
    * Is predicate true for NO members of a collection = (not-any? predicate collection).  e.g. (not-any? (fn [x] (= x :goodRepublican)) [:republican1 :republican2])
    * Is predicate true for some members of a collection = (some predicate collection)
    * (if expr1 expr2 expr3)
    * (if-let [var1 val1, var2 val2] expr2 expr3)
    * (when expr1 expr2) -- This is just like (if expr1 expr2)
    * Multi-conditional = (cond bool1 expr1 bool2 expr2 bool3 expr3))
    * select...case on a single variable = (case var val1 result1 val2 result2 val3 result3 resultForNoMatch)
    * (println var1 var2)
    * Sorta like BEGIN/END in Pascal: (do (expr1)(expr2))
    * (for [var1 [val1 val2]] ...)
    * (for [var1 [val1 val2] :let [var3 val3 var4 val4] ] ...)
    * (for [var1 [val1 val2]] var3 [valA valB] ...)  = val1+valA, val1+valB, val2+valA, val2+valB
* Destructuring:
    * (let [a 1] ...) = normal let
    * (let [[a b][1 2]] ...)
    * (let [ [ a b :as orig] [1 3 5]] (println orig))
    * (let [{flower1 :flower1 flower2 :flower2} {:flower1 "red" :flower2 "blue"}] ...)
        * The left side looks backwards, but think of it as assigning the :flower1 value to the var flower1.
    * (let [{flower1 :flower1 flower2 :flower2 :or {flower1 "missing1" flower2 "missing2"} } {:flower1 "red" :flower2 "blue"}] ...)
    * (let [{:keys [flower1 flower2]} {:flower1 "red" :flower2 "blue"}] ...)
* Idioms:
    * Instead of "(not (empty? aCollection))" use "(seq aCollection)".  It is OK to use "(empty? x)" -- just not "(not (empty? x))".
    * "?" at the end of a function indicates that it returns a boolean (is a predicate).  e.g. true?  nil?  empty?
    * Multi-conditional = "(cond bool1 expr1 bool2 expr2 :else expr3))" is idiomatic for "(cond bool1 expr1 bool2 expr2 true expr3))"
    * Variable name meaning "I don't care about this value" = "_".
* Definitions
    * **Predicate** (paraphrased from Wikipedia): A statement that may be true or false depending on the values of its variables. An operator or function that returns either true or false.

<table>
    <tr>
        <td>Return the variable, not its value</td>
        <td>(var variableName)</td>
    </tr>
    <tr>
        <td>Return the variable, not its value (abbreviation for var)</td>
        <td>#'variableName</td>
    </tr>
    <tr>
        <td>Convert the list/set/map to a "seq" (a generic Clojure sequence of items)</td>
        <td>(seq listSetOrMap)</td>
    </tr>
</table>

* For short-form anonymous functions, %1 %2 %3... represent positional parameters.  % is equivalent to %1.  
* apply - takes a seq and passes the elements to a function.  i.e. If you have something that looks like `(f [1 2 3])` and you want `(f 1 2 3)` then you should `(apply f [1 2 3])`
