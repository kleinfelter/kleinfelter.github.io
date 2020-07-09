---
categories: []
layout: post
title: Alternatives to LastPass
created: 1449267814
redirect_from: /content/alternatives-lastpass
---
LastPass Alternatives

I'm not entirely happy with the Logmein purchase of Lastpass.  I'm looking at alternatives.  

I need passwords on my laptop, my employer's laptop, and my cell phone.  I'd *like* access 

to them when I use a web browser elsewhere, but I *could* refer to my cell phone data.

I need sync across platforms.  I need 2 factor authentication (2FA).

Current thinking: LastPass sure is convenient, and maybe they do a better job than me, but they are an appealing target for hackers.  KeePass looks to me to be the most secure product that meets my requirements, but it is awfully DIY.  I'd like a product that will sync 2 Windows machines and a Mac and an Android and an iPad via WiFi, so that my data stays within my boundaries.

Platform     | Windows Desktop | OSX Desktop | Android | iPhone | Sync | 2FA | Web-guest
------------ | --------------- | ----------- | ------- | ------ | ---- | --- | ---------
Lastpass     |                 |             |         |        |      |     |  
Dashlane     |                 |             |         |        |      |     |  
KeePass      |                 |             |         |        |      |     | ?
KeePassX     |                 |             |         |        | ?    | ?   | ?
1Password    |                 |             |         |        |      |     | ?
Enpass       |                 |             |         |        |      | N   | N
Sticky Password |              |             |         |        |      |     | ?
RoboForm     |                 |             |         |        |      |     | ?
Chrome       | ?               | ?           | ?       | ?      | ?    | N   | ?
Firefox      | ?               | ?           | ?       | ?      | ?    | N   | ?
????????     | ?               | ?           | ?       | ?      | ?    | ?   | ?

* Blank means OK; ? means unknown/unresearched; N means not available.
* Comparison matrix from someone else at http://www.asecurelife.com/dashlane-vs-lastpass-vs-1password-vs-roboform-vs-keepass/
* See big review at http://thenextweb.com/apps/2013/10/06/10-of-the-best-multi-platform-password-managers-for-ios-android-and-the-desktop/
* Note that LastPass (and others, maybe) stay logged in on your cell phone unless you manually logout.  If someone gets your phone and you don't have a strong PIN on the phone, your LastPass data is at risk.
* 'KeePass' includes KeePass desktop, (SyncThing or Google Drive or Dropbox), (KeePassDroid or Keepass2Android or MiniKeePass).
    * See http://www.guidingtech.com/29652/sync-keepass-android/
    * This can get weird for 2FA on Android.  See https://www.tomaz.me/2013/10/24/my-password-manager-setup-keepassx-keepassdroid-yubikey-spideroak.html
    * More on 2FA with KeePass: http://nidkil.me/2014/12/10/adding-two-factor-authentication-to-keepass-keepass2android/
    * This can get weird for web access.  See http://sourceforge.net/projects/webkeepass/
    * Here are setup instructions for WebKeePass: http://blog.sukria.net/2013/08/27/webkeepass-or-how-to-build-your-own-cloud-aware-keyring/
* One Password: See https://agilebits.com/onepassword
* 'Chrome' means the browser, saving passwords.  There is no 2FA here.  Browsers also allow sites to forbid auto-fill.
* 'Firefox' means the browser, saving passwords.  There is no 2FA here.  Browsers also allow sites to forbid auto-fill.
* Enpass uses Dropbox (and similar services) or your own WebDAV server.
