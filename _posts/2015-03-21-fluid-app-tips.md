---
categories: []
layout: post
title: Fluid.app Tips
created: 1426945314
redirect_from: /content/fluidapp-tips
---
I wasn't using [Fluid](http://fluidapp.com).  I was a heavy Chrome user and I opened many, many tabs and pinned them.  That worked well for me except that Chrome started draining my battery too fast.  Firefox wasn't any better.  Safari seems to be less demanding on my battery, but it won't pin tabs and, in general, it doesn't work so well with many tabs open.  So I'm using Fluid apps in order to move my constantly-present tabs into apps.

* With Google Voice, it will show a cut-down page, missing some elements.  It also adds a funky mini-menu across the top.  To fix this:
    * Select the app-name menu item ("Google Voice" is what I named the app, but yours may be different)
    * Choose "User Agent" and then choose Safari.
* I wanted two different icons for two different Gmail accounts.  There are two strategies.  One is to give each Fluidapp its own cookies and give each app the URL https://mail.google.com/mail.  The other is to let the apps share cookies and give one the URL https://mail.google.com/mail/u/0/ and the other https://mail.google.com/mail/u/1/.  The problem with the second approach is that it assumes that you ALWAYS sign in to one account before signing in to the other.  I prefer consistency, so I paid the $5 to buy the ability to give each app its own cookies.
    * When you create the app with Fluid.app, give the URL https://mail.google.com/mail and pick one of the icons from http://om.id.au/gmail-icons-for-use-with-fluid-app-in-multiple-colours/
    * Open your app, open the Preferences pane, navigate to the Security tab, and choose "Separate from Safari" cookie storage.
    * Restart the app, and login to the desired Google account.
    * Note: The disadvantage of the separate cookies approach is that you must sign in to each app (Voice, Calendar, Mail) separately.  Since I use 2-factor, this is a royal pain every 30 days.  I may revisit my decision and go back to the login-to-accounts-in-same-sequence approach.

* I also wanted to block inline adds with my RSS reader.
    * Window >> UserStyles
    * Add a site name to the left column.
    * In the right column (upper area), set the URL pattern to *mysitename.com*
    * In the right column (lower area), paste the content of http://www.floppymoose.com/userContent.css
    * I had to add the following line to the user style (near the similar lines)

    A:link[HREF*="da.feedsportal.com"]  IMG, 


Change the user agent for a Fluid app:

You'll read about changing it via the app-name >> User Agent menu.  That doesn't appear to persist between app restarts.  Here's how I changed it:

* Right-click on app-name.app and Show Package Contents
* Edit resources/UserAgentStrings.plist and replace the string under the <key>value</key> under Default Fluid App

Make Nirvana (nirvanahq.com) work as a fluid app:

It redirects to a login page, and the login page opens in your default browser (Chrome/Safari/Firefox/etc).  When you login in the browser, that does not put a cookie in Fluid and Fluid is still not logged in.

* Launch the created app.
* Nirvana >> Preferences >> Whitelint (the red heart icon)
* Double-click on the first blank line and enter: `*www.nirvanahq.com*`
* Close and re-launch Nirvana.
