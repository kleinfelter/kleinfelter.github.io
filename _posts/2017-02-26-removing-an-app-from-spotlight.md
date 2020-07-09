---
categories: []
layout: post
title: Removing an App From Spotlight
created: 1488143964
redirect_from: /content/removing-app-spotlight
---
I wanted to remove Evernote from Spotlight.  

It is easy enough to remove a Folder from Spotlight.  Just go to System Preferences >> Spotlight >> Privacy, and drag any folder from Finder into the list.  That folder is no longer indexed.

But the folders for Evernote, reported by others to meet this need, are ineffective.  (I rebuilt the Spotlight index and they came back!)
* ~/Library/Application Support/com.evernote.Evernote
* ~/Library/Caches/com.evernote.Evernote

So I went looking for the importer for Evernote:

    mdimport -L

That output includes:

    /Applications/Evernote.app/Contents/Library/Spotlight/EvernoteSpotlightImporter.mdimporter

So I deleted that Folder and then rebuilt my Spotlight index with:

    sudo mdutil -E /
