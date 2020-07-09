---
title: Leaving LastPass
---

I'm leaving LastPass.  I was uncomfortable when LogMeIn bought them.  Then it started flaking out.  Little things, like crashing after login; the Mac version saying it was installing the binary shim but not actually doing it.  

The final straw was when it started telling me that it couldn't contact the server.  The work-around included clearing the cache.  When I started to clear the cache, LastPass warned me that doing so could lose data because of a 'retry' file.  I contacted support, explained that I considered data loss unacceptable, and they said I should remove/reinstall the browser plugin.  I did so.  Whoops.  Removing the browser plugin... removes the plugin data, including the retry file.  So I lost some updates and I have no way to know what they were.

Naturally this happened less than a week after I had renewed my LastPass subscription!

There are only two things a password wallet must do: Keep my passwords confidential and give them to me when I ask.  Losing data causes the 'give to me when I ask' to fail.

The trouble with *all* services is that you're trusting them not to have bugs (or a deliberate, hidden leak).

####  I need:

* Mac
* Windows
* Sync between a Mac and a Windows computer.
* Local storage
* Export and import of passwords

####  I want:

* Not cloud.  If online, it must be zero-knowledge and 2FA.
* Audited security
* Sync between multiple clients.  (I could live with entry on just one device.)
* Read access on Android.
* High confidence in confidentiality and data integrity.
* To avoid installing eleventy-three 'extensions' which don't get audited as well as the main product.
* YubiKey or other 2FA.  (Key file on USB would be OK.)
* Ability to turn OFF auto-update.
* Some way to export passwords to my wife, and to read her passwords.

####  Some possibilities:

* KeePass Family
    * Notes:
        * Import from LastPass: https://tibdex.github.io/lastpass-to-keepass/
        * If implemented right, a web data file with a local key file, should make it decryptable only by me.
        * It is really a *database*, without browser integration.  To use it:
            * Navigate your browser to the login page
            * Bring up KeePass
            * Search KeePass for the right login record.
            * Press the auto-type keystroke.  It will minimize itself and type ID, tab, password, Enter.
    * KeeWeb - cross platform. In browser, or as Electron app.  Desktop and cell phone.
    * KeePass
        * Requires Mono on Linux and Mac. Reportedly has issues on Mac.
    * KeePassXC - cross platform. (KeePassX is obsolete.)
* Bitwarden, self-hosted - (via Docker, or build from source)
* Google Smart Lock - Google Chrome built-in password manager.  It is 'in the cloud'.


####  Improbable, but possible:

* Text file - Let's not reject this out of hand.
    * I do encrypt my disk drives.  But if the data gets onto my work PC, my employer could read it - even if I use EFS.
    * I could use VeraCrypt portably on my work PC.
    * A text file, plus a shim to encrypt/unencrypt the current file open in my editor.  (Risk of forgetting to encrypt before save!)
* Sync a modern Excel file encrypted with SHA-512.
* An Android-only Solution
    * I could store them solely on my cell phone (with a backup somewhere).
    * I'd want to be able to fingerprint or face-recognize to unlock the phone and the safe.
* Keeper - multi-platform.  Proprietary.  Maybe a better LastPass, but similar in essence.
* Text file in Linux VM, on a USB drive, with encrypted file system.

####  Rejected:

* LastPass - nope.  It lost some data.
* Password Safe - the Mac version in unofficial.  I don't want 'unofficial' with my passwords unless it is 3rd-party audited.
* SplashID - Looks interesting.  It puts the program and the data on a USB stick. 42% 1-star (awful) ratings on Amazon!