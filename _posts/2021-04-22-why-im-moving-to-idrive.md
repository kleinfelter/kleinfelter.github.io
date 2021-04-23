---
title: Why I'm Moving to IDrive
---

... despite it not meeting my requirements.

I need sync among my Win/Mac/Linux machines. I need off-site backup. I need on-site backup. I actually have all this right now, but it has too big a footprint.

I can sort of keep it going, but there is no way my wife would ever spend the effort, if I were temporarily disabled. I'm skeptical I could keep it going when I reach age 80.  I need something simpler. And right now, my on-site backup is a beast of a server with triple-RAID for data and two-drive RAID for the OS.  This is nuts.

My requirements:
* **Zero knowledge** - Non-negotiable. The vendor doesn't store files unencrypted and doesn't have the encryption key.
* **Multiple sync folders**. e.g. Not like OneDrive where everything to sync lives inside a "OneDrive" folder.
* **Mac/Win/Linux-386/Linux-ARM** - my Mac, wife's Windows laptop, a Linux server, a future Windows laptop for me.
* **Affordable**. I'm flexible on the definition
* **Performance**. Uploads/downloads happen quick enough for my 2TB of data. Software is low CPU/disk demand.
* **Selective sync**. If I have 2 computers sharing an online folder, some files to sync with one and some with the other.
* **3rd party backup**. I can back it up to a 3rd party so I don't need a *local* backup.
* **Supported**.
* **Simplicity**. Can I manage it when I'm 80? Can my wife get files out of it when I'm dead?

Nobody meets all of these as of April 2021. SpiderOak and Tresorit come pretty close. They are zero knowledge and multiple sync folders. At $288/year for 2.5 TB, Tresorit is more than I want to pay. SpiderOak is bearable at $150/year for 2TB, but if I grow beyond that, the next stop is $320 for 5TB. They don't support Linux-ARM and they don't support 2FA for web logins! Wow. I didn't even know I needed to add that to my requirements.

iDrive looks like it meets all the requirements except multiple sync folders, for $70 per year for 5 TB, with first year under $10. Somebody even made it work with Linux-ARM. You might think you could get around the multiple sync folder issue with symlinks, but it simply ignores them. Some nut cases on the web suggest putting the real folders in the sync folder and linking to them from the other place you need them.  Try that with subfolders of your /etc and let me know how it works for you!

I think I can get around the requirement for multiple sync folders.  The files I sync with every machine are mostly kleinfelter-file-cabinet -- a collection of 'documents' I share with my wife.  Almost everything else I sync is synced with my server, where they get backed up locally and sent to my off-site backup provider electronically.  I might like to sync some of my project folders, but they could be moved into a single sync folder.  

iDrive handles backups separately from sync. You can backup from multiple source folders. To configure backups, launch the iDrive app (via "Start iDrive" on the menu bar icon).  You can select all the folders you want via the "Change..." button. (Why can't they let you add sync folders similarly?)

So I think I can live with everything to sync in a single sync folder, with backup of my other files. If I find otherwise, for Mac/Win/Linux-386 there is https://www.insynchq.com/pricing which says it adds features such as multiple sync folders (at the cost of increased complexity).  Linux-ARM is SOL here, but my Linux ARM box will be solely used for backup.  See [this site](https://www.garybell.co.uk/raspberry-pi-for-backups/) for iDrive ARM backup tips.

rclone makes many things possible, but the complexity is off the charts, and it really only supports 1-way sync. They are very clear that setting up 2-way syncs risks data loss.  I *might* wind up using rclone on my Linux-ARM because I can set up 1-way backup to run once a day and then forget it (except to confirm it is really still running).

I *could* use rclone to encrypt storage at OneDrive or any other unencrypted site via its "crypt" feature, but the complexity is just too much.

iDrive performance is pretty good. I observe upload is 12 MB/s. That's 166,666 seconds for 2 TB; 2778 minutes; 46 hours; 2 days. That's not bad.  I got a response from their support in about 3 hours, so that's tolerable.


#### SpiderOak Notes
* Zero knowledge
* Many sync folders
* At $150/$320 for 2TB/5TB they are pricier than iDrive. Too pricey if I exceed 2TB. 
* They are otherwise a very fine solution
* Their web site looks like consumer file sync might not be a big part of their marketing strategy any longer

#### OneDrive Notes

* Not zero knowledge.
* Single sync folder. Symlinks in the sync folder are screwy. The may sync from Microsoft to your computer but not vice versa.  Looks like they use the Windows version of inotify, and that doesn't work across symlinks.
* At $100 per year for 6 users and 6TB, with free Word, Excel, Powerpoint, its a bargain, but since they don't have iDrive's work-around for backup, and they don't protect my files with zero knowledge, I just can't use them.
* Must use 3rd party for linux. No apparent Linux-ARM.
* boxcryptor encrypts. They do have Linux support (see "portable version"). It adds complexity.

#### Sync.com Notes
* Multiple sync folders not supported and they don't have iDrive's work-around.  They *might* work with symlinks, but they say it is unsupported.
* $96/year for 2TB and $120 for 3TB is affordable.

#### Google Drive Notes
* Not zero knowledge.
* Multiple sync folders not supported and they don't have iDrive's work-around.
* Too expensive beyond 1TB, and I need 2TB minimum. $240/$1200 for 2/10TB.

#### Dropbox Notes
* Not zero knowledge.
* Multiple sync folders not supported and they don't have iDrive's work-around.
* Dropbox: via help.dropbox.com - "As of mid-2019, Dropbox no longer follows items outside of your Dropbox account that are linked to by a symlink."

#### Other Candidates:
* Tresorit, zero knowledge, many sync folders, at $288 for 2.5TB they are too rich for me.
* Sync.com, zero knowledge, one sync folder but no iDrive-style work-around, $96/$120/$180 for 2/3/5TB
* GoodSync, not zero knowledge,	unknown sync folder count
* CrashPlan, not zero knowledge, backup only, $120 for 'unlimited' storage
* Syncplicity, not zero knowledge, unknown sync folder count, tiny storage limits
* Jungle Disk, zero knowledge, unknown sync folder count, only trivial storage sizes listed
* KeepVault, zero knowledge, unknown sync folder count, $1300 for 2TB!
* Resilio, P2P only

#### Summary

So backup of any folder, single sync folder (ugh!), zero knowledge, affordable, performant, Win/Mac/Linux-386/Linux-ARM.
