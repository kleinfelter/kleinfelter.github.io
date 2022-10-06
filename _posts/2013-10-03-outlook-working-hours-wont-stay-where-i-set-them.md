---
categories: []
layout: post
title: Outlook Working Hours Won't Stay Where I Set Them
created: 1380808244
redirect_from: /content/outlook-working-hours-wont-stay-where-i-set-them
---
Outlook developed a bothersome behavior.  Seemingly on random days, it would change my work hours to be later than I set them.  I'd shrug my shoulders, set them back where I wanted them, and then a few days later, they'd change again.

At first, I thought the domain admins were applying a group policy.  I found that it gets saved in \\HKCU\Software\Microsoft\Office\version-number-here\Outlook\Options\Calendar in the CalDefStart and CalDefEnd entries.  I was thinking I'd set it where I wanted it, export the registry key, and load in in my StartUp folder.

Then I realized that it *might* be happening on the day after I used an HVD (Hosted Virtual Desktop).  I *suspect* that what is happening is that when I use the Outlook in my HVD, *that* sets the working hours.  It could be something borked in Outlook, or it could be that there is a policy applied to the HVD which is changing it, and then Exchange syncs it to my main Outlook.  Since our HVD uses ProfileUnity to copy the user profile, I suspect that PU is doing it.
