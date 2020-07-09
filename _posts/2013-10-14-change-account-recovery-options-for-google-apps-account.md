---
categories: []
layout: post
title: Change Account Recovery Options for Google Apps Account
created: 1381779167
redirect_from: /content/change-account-recovery-options-google-apps-account
---
Suppose you set up a Google Apps (private domain) with Google, so that your email sent to example.com gets handled by GMail.  Google recently published a blog entry, encouraging everyone to set up account recovery for their Google account and their GMail account.  But these directions don't apply to Google Apps for your domain example.com.

Google expects that the administrator for your domain will handle account recovery and password resets for all of your (non-admin) users.  That's *you*.

But what about your administrator account?  What happens if you need to recover that account?  You can recover *that* account using Google's normal account recovery.  First, you must set up that account for recovery.  (Similar instructions apply when you want to change your account recovery options -- such as when you buy a new cell phone.)

1. Login to https://www.google.com/a/example.com using your administrator account.
1. Click "Security"
1. Locate "Recovery Options" and click Edit

Note that you you have a logical number with Google Voice, you probably do not want to use that number as your recovery number, because you might have lost access to that account.  For this one, you should use the physical cell phone number.
