---
title: How to Find the MAC of Your Amazon Smartplug
---

Sometimes you need to know the MAC address or the IP of your Amazon Echo Smartplug.  Here's how to find it.

If I ruled the universe, the MAC address would be printed on the side of the smartplug.  I don't, so it isn't.  

If you view your router's list of connected WiFi devices, and you look at just the smart-plug devices, you'll see something like:


| Name                                    | IP           | MAC |
| --------------------------- | -------- | -------- |
| AmazonPlug3EXM     | 192.168.1.199    | cc:9e:a2:00:21:07     |
| AmazonPlug2EAM     | 192.168.1.157    | cc:9e:a2:00:11:01     |
| AmazonPlug4RPQ     | 192.168.1.59        | cc:9e:a2:00:16:04     |
| ESP_20BC42                    | 192.168.1.202   | 3C:71:bf:18:32:44    |

Knowing it is "AmazonPlug4RPQ" isn't much help. I need to know things like:

* Which switch controls my fan?
* Which switch turns on the Christmas tree lights?
* Which switch turns on the bathroom nightlight?

My router's device page shows how long it has been since a device received its DHCP lease.  I walked from smartplug to smartplug, unplugging and re-plugging each device.  I made a note of the sequence of my visits.  Then I returned to the router DHCP lease time.  All of the smart plugs had a lease which started less than 10 minutes ago.  I noted the duration for each lease, and paired them up in the same order as my visit list.  Viola!

If your router does not show the DHCP lease duration, here's plan B:

* ping each smart plug by IP address, to confirm they're all online.
* Unplug one smart plug.  Ping each smart plug IP address, and see which one disappeared.
* Plug the smart plug back in.  Wait 10 seconds.  Confirm it now pings.
* Repeat the process for each smart plug.

If you have a label maker, print labels with each MAC address and label your smart plugs.  Don't bother to label with the IP address, because that can change over time, if your router has a whim.  MAC address is permanent.

-----

Keyword fodder: Amazon plug, Amazon smartplug, Amazon smart plug, Amazon Echo Plug, Amazon Echo Smartplug, Amazon switch, Amazon smart switch
