---
categories: []
layout: post
title: Quicken to GnuCash Migration 2016 - Fail
created: 1457891597
redirect_from: /content/quicken-gnucash-migration-2016-fail
---
In March of 2016, I tried again to migrate from Quicken (Windows) to GnuCash (Mac).  This time it was with GnuCash 2.6.11.  The motivator is that I use Quicken 2014, Q2014 is the last version to run on XP, so when Intuit expires my transaction downloads in 2017, I'll have to purchase Windows 10 and keep running VM software.

The good:

* They've added support for SQL back-ends, including MySQL and sqlite3.

The bad:

* They treat the SQL back-end as if it were a big file.  The read in the entire database at startup, just as if it were the XML data store.  It loads slowly if you have 25 years of data.
* If you download the binary version, you get SQL support, but you don't get the Python API.  If you install from MacPorts, you get the Python API, but not sqlite3.  (No, you can't successfully add sqlite3 to the MacPorts edition.  I tried.)  You can try a full build-from-source, but that is epically difficult and it will fail if you have MacPorts for something else. I use Homebrew, and Homebrew doesn't play well with MacPorts.  Note that piecash is an alternative python interface to some GnuCash data.  (piecash is NOT the same as the GnuCash python interface!)
    * If you run "brew cask install gnucash", you just get the same binary installed as if you downloaded it from gnucash.org.  "brew cask" fetches and installs binaries, not source.
* The database schema isn't fully documented.  The Python API isn't fully documented.
* Custom reporting requires learning Scheme and Guile or write custom code against the database.
* You have to exit GnuCash to update prices or run external reports.  Only one process at a time can touch the database.  Security price updates are a separate, stand-alone app.
* It doesn't use the price at the time of a security purchase/sale to update the price history for that security.
* There is no way (short of the API or SQL hacking) to to import security price history from Quicken to GnuCash.
* Reports for portfolio tracking are... quite limited.
* There is nothing comparable to the Quicken retirement planner.
* After you import your Quicken QIF export, all of your securities have a price of $0 in the account overview.  This means you can't reconcile your account balances with your old Quicken balances until you figure out how to import your Quicken price history (which could include manual entry of the latest price for each security).
* You practically *can't* build from source on a real OS X installation. Building relies on gtk-osx.  Building uses something called jhbuild.  The doc for gtk-osx and jhbuild says: If you have HomeBrew, MacPorts, or Fink installed, you must remove all traces of them from your environment before you try to run jhbuild.
    * If you want a SQL other than sqlite3, you're going to have to make jhbuild run (in order to build the DB driver), and jhbuild doesn't like Homebrew, MacPorts, or Fink. Only the sqlite3 DB driver is included in the pre-built binary.
* Whether you use GnuCash python bindings or piecash, GnuCash doc says, "Python-scripts should not be executed while GnuCash runs. GnuCash is designed as a single user application with only one program accessing the data at one time."

Python info:
* GnuCash: https://code.gnucash.org/docs/MASTER/python_bindings_page.html
* GnuCash: https://wiki.gnucash.org/wiki/Python_Bindings
* PieCash: https://media.readthedocs.org/pdf/piecash/latest/piecash.pdf
* GnuCash says "Until GnuCash supports simultaneous multiuser use almost all users are better off with the XML backend" but piecash requires a SQL back-end.
* GnuCash says "... you must not write to the GnuCash database except through the GnuCash libraries."

Building on Mac:
* https://wiki.gnucash.org/wiki/MacOSX/Quartz - it says "For virtually all users it is more appropriate to download the binary rather than to use the procedure described here."
    * However: "Creating a separate user for building and packaging GnuCash is the easiest work-around if you've used any of those systems in your regular userid."

Options for next time:

* My advice if you're on Mac is to start out with piecash and the pre-built GnuCash for OS X.  If you find that you really need the python bindings, set up a linux VM, build from source there, and use that VM solely for your accounting.
* This guy ( http://www.matt-thornton.net/tech/databases/gnucash-mysql-os-x-10-10-getting-it-running ) says "My advice is if you really want gnucash + mysql running on your Mac then build an Ubuntu virtual machine and run it in VMware fusion (or other). That way you can use the package managers to just build and install everything for you."
    * After a brief review, I conclude he's right.  If you want to use GnuCash on Mac (or Windows) without the python bindings and with XML or sqlite3 data store, use the pre-built binaries.  Otherwise, build and run it in a Linux VM.

Outline of things to address the next time:
* Install GnuCash
* Make transaction downloads work
* Figure out how to update stock prices
* Make my portfolio re-balancer work
* Create a Quicken Retirement Planner equivalent
