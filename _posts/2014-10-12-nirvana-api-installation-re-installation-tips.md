---
categories: []
layout: post
title: Nirvana API - Installation / Re-installation / Tips
created: 1413128062
redirect_from: /content/nirvana-api-installation-re-installation-tips
---
This is useful for backing up Nirvanahq todo lists.

## Mac Install: 

* sudo gem install nirvanahq
* Edit /Library/Ruby/Gems/2.0.0/gems/nirvanahq-0.1.4/lib/nirv.rb and go to line 74 and change "rescue Exception => e:" to "rescue Exception => e" (remove the colon).
* nirv init
* Edit ~/.nirvanahq/config.rb and 
    * Update the value of user name to your Nirvana user name
    * Run this command to calculate the md5 of your password: md5 -s yourPasswordHere
    * Update the value of password to the md5 of your Nirvana password

## Cygwin Install:

* Run Cygwin setup and install
    * ruby
    * rubygems
    * gem install nirvanahq
    * Ensure that $HOME/bin is on your PATH
    * Edit ~/.gem/ruby/gems/nirvanahq-0.1.4/lib/nirv.rb  and go to line 74 and change "rescue Exception => e:" to "rescue Exception => e" (remove the colon).
* nirv init
* Edit ~/.nirvanahq/config.rb and 
    * Update the value of user name to your Nirvana user name
    * Run this command to calculate the md5 of your password: md5 -s yourPasswordHere
    * Update the value of password to the md5 of your Nirvana password

## Basic Operation:

* nirv version
* nirv help
* nirv backup
    * Dumps a full copy of your account to ~/.nirvanahq/backup.json
* nirv add "task text here"
* nirv add "task text here" -n "task note here" -t "Tag 1,Tag 2"

## Spiffy Tricks:

* Mac: Install DTerm.  Set up DTerm to activate on Ctrl-Space.  Create a shell script named 'nirva' which executes: nirv add "$*"
    * This lets you add an action item by:
        * Press Ctrl-space
        * Enter: nirva Your text goes here
* Windows: 
    * Run via SlickRun:
        * Install SlickRun.  Set up SlickRun to activate on Cmd-Space.  Create a command named 'nirva':
            * MagicWord: nirva
            * Filename or URL: e:\cygwin\bin\bash.exe
            * Start mode: Default mode
            * Startup path: E:\cygwin\home\WindowsLoginIdHere
            * Parameters: -tn rxvt-cygwin -g 100x5 -e /bin/bash --login -c '/home/WindowsUserId/bin/nirv-wrapper.sh "$I$"'
         * Create /home/WindowsUserId/bin/nirv-wrapper.sh, containing:

<pre><code>
#!/bin/bash
PATH="$PATH:/user/bin:/home/WindowsUserId/bin"
nirv add "$*" 2>&1 | grep -v deprecated
sleep 3
</code></pre>
