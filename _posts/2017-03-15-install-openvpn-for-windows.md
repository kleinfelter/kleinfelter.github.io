---
categories: []
layout: post
title: Install OpenVPN for Windows
created: 1489581887
redirect_from: /content/install-openvpn-windows
---
<img src="/files/setup-exe.png" height="139" width="200" style="float: right; margin: 0 0 10px 10px" >

* Go to [the OpenVPN download page](https://openvpn.net/index.php/open-source/downloads.html) 
* Download "Installer, Windows Vista and later" (unless you need Windows XP, in which case you should scroll down and find "Installer (32-bit), Windows XP").
* Run the downloaded .exe.
* Click your way through the installer, choosing the affirmative button as necessary.
    * Caution: While the installer is running, don't try to do anything else.  It will pop up various dialogs and if you are typing into another app, you may dismiss a dialog by mistake.  (I did, and it was a problem!)
    * This is a particularly slow installer.  It may say "Target was appended to PATH" for a few minutes.  Have faith.
* Transfer the ''.ovpn'' file you built for that user from ~/easy-rsa/keys (on the machine where you built your keys -- in my case that is my Macbook at ~/Packages/easy-rsa/keys).  
    * To transfer the file you can use scp, sftp, sneakernet, etc.  You should choose a secure method because you don't want someone else to get that file.
    * Don't copy the .crt or the .csr or the .key files -- just the .ovpn.  easy-rsa bundled those other files into the .ovpn for your convenience.
* Launch "OpenVPN GUI".  (Start button >> All Programs >> OpenVPN >> "OpenVPN GUI".  Or launch it from the icon it added to your desktop.)
    * If you've never used OpenVPN before, it will complain about not finding any config files.  Press "OK."  We'll take care of that next.
    * ''Where did it go?''  It won't display a nice big window.  It will add a small icon to your tray.  If you don't see it in your tray:
        * You may have to click the ">>" in your tray to "Show hidden icons."
        * You're looking for an icon with a CRT with a padlock.  It looks like this: <img src="/files/openvpn-windows-icon.png#overlay-context=content/install-openvpn-windows" height="32"; width="38"; style="float: right; margin: 0 0 2px 2px"; >
        * You might want to click on the "Show hidden icons" button in the tray, select Customize, and tell Windows to "Show icon and notifications" for this icon, so it won't hide it in the future.
* Once you find the Tray icon, right-click it and choose "Import file..."  Navigate to the .ovpn file you copied and import it.  OpenVPN should give you a success message when you import it.
* After you import it, delete it from your USB drive, or the temp folder where you copied.  You *really* want to keep this file secure because it will grant anyone who has it access your VPN.
* I recommend that you right-click on the icon, choose Settings, and enable "Launch on Windows setup," so that the icon will always be in your tray. 

### Testing It
* If you want to test your config at this point, right-click on the OpenVPN GUI icon in your tray and select "Connect".
    * If you are on a Windows Domain, you might get "Connecting to management interface failed".  You can talk with your domain administrator about adding you to an "OpenVPN Administrators" group, as OpenVPN recommends, or you can just make a habit of launching OpenVPN by right-clicking on its icon and selecting "Run as administrator".  This should not be an issue on a typical home network (unless you set up a domain at home).
* You *might* get a warning that your IP address didn't change, if you are testing from your home LAN.  This is OK ''only'' if you are testing from home.  If you are in Starbucks, your IP *ought* to change from Starbucks's IP to your home IP.  At home, it will "change" from your home IP to your home IP, resulting in no difference.
* The icon will turn green to let you know it is connected.
* If you open a Windows Command prompt and type "tracert google.com", the trace ought to show that the first hop is "10.16.0.1", then your home's router(s), and then it heads off to the internet.
* You should be able to do web browsing via your VPN.
* To disconnect, right-click on the OpenVPN icon in the Tray and select "Disconnect".

-----

[Return to Surf Safe at Starbucks](/content/surf-safe-starbucks#configure_windows)
