---
categories: []
layout: post
title: Diagnosing Network Latency (Slowness) On Our Home Network
created: 1376760465
redirect_from: /content/diagnosing-network-latency-slowness-our-home-network
---
Here are some notes on diagnosing network latency (slowness) on our home internet connection:

Rule #1 - Do this on a wired network connetion -- not a WiFi.  WiFi problems are entirely different than general internet problems.  Solve *internet* problems separately from *WiFi* problems.

    tracert google.com

This will give you a line of output for each router between your PC and google.  You can control-C to interrupt it after 3 lines of output.  Your output will look something like this, if things are healthy:

    1   <1 ms   <1 ms   <1 ms   some-router-1 [192.168.8.1]
    2    1 ms    1 ms   <1 ms   some-router-2 [192.168.1.254]
    3   21 ms   20 ms   23 ms   blah-blah.sbcglobal.net [99.39.252.3]

Here's what this means:

* tracert is going to bounce 3 packets off each router between you and google.com
* The first router it found was some-router-1.  (This router is part of our LAN because it has 192.168.x.x.)
    * For the first packet, it bounced in less than 1/1000th of a second
    * For the 2nd packet, it bounced in less than 1/1000th of a second
    * For the 3rd packet, it bounced in less than 1/1000th of a second
    * The router name is some-router-1, and it has IP address 192.168.8.1
* The 2nd router it found was some-router-2.  (This router is part of our LAN because it has 192.168.x.x.)
    * For the first packet, it bounced in less than 1/1000th of a second
    * For the 2nd packet, it bounced in less than 1/1000th of a second
    * For the 3rd packet, it bounced in exactly 1/1000th of a second
    * The router name is some-router-2, and it has IP address 192.168.1.254
* The 3rd router is owned by AT&T.  (You can tell it is not part of our network because its IP address is NOT 192.168.x.x.)
    * For the first packet, it bounced in less than 21/1000th of a second
    * For the 2nd packet, it bounced in less than 20/1000th of a second
    * For the 3rd packet, it bounced in exactly 23/1000th of a second
    * The router name is (something ending with sbcglobal.net), and it has IP address 99.39.252.3.

What's this mean?

We have short Ethernet wiring between the PC and the first router, and short Ethernet wiring between the 1st router and the 2nd.  Data moves really fast over Ethernet.  Data moves really reliably over Ethernet.  So long as these two routers are healthy, 99% of these bounced packets ("pings") will come back in about 1 millisecond.  If lots of them take longer than 1 msec, we probably need to reboot one of the routers.  (Ask Dad first!)

We have phone wires running from our house to the AT&T box several blocks away.  Phone wires are not good for networking, and these wires are much longer than our inside-the-house wires.  The phone company has to do some funky stuff to move data over these wires.  When the funky stuff is working, it takes 20-25 milliseconds to ping the phone company's router.

Things are more complicated over the phone wires.  If the wires pass by someone's house and someone in that house starts their clothes dryer (or other large electricity user), it can generate electrical noise, and that noise can interfere with our data moving along the phone lines.  If there's a thunderstorm within several miles, those lightning strikes generate noise which can interfere with your data.

And the phone company's router is also servicing everyone else in the neighborhood, so sometimes it is too busy to promptly reply to your ping.  Responding to pings is the least important thing the router does, so it will prioritize all other work ahead of your pings.

Based on my experiments, if the telco router responds to 80% of your pings within 25 milliseconds, that's as good as it gets with our internet service.

You can also use the "ping"command, after you use the tracert command.  tracert shows you the IP address of the routers.  If you want to do extra pings on a router (perhaps to see whether it is *consistently* fast):

* ping -n 99 192.168.8.1

(Of course you should use the IP address of the router you're interested in, if it isn't 192.168.8.1).  This example will ping the router 99 times, instead of the 3 times which tracert uses.

This is all useful to tell *where* the latency (slowness) is coming from.  You have to know what piece of your connection is slow in order to fix it.

* If a router inside our home is slow once in a while, we fix it by rebooting it.
* If a router inside our home is constantly slow, ask Dad to look into it.
* If the telco router is slow once in a while, we live with it.
* If the telco router is constantly slow, we call AT&T and complain about it.
* If the slowness occurs *after* the telco router, there's little we can do about it.  Either the Internet is slow or the site you are using is slow.  There's nobody to complain to when the Internet doesn't work.  You could try contacting the help desk at your web site to ask them if they can speed up their connection to the Internet.

-----

Note: For comparison purposes, pinging one of our internal routers via a good WiFi connection takes from 1.5 to 5 msec, with *lots* of variance.  WiFi is *radio* and lots more stuff interferes with radio, so you'll get an occasional ping time of something like 100 msec.
