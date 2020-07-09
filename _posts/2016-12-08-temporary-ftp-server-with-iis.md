---
categories: []
layout: post
title: Temporary FTP Server With IIS
created: 1481202257
redirect_from: /content/temporary-ftp-server-iis
---
I work in a corporate environment.  Sometimes, someone needs to send me a large file.  I have a shared folder on a NAS, which works for most users.  We also have a web-based file-drop. 

However, if I'm working with a Linux server person, if his server has no GUI, he can't always manage to deliver a file to an SMB server or navigate a web interface.  He *ought* to be able to transfer that file from his server to his Windows laptop, and from there to the web file drop, but sometimes our support staff are... unmotivated or perhaps un-talented.  They speak FTP and that's about it.  I could talk with their supervisor, in order to motivate them to try harder, but when I want to expedite an immediate solution, it is useful if I can just bring up a temporary FTP server.

Here's a no-added-software way to do this with Windows 7.  (It is similar for other versions, but may have minor variances.)

For first-time setup, skip to the 'One-time Setup of Inactive Server' heading below.


## Activate the FTP Server When You Want to Use It

* Run: inetmgr.exe
* Right-click on the site >> Manage FTP Site >> Start
* Discover your IP address: `ipconfig | findstr /I ipv4`
* Test it to be sure it is really accepting login.
* Provide your IP address to the person who wants to send you the file.  Template:
    * Hello, I have set up a temporary FTP server at xx.xx.xx.xx.  User is "anonymous".  Use your email address as the password.  This is only a temporary FTP drop on my personal laptop, and that IP address will change the next time my laptop gets a new address from DHCP, so please send the file AS SOON AS POSSIBLE and please notify me when delivery is complete.

-----

## One-time Setup of Inactive Server

* Create ~\My Documents\Incoming-FTP.
* Grant Permission to `<computername>\Users` (via right-click on the Incoming-FTP folder)
* Grant all permissions except Full Control.
* Run: OptionalFeatures.exe
* Enable 
    * Internet Information Services >> FTP Server >>FTP Service
    * Internet Information Services >> Web Management Tools >> IIS Management Console
* Run: Inetmgr.exe
* In the right column, right-click and remove Sites:Default Web Site
* Right-click and ADD FTP Site.
    * Name the site "Incoming" and point it to ~\My Documents\Incoming-FTP.
    * Do NOT start automatically and do NOT allow SSL.
    * Authentication = Anonymous
    * Authorization = All Users
    * Permissions = Read and Write

