---
categories: []
layout: post
title: Some Notes on AppleScript and Folder Actions
created: 1383183837
redirect_from: /content/some-notes-applescript-and-folder-actions
---
Here are some things I've learned about AppleScript and about Mac OS X "Folder Actions".

* A "folder action" is a service that watches a folder for file system changes (create new file, create new folder, update file, etc.)
* I hate AppleScript.
* To create a new Folder Action using a Workflow (i.e. an Automator program):
    * Start /Applications/Automator.app
    * At the "Choose a type for your document" prompt, choose "Folder Action"
    * Set the "Folder Action receives files and folders added to" to the folder you want to watch.
    * Add some actions.  For starters, you might want to add an "Ask for Text" action, with a nonsense question.
    * File/Save - Save it with a good name (and don't specify a folder).
    * Drag and drop a file in your watched folder and confirm that you get the expected message/question.
    * Quit Automator
    * It will store the workflow in "Library/Workflows/Applications/Folder Actions" under your home directory.
    * Do NOT store your workflows in "/Library/Workflows/Folder Actions".  There are circumstances where this will happen by accident, and then you won't be able to edit them again.
* To create a new Folder Action using an AppleScript:
    * Create an AppleScript using "/Applications/Utilities/AppleScript Editor.app".  As a minimal example, you might make a script containing this:
    on adding folder items to this_folder after receiving these_items
        display alert "Sample title" message "Sample message"
    end adding folder items to
    * Compile it
    * Save it under "~/Library/Scripts/Folder Action Scripts" (you may have to create the folder)
    * Do NOT store your scripts in "/Library/Scripts/Folder Action Scripts".  There are circumstances where this will happen by accident, and then you won't be able to edit them again.
    * Attach it as an action to your folder:
        * Right-click the desired folder.
        * Choose Services/Folder Action Setup...
        * Choose the script you created.
        * Test it.
* I have a Folder Action to watch for files to appear in a "Watched for Import" folder.  When this happens, I run "~/Library/Scripts/Folder Action Scripts/Evernote-Folder-Watcher", to import the file into Evernote.
    * It is not enough to simply edit the Evernote-Folder-Watcher script.  Relaunching Finder after editing won't do it.
    * Right-click on the folder.
    * Choose _Services_, then _Folder Action Setup..._
    * On the _Choose Script to Attach_ dialog, hit cancel
    * Select the script and press _Edit Script_
    * Note: If you edited it without following this process, and you want to get it to pick up your changes, follow this process and make a trivial change and it will start using the current edition.
