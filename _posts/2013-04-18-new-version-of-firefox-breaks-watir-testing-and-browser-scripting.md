---
categories: []
layout: post
title: New Version of Firefox Breaks Watir Testing and Browser Scripting
created: 1366322954
redirect_from: /content/new-version-firefox-breaks-watir-testing-and-browser-scripting
---
If you've told Firefox that it can auto-update itself, every time this happens it will break your Watir tests and/or browser automations.  Because I use Watir to script Firefox to back up my Nirvana to-do data, this is a problem for me.  Here's what I do each time I notice that my backups are failing.

* Go to https://code.google.com/p/selenium/downloads/list
    * Look and see what the latest version is.  You want the one described as "The Java bindings for Selenium 2, including the WebDriver API and the Selenium RC clients. Download this if you plan on just using the client-side pieces of Selenium"
* Find the "Gemfile" file in the folder where my backup script lives
* Edit the file and update the version info on the selenium-webdriver line to the latest version number from the selenium downloads site.
* In the folder with Gemfile, run "bundle update selenium-webdriver"
* Then manually re-run your failed test/script.  (Mine is 
