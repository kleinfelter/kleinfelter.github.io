---
categories: []
layout: post
title: Disable Software Update Notices In Mac OS X
created: 1414979612
redirect_from: /content/disable-software-update-notices-mac-os-x
---
System Preferences >> App Store.  (It *is* there in Mavericks -- look for the blue circle with the big, stylized "A" in the second row from the bottom.
- - - - - -
This reportedly works in Mavericks.  Dunno if it works in Yosemite.

    sudo defaults write /System/Library/LaunchAgents/com.apple.notificationcenterui KeepAlive -bool False

per http://apple.stackexchange.com/questions/106149/how-do-i-permanently-disable-notification-center-in-mavericks

- - - - -

You might be able to control-click on the Update button for the update in App Store, and select Ignore Update.

