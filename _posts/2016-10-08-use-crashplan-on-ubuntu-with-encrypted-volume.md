---
categories: []
layout: post
title: Use Crashplan on Ubuntu With Encrypted Volume
created: 1475956736
redirect_from: /content/use-crashplan-ubuntu-encrypted-volume
---
I use an encrypted volume with LUKS on my Ubuntu server.  First, I mount the encrypted volume, then I mount a zfs file system from it.

CrashPlan was getting confused because when CrashPlan started, the /data volume I'm backing up was empty because the volume isn't mounted until after I login and enter the password.  So I needed to delay CrashPlan startup until after the encrypted volume is mounted.  (i.e. I need a delayed CrashPlan start.)

* Run this to remove crashplan from init:
    * sudo update-rc.d -f crashplan remove
* Append this to the script where I mount my zfs volume (~/bin/mount-zfs.sh on my machine)
    * sudo /etc/init.d/crashplan start
    * /etc/init.d/crashplan status
