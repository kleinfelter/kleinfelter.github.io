---
title: How to Import Email From an IMAP Server Into Gmail
layout: post
---

GMail has a helpful import-from-POP3 function, to bring your old email when you migrate to GMail.  But I wanted to import from a server which supports only webmail and IMAP.  Here's how:

## Step 1 - Import Messages to a Desktop Email Client

Since we can't go directly from the old server into GMail, we'll pass through an intermediate step.  We'll set up a desktop email client to fetch messages from the old server.  This will make a copy of the messages on the desktop.  Then, in step 2, we'll push the messages from the desktop into GMail.

Note: If you're about to lose access to your old server, the step of copying the messages to your desktop is URGENT.  Step 2 can be done at your leisure.

I'm going to describe how to do this using the Thunderbird email client.  If you already use a different desktop email client, you can probably do something similar using it.

1. Install Thunderbird from https://www.thunderbird.net/en-US/ .  
    * Just click on the default Next/Install/Finish buttons until you get to the "Set up an Existing Email Account" window. 
2. Enter your ordinary, human name next to "Your name".  e.g. Tom Smith.
3. Enter your email address (from the old server) next to "Email address".  e.g. tom.s@example.com
4. Enter your email password (from the old server) next to "Password".  e.g. TopSecret1234
5. If you are lucky, it will auto-detect your settings.
6. If you are unlucky, you may have to press the "Manual Config" button and enter your information manually:
    * Set Incoming to IMAP
    * Set both host names to the server name for your old email server.  e.g. example.com
    * Set the Username Incoming field to your old email server's user name.  e.g. tom.s
    * Set both Port fields to Auto.
    * Set both SSL fields to Autodetect.
    * Set both Authentication fields to Autodetect.
    * Set the Username Outgoing field to your old email server's user name.  e.g. tom.s
    * Press "Re-test".  It should report "The following settings were found by probing the given server".  Then press Done.
7. You may get passed to a login form for your old email server.  If so, complete it.
8. At the left side of Thunderbird, you should see your old email account.  e.g. tom.s@example.com.  Underneath the email address, you should see some folders.  Explore those folders until you see the emails from your old server.
9. Once you find the folder/folders with your old messages:
    * Right click the folder.
    * Choose Properties, then Synchronization.
    * Set (put a check mark next to) "Select this folder for offline use".
    * Press the Download Now button.
    * Be sure to do this for each folder which has old emails.
10. If you have lots of messages, just let your computer sit, connected to the internet for a little while, while the old messages get downloaded to your computer.
