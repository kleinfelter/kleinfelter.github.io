---
categories: []
layout: post
title: Create a Mac OS X Finder Service
created: 1488218558
redirect_from: /content/create-mac-os-x-finder-service
---
Here are some notes on creating a Service for Mac OS X Finder.  This will add an item to the Finder Services menu (available under the Finder menu and also by right-clicking on a file in Finder).  This particular service will convert a simple .html file into a .rtf.

The basic commands you want to run on the file are:

* textutil -convert rtf -output "outputfile.rtf" "inputfile.html"
* touch -r "inputfile.html" "outputfile.rtf"

This will convert the file to RTF (first line) and copy the timestamps from the .html file to the .rtf file (second line).

1. Launch Automator
1. File >> New >> Service
1. Set: Service receives select **files or folders** in **Finder.app**.
1. Add an action: Run Shell Script.  Paste in the following bash statements:

        set -e    # Exit on error
        # This will convert simple (stand-alone) html files to RTF.
        
        html_to_rtf () { 
            d2="$(dirname "$1")" # Do NOT need to escape quote in $()
            f2="$(basename "$1" .html)"
            if [ -d "$d2/$f2.resources" ] ; then return 0 ; fi
            if ! textutil -convert rtf -output "$d2/$f2.rtf" "$1"  ; then return 1 ; fi
            if ! touch -r "$1" "$d2/$f2.rtf" ; then return 1 ; fi
            rm "$1"
        }
        
        for f in "$@" ; do
            g=$(echo "$f" | tr "[:upper:]" "[:lower:]")
            if [[ "$g" = *".html" && -f "$f" && -r "$f" ]] ; then
                html_to_rtf "$f"
            fi
        done

Testing an Automator Service is a bother.  You want to just press the Run button in Automator, to run it within Automator, but when you run it for real, you will have selected a file in Finder.  **For testing purposes only**, add a step to the beginning of your Automator steps to *Get Specified Finder Items*, and select some files to test with.  After you've finished testing, remove it.

File >> Save >> HTML to RTF

If you need to modify this service at a later date, it will be found in: /Users/*username*/Library/Services/HTML to RTF.workflow


