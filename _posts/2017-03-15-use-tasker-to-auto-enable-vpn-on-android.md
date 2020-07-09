---
categories: []
layout: post
title: Use Tasker to Auto-enable VPN on Android
created: 1489590073
redirect_from: /content/use-tasker-auto-enable-vpn-android
---
### Install and Launch Tasker

* Download and install Tasker via the Play Store icon on your phone.  (It is called "Tasker" and it is by "Crafty Apps EU".)
    * Tasker allows you to create many rules of the form, "If this is the case, do that."  You can tell it to run OpenVPN if you are on WiFi and the WiFi has the 'wrong' name.
* Launch Tasker

### Add a "Pause a Few Sec" task

* From the Profiles/Tasks/Scenes page in Tasker, choose Tasks, press "+", and name your new task "Pause a Few Sec".  This will give your phone a few seconds to *finish* connecting to the underlying WiFi before trying to launch VPN.
* You'll see "Pause a Few Sec" at the top of the screen.
* Press "+" to add an action: Choose *Task* and then *Wait*
    * Set *Seconds* to 5, leave other values at 0, and press the back button to return to the Task Edit screen.

### Add a "VPN Connect" task

* From the Profiles/Tasks/Scenes page in Tasker, choose Tasks, press "+", and name your new task "VPN Connect".
* Press "+" to add an action: Choose *System* and then *Send Intent*.  Give it the following values, and then press the back button to return to the Task Edit screen.  Check your spelling and your upper/lower case.  You have to get this exactly right.
    * Action: android.intent.action.VIEW
    * Extra (the first one): net.openvpn.openvpn.AUTOSTART_PROFILE_NAME:open_vpn_profile_name
        * Replace open_vpn_profile_name with ''home-vpn-1'' (or whatever you named your profile, if you didn't follow my instructions).
    * Package: net.openvpn.openvpn
    * Class: net.openvpn.openvpn.OpenVPNClient
    * Target: Activity

### Add a "VPN Disconnect" task

* From the Profiles/Tasks/Scenes page in Tasker, choose Tasks, press "+", and name your new task "VPN Disconnect".
* Press "+" to add an action:  Choose *System* and then *Send Intent*.  Give it the following values and then press the back button to return to the Task Edit screen.
* Action: android.intent.action.VIEW
* Package: net.openvpn.openvpn
* Class: net.openvpn.openvpn.OpenVPNDisconnect
* Target: Activity

### Add a "Foreign Wifi Connected" profile 

* From the Profiles/Tasks/Scenes page in Tasker, choose Profiles, press "+",  choose Context = "State", Category = "Net", then "Wifi Connected". 
* Give it the following values and then press the back button to return to the Task Edit screen.
    * SSID: your_home_ssid
        * Replace your_home_ssid with your home's WiFi SSID name.
    * Inverted: checked
    * Press the back button, to return to the Profiles screen.
    * It will demand a Task.  Choose VPN Connect.
    * Press and hold "Not Wifi Connected your_home_ssid"
    * Choose "Add" and add another State.
        * State = Net, Net State = WiFi Connected.  Leave all values blank.
    * Press the back button to return to the Profiles screen.
* At this point you have a profile which says:
    * If you are WiFi connected and it isn't your home WiFi, run the VPN Connect task.

### Add a “Not Home Wi-Fi Connected” Profile

* From the Profiles/Tasks/Scenes page in Tasker, choose Profiles, press "+",  choose Context = "State", Category = "Net", then "Wifi Connected". 
* Give it the following values and then press the back button to return to the Task Edit screen.
    * (all fields blank)
    * Inverted: checked
    * Press the back button, to return to the Profiles screen.
* It will demand a Task.  Choose VPN Disconnect.
    * Press the back button to return to the Profiles screen.
* At this point you have a profile which says:
    * If you aren't connected to WiFi, run VPN Disconnect.
    * We're relying on the assumption that you can't go from a foreign WiFi to your home WiFi, without at least a brief disconnect.

Note: In many WiFi hotspots, your browser is redirected to a "captive portal", where you must accept terms and conditions.  Your VPN will probably not connect until after you do this.

-----

[Back to Surf Safe at Starbucks](/content/surf-safe-starbucks#autoconnect)

