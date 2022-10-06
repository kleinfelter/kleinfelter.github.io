---
title: Linux, Mac, or Windows On My Laptop
---

My MacBook is getting old, so I'm thinking about a new laptop.  OS options include Linux, macOS (formerly OS X), or Windows.  Some non-mainstream OS-associated things that are important to me include:

* **Quicken**.  Many of the features.  I use the retirement planner, portfolio tracking, and the transaction-tracking registers.  Before you tell me "Banktivity" or whatever is better, make sure it can:
    * Download transactions from my bank, credit cards, retirement accounts, 529 plans, HSA.
    * Chart my net worth for 10+ years.
    * Import 25 years of Quicken data at 100% fidelity.
    * Tell me how long before I reach poverty if I lose my job.
    * Tell me when I can retire.
    * Track my spending and my income.
    * Data stored locally.
* **Scanning documents** via a sheet-feed scanner to PDF+text format.  I want an install-it solution -- not "assembly required."
* TurboTax
* GPS + topographic management.  Something similar to Garmin's BaseCamp.
    * I *think* BaseCamp just looks for volumes named "Garmin" and  "GTOPO" for the device and the map disk.  You might be able to run BaseCamp in a Windows VM or Wine, because it doesn't use *drivers* to talk to the device.
    * Alternatives: [QMapShack](https://bitbucket.org/maproom/qmapshack/wiki/DocQuickStartEnglish), [Viking](https://sourceforge.net/projects/viking/), [GPSMaster](https://wiki.openstreetmap.org/wiki/GpsMaster).
* Set-it-and-forget-it backup. I could live with just a periodic backup of *data* files, since I use CrashPlan.
* Home-and-landscape design software.  I want an install-it solution -- not "assembly required."  I could live without this.
* I really do use VBA in my spreadsheets, although I could rewrite this code.

No, I don't think Quicken is part of the OS, but the OS I choose determines whether I can use Quicken. Given my desire for Quicken's feature set, I either have to use Windows as my OS or Windows-in-a-VM.

Linux doesn't have a complete scanning package.  Yeah, you can scan anything with almost any hardware, but you have to cobble together the complete package, and bits and pieces of it will remain ragged.  Too much tinkering for someone who scans documents *often*.

Something I hate about Quicken: Proprietary data storage with no API. 

## Hardware:

* Big disk.
* Fast CPU.
* Don't need a discrete video card.
* 16 GB RAM.  Prefer 32 GB.
* 500 GB disk.  Prefer 1 TB.
* 15" display UHD/HiDPI.  1920x1080 is not high enough DPI at 15".
    * There are many laptops with 3840 x 2160 and many with 2560 x 1440 or 2160 x 1440.
    * 15" MacBook Retina has 2880 x 1800.
* Good touchpad (similar to MacBook's).
* Battery life
* 300+ nits brightness
* Glossy display

## Some options:

* I can get a [top-of-the-line Dell](https://www.amazon.com/Dell-InfinityEdge-Display-i7-8750H-Fingerprint/dp/B07DKW14Q6?keywords=dell+xps+15&qid=1539283732&sr=8-6&ref=sr_1_6) for about $2400. 
* A comparable MacBook Pro will run about $3000, so it is about $600 more.
* A [slightly lesser Dell 9560](https://www.amazon.com/Dell-XPS9560-7001SLV-PUS-display-Aluminum-Chassis/dp/B01N1Q0M4O) = $1700, which is $1300 less than Mac.

To any of these prices, add a 3-4 year warranty (AppleCare)

Suppose I save $1200 and I keep my laptop 4 years.  That's $300 per year.  If I stretch it to 6 years, it's $200 per year.

## Some things I don't like about Windows:

* Microsoft really owns your laptop.  They'll choose when to update Windows. They'll choose whether you are *allowed* to re-install it.
* There is nothing comparable to Time Machine.
* I haven't seen a trackpad that works as smoothly as the Mac's.
* No AppleCare carry-in repair.

## Some things I really don't like about Mac:

* Apple really could decide to move the whole Mac platform to an incompatible CPU.  They did it once before.
* Apple controls whether you can use 3rd party hardware to repair.  There are serious "right to repair" issues.
* That damn battery is glued in.  (I need to repair my trackpad, but I'd have to un-glue the battery to get to it.)
* You can't put macOS in a VM unless that VM is running on a Mac.
* Apple is just about to drop support for 32-bit apps.  Some of my 32-bit apps are abandonware.
* You can't get a 15" MacBook Air -- You only get 15" in the MacBook Pro.

## Some things I really don't like about Linux:

* No Quicken.  No complete scan-to-text-PDF package.
* You really spend way too much time tinkering.  I just spent a lovely day and a half getting double-clicks to work right in an Ubuntu 18.10 VM.
* GPS device + topo map management is... not a polished package.
* No AppleCare carry-in repair.
* Chrome consumes even more memory per page on Linux than on macOS!

## "Creative" possibility:

* I have a NAS-on-Linux server.  Move all my data + apps to this server, and use a Chromebook to access it. (Quicken goes into a Windows VM.)
* Won't work for copying tracks to/from GPS device (except a Garmin *can* be treated as a USB drive with a particular folder layout).
* Won't work for scanning
    * Unless I get a [USB extender](https://www.amazon.com/AV-Access-Extender-Operating-Synchronously/dp/B01EV33R8S?). 
    * Caution: Most USB over "Ethernet" are actually USB over RJ45, and they won't flow through a switch.) (And many of them suffer 'disconnects'.  Do you really want to add complexity?
    * $420 ScanSnap iX500 can scan to Google Drive without a computer.
    * $280 Epson WorkForce ES-400  scans to Google Drive - check to be sure it can do this without a computer attached. ("Cloud Connect").
    * $200 Brother ADS1500W  can scan to Google Drive ("Web Connect").
* Or move all my data and most of my apps to NAS-on-Linux, and get a *budget* thin-and-light Windows laptop with UHD display as a terminal. (Looks like at least $1000.)

## Issues with My Current MacBook:

* Trackpad won't left-click.  (It will left-*tap*.)
* Battery life has fallen to about 4 hours.

## Working plan:

The smart thing to do at this point is to string my MacBook along a while longer, despite its messed up trackpad.  If it out and out dies, either:

* Buy another MacBook and spring for the extra $1300.
* Buy a not-quite-top Dell, cobble together a decent backup.  Be sure to *see* a real display and *trial* a real touchpad.