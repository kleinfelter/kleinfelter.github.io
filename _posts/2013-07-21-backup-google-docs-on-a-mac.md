---
categories: []
layout: post
title: Backup Google Docs On a Mac
created: 1374415494
redirect_from: /content/backup-google-docs-mac
---
Here's how I automate backup of my Google Docs documents on my MacBook, using GDocBackup and Mono.  Similar magic also works for command-line backups in Windows, but you don't need mono.

* Install mono from http://www.mono-project.com/Mono:OSX.  I went with v2.10.11 (Runtime).
* Download xxx from http://code.google.com/p/gdocbackup/downloads/list
    * I downloaded GDocBackup_0.7.6.187_CMD.zip  (The latest .CMD.zip.)
* Unzip GDockBackup and copy the files into /usr/local/bin/
* Smoke test it with `mono /usr/local/bin/GDocBackupCMD.exe /help`
* mkdir /Users/kevin/backups/gdocs
    mkdir ~/etc
    mono /usr/local/bin/GDocBackupCMD.exe -mode=encodepassword -password=yourPasswordHere -outfile=/Users/kevin/etc/GDocBackupPassword
* Put the following (edited for your neds) into ~/bin/backup-gdocs.sh
    #!/bin/bash
    # Use the following form to backup everything at you Google Apps mydomain.com domain:
    #/usr/bin/mono /usr/local/bin/GDocBackupCMD.exe -mode=backup -destDir=/Users/kevin/backups/gdocs -docF=odt -sprsF=ods -presF=ppt -drawF=png -appsMode=1 -appsdomain=mydomain.com -appsOAuthSecret=myAppsOauthDomainKey -username=adminuser@mydomain.com -password=adminPassword
    # Use the following form to backup your personal docs.  Works in google.com account and in mydomain.com account.
    /usr/bin/mono /usr/local/bin/GDocBackupCMD.exe -mode=backup -destDir=/Users/kevin/backups/gdocs -docF=doc -sprsF=xls -presF=ppt -drawF=png -username=myname@mydomain.com -passwordEncFile=/Users/kevin/etc/GDocBackupPassword
* RTFM at http://gs.fhtino.it/gdocbackup/quickguide-cmd
* Schedule the script file to run daily using crontab.

-----
If you like packaged software, take a look at http://www.goldenhillsoftware.com/ . It is reasonably priced, and it says it will back-up your Google Docs/Drive, Contacts, Calendar, and Email into Mac-usable formats.
