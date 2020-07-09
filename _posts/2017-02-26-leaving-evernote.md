---
categories: []
layout: post
title: Leaving Evernote
created: 1488126865
redirect_from: /content/leaving-evernote
---
Evernote does not encrypt data at rest.  Evernote does not apply "zero knowledge" encryption (where data in encrypted on the client and the provider has no ability to decrypt the customer's data).

I'm sure Evernote is a fine company, but I see no reason to believe that their security team is any sharper than their development team, and there have been many defects in the application through the years.  Eventually, I can expect a breach.  I used to use Evernote as my file cabinet.  I've decided it is simply irresponsible of me to continue to store tax records, medical records, bank statements, etc. in a cloud-based product which does not apply zero knowledge encryption.

**Evernote, I'm leaving you.  It will be a difficult separation, but I'll manage somehow.**

Some things I really liked about Evernote:

* I use a Mac.  My wife uses Windows.  We both need access to our file cabinet.  Evernote made that easy, and kept us synched.
* The file cabinet metaphor has its limits.  Not all data fits into a single spot in a hierarchy, plus lots of my stuff gets stashed in 'the big pile.' Evernote's search tools just work better than Spotlight for me.
* Separation of documents from app data and programs.  Spotlight likes to show me every file.  99% of the time, I'm searching for a *document*.  (Document includes saved web pages.)

I'm going to capture my strategy for leaving Evernote here.  I'm going to capture the problems I encounter.  I'm going to capture the reasons I do what I do, so that I won't forget and revert.

##Requirements:

* The main parties:
    * Bad guys must not be able to access documents. (*Secure*)
    * My wife and I have to be able to *find* the right documents quickly. (*Accessible*)
    * I/wife/executor should be able to get to it if my house burns to the ground and I get nothing out.  (*Persistent*)
* Must be able to export the documents (unless they live in the file system as well-titled files), in case the app/service is withdrawn.
* Access when I'm away from home is a nice-to-have, but not a requirement.

##Alternatives:

* **Continue with Evernote as is**.  Why rejected: Unacceptable security risk of unencrypted data on server.  Meets all other requirements.
* **Continue with Evernote, making all notebooks local-only**.  Why rejected: Not accessible to wife on daily basis. (Executor could get it from my off-site backups.)  Meets all other requirements.
    * Note that simply copying the database from my Mac to my wife's PC.  Windows and Mac Evernote use different database formats.
* **Store documents in the file system**.  Plain old notes (as would be composed in Evernote) get stored in RTF or HTML or Markdown for portability.  Not as accessible.  Meets all other requirements.
    * My local file system is encrypted, as is my wife's - providing security.
    * My local file system is backed up off-site with a service - providing persistence.
    * Spotlight (Mac) and Windows Search are just not as good at finding the right file as Evernote's search and display.  
* **Store documents in the file system, auto-import new/updated documents into *local-only* Evernote**. Synch files with my wife.  Never *update* an Evernote document from the Evernote UI.
    * If I could pull this off, it might meet all requirements, with the down-side of doubling my data size.  I currently have 5 GB in Evernote.  That's not a terrible cost.
    * Or turn this around and *only* update the documents in (local) Evernote, export the recently updated items, and sync via the file system to my wife's PC.
* **Migrate Evernote to OneNote**. OneNote meets the security requirement technically, but not practically; it misses the export requirement.
    * Does not store data locally on the Mac.  That's a big miss on accessibility.  I'm not going to rely on Internet availability to get my documents.  If MS drops the service, I lose Mac access.
    * You can password protect a OneNote "notebook section."  Microsoft *says* they can't decrypt it.  You may have to protect it using the desktop client - it isn't clear that www.onenote.com can add the password.  
    * You have to remember to password each new section and you have to enter the section's password to open it.
    * "Password-protected sections aren’t included in notebook searches. To include a protected section in a search, you’ll have to unlock the section first.")
    * Export can create only a single file for exports.  i.e. You can export a single note to a document or you can export an entire notebook to *one* document.

**What I really want is the Evernote user interface on top of the native file system**.

##Things I'm Trying In Order to Make Spotlight a Better Fit

If I'm going to use Spotlight, I need to make it find the documents I'm looking for most often.

* Change indexing:
    * Exclude folders:
        * I'm going to exclude most folders, and use Spotlight solely for folders where I store *documents*.  For other files, I'll just use 'find' in a Terminal window.
        * I've read that Spotlight is hard-wired not to index source code.
    * While I'm transitioning, I want to remove Evernote from Spotlight but keep the data as a backup.  These were ineffective at removing Evernote. See [this story](/content/removing-app-spotlight).
        * Exclude folder ~/Library/Application Support/com.evernote.Evernote
        * Exclude folder ~/Library/Caches/com.evernote.Evernote
    * Ultimately, I deleted the .mdimporter file from /Applications/Evernote.app/Library/Spotlight
    * Note: If you want to rebuild the Spotlight index: sudo mdutil -E /
    * Ugh.  Apparently, it won't index .html files unless you have XCode.  Install XCode.
    * Here's how to add a file type to be indexed, using the rich text importer: http://robin.wenglewski.de/posts/2015/05/26/osx-markdown-indexing-knowledge-management/
* Change searching:
    * Go to System Preferences >> Spotlight >> Search Results
        * There's not really enough granularity/clarity here.  Make some guesses.  Exclude everything except documents.  I'm searching only:
            * Applications
            * Developer
            * Documents
            * Folders
            * Images
            * Movies
            * Music
            * Other
            * PDF Documents
            * Presentations
            * Spreadsheets
        * You could control the order in which items were displayed in the search results by re-ordering this list in older versions of OS X, but cannot do so any longer.
    * If you want better control over the display of search results, start your search with Alt-Cmd-Space instead of Cmd-Space
    * There are tales that you can edit com.apple.Spotlight.plist in ~/Library/Preferences (with an editor that understands binary plist files such as BBEdit or TextWrangler) and rearrange the dict items in the array.  You may have to reboot immediately afterward.  You may have to do this in single-user mode/special-boot-mode.
    * Alfred doesn't find things I think it ought to find. (Yes, I used the "in" keyword.) It just doesn't find things that Spotlight does.
    * Spotlight puts my .html documents under the category "Developer".  I want them listed as "Documents".  I can't find a way to make it do that.  I looked for about a half day.
    * This will find all your mdimporters (and it is a manageably sized list): `find / -name \*.mdimporter -print 2>/dev/null`

## Synchronizing

I used to use Evernote to sync my documents with my wife.  Now that my documents are in the file system, I need another method.  Mostly, I am the family member who files things, so I can live with one-way replication.  That's good because Unison 2.48.4 (on my wife's PC and on my Mac) has a bug where it always creates files with 600 permissions.  (Yes, I set the options and umask appropriately.) If they fix it, Unison would allow me to use 2-ways synch, but for now I'm using rsync.  

* I installed Cygwin, rsync, ssh, and unison I mostly used [this](https://www.howtogeek.com/howto/41560/how-to-get-ssh-command-line-access-to-windows-7-using-cygwin/) as a guide for setting up ssh.
* I used this command line on my Mac to sync the files: 
    * rsync -avz --delete --exclude '.DS_Store' /Users/kevin/Sync/Docs kevin@suedell:/cygdrive/c/users/susan/sync > "/tmp/sync-to-sue.log.$mm.$dd" 2>&1 &
* I will eventually set up a cron task to run this script daily.  (For now, I simply launch it from .bash_profile.)

            #!/bin/bash
            mm=`date '+%m'`
            dd=`date '+%d'`
            yyyy=`date '+%Y'`
            marker="/Users/kevin/.sync-to-sue/done-$yyyy.$mm.$dd"

            try_to_sync() {
                if ! ping -c 1 -t 1 192.168.8.20  ; then
                    echo "Unable to ping Sue"
                    return 0
                fi
                echo "Syncing to Sue"
                rsync -avz --delete --exclude '.DS_Store' /Users/kevin/Sync/Docs kevin@suedell:/cygdrive/c/users/susan/sync > "/tmp/sync-to-sue.log.$mm.$dd" 2>&1 &
                if [ $? -eq 0 ]; then
                    # nothing
                    echo "Launched rsync to Sue"
                    touch "$marker"
                else
                    echo "Failed to launch rsync to Sue"
                fi
            }
            
            mkdir ~/.sync-to-sue 2>/dev/null

            if [ -r "$marker" ] ; then
                echo "NOT syncing to Sue. Already happened."
            else
                echo "Starting sync.  Did not find $marker"
                try_to_sync
            fi

## Investigating:

* I need to find un-OCR image PDF files and run them through OCR.
* I'd like to put all my *documents* in ~/Documents/really-documents and all my data in ~/Documents/really-data.  One of the nice things about using Evernote is that it contained solely *documents*.  However, I also want to put my tax forms (as PDFs) in the same directory as my TurboTax data files.  I can't have it both ways.  (I'm not going to use symlinks, links, or Aliases -- they are too fragile.) Which is more useful?
    * Another example: Do I want my readme.txt with its source code or in ~/Documents/documents-really?  I think this one is obviously "with the code," but how do I write a simple rule?
    * The "file cabinet" metaphor almost works.  If I would put the printed doc in a file cabinet, it should go in really-documents.  Source code would never go in a file cabinet (except, perhaps, with a patent filing or a copyright filing).  Data lives on the computer in really-data.  But what about things like "Notes on how I am currently doing GTD"?  That's clearly a document, not data, but it isn't a static document, so if I filed it, I'd be planning to pull it back out and revise it.
    * It seems like maybe:
        * Static documents from others go in really-documents.
        * Documents that have multiple viewers go in really-documents.
        * Source code does not go in really-documents.  It isn't data.  It goes somewhere else.
        * Data (typically not 1-to-1 mappable to a document) openable only by one app goes in really-data.
    * What are "Documents"?
        * .pdf
        * .doc and .docx and .rtf and .rtfd
        * .xls and .xlsx and some .csv
        * Visio diagrams
        * Most .txt files (text documents)
        * .html and .mht files (and the standard variations on those names) that are not part of a web site I'm developing/analyzing
        * Emails extracted from an email system for a permanent record.  (May include .html or Outlook .msg files.)
        * .opml that are really outlines/checklists
    * Non-documents:
        * source code
        * .html, and .mht files (and the standard variations on those names) that are part of a web site I'm developing/analyzing (they are really just a special type of source files)
        * TurboTax and Quicken data
        * Some .csv
        * Occasional .txt files (text data)
        * Zip files, tar, gzip, bzip, etc.
        * Emails in an email system.
        * Backups (data and document backups)
        * .opml that are really my podcast/RSS (or similar) state
    * Maybe this makes sense:
        * grep-able stuff goes in really-documents, unless it is source code
        * Non-grep-able stuff goes in really-data
        * Source code goes in source-code
        * What else exists?
            * Audio recordings, made during project meetings.
            * Are eBooks documents or data?  I think maybe they are documents, but they are really big and may be un-searchable.  Are my Kindle/Calibre books *data* or *documents*?
                * In favor of declaring them data:
                    * I have about 3GB (2017).  If I make them documents, that will consume much of my cloud storage.
                * In favor of declaring them documents: 
                    * If someone writes an mdimporter, I can search them.
                    * They are, logically, documents.  What is a physical book if not a large document?
                    * Most of them can be rendered by more than one reader app.  Render-by-multiple-apps is a 'document' heuristic.
                    * I might want to share them with my wife.  She'll think 'document'.
                * Decision: I'm calling them documents, but I'm putting them in Sync/Books, parallel to Sync/Docs, because I may want to:
                    * Synch/not-synch them, separate from personal documents.
                    * Search/not-search them, separate from personal documents.
                    * Note: We put personal paper documents into a file cabinet, and books in a bookcase. They are stored similarly, but in different containers.
            * I'm going to treat source code like eBooks.  It goes in Sync/code, as a peer of Sync/Docs.
            * What about a spreadsheet showing health data like blood pressure and blood chemistry?
            * What about a camping checklist?
            * Where do I put a Drupal web site in development?  Clearly not a document.  Not data (except for the MySQL data).  Not really source code.
            * Music
            * Movies + TV + Video
            * Ableton Live files
            * Punch Pro home plans
            * Genealogy data
            * Audio books
            * Tiddlywikis
            * Virtual machines
        * What about things like easy-rsa, where I have a mix of code and data?  I think there are 3 kinds of programs:
            * Apps (foo.app)
            * bin (stand-alone executable files and executable scripts)
            * Packages: Things like nirv and easy-rsa.   Do I want to park these under ~/Packages or ~/bin? What about packages that I "make install" after un-tarring them into a directory?

Home Folder:

* Applications
* backups
* bin
* Desktop
* Documents (don't put anything here unless you must)
* Downloads
* jumbo
* Library
* Movies
* Music
* Packages (or should these go into bin?)
* Pictures
* Public
* Sync (This is where I really store documents.)
* temp

