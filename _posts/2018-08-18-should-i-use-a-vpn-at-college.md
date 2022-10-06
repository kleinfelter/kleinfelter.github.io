---
title: Should I Use a VPN at College?
layout: post
---

*I've moved away to college.  When should I be using a VPN?*

The internet is a scary place.  Before you reach the internet, your traffic must first travel through your LAN (local area network).  When you were at home, your LAN was safe.  When you're away from home, your LAN isn't safe.

The main difference is that at home, your computer is hidden from the outside world by your gateway router.  

Due to the magic of NAT (Network Address Translation), computers outside your home cannot 'see' computers inside your home, unless your home computer reaches out to touch them.  In other words, your computer at home can *initiate* a conversation with a computer outside your LAN, but a computer outside your LAN cannot *initiate* a conversation with your home computer.

When you're behind a NAT router, computers on your LAN can initiate a conversation with you and they can also 'listen in' on conversations your computer has with other computers.  External computers can't.

At college, one or two things happen.  At a few colleges, there is no NAT, and every computer on the network is visible to the entire internet.  At most colleges, there is NAT, but there may be 10,000 computers on your LAN and they can all see your computer.  Colleges are full of smart people with lots of time on their hands.  Some of them may be studying computer security, and they might enjoy seeing what they can do to your computer.

Short answer:

* Be sure to run a firewall, whether or not you run VPN.  VPNs hide your traffic. They don't hide your computer.
* Use VPN when you do something you don't want everyone to see.
* VPN is more work, and it is slower than not using VPN, so you might not want to use it for everything.
* Really, really be sure to use it when accessing financial accounts or your email.
* Your college might object to VPN or  prevent VPN.

## What Does a VPN Protect You From?

#### VPN Tunnel

A VPN (Virtual Private Network) is a pipeline (tunnel) from your local LAN to another, distant LAN.  Your network traffic travels from your computer to the distant LAN, and then it goes to the internet.  Nobody on your local LAN can see the traffic while it is inside the tunnel.

*Some* VPNs hide the local LAN from your computer while you are connected to the VPN.  Others don't.  It is often a configuration option.

#### VPN Is Not a Firewall

Running a VPN does not protect you from your classmates hacking into your computer.  Every computer on your LAN can see your computer.  If your college does not use NAT, every computer on the internet can see your computer.  

If they can see your computer, they can try to hack into your computer.  Your primary protection is to use a firewall.  Windows, macOS, and Linux all come with firewalls.  You should never, *ever* connect your computer to the college network without its firewall running.  Without a firewall, your computer can be compromised in minutes, particularly if you are behind on applying updates.

#### VPN Prevents Content Leakage

Modern, secure web sites use HTTPS to move data between your browser and the site.  HTTPS is 'secure,' meaning that nobody can see what you send or receive.  But some web sites exchange data in HTTP, which is not secure.   Even if the main site uses HTTPS, some of them move some data with HTTP.  
 
There was a big brouhaha a few years back, where major sites were moving cookies with HTTP before they switched to HTTPS to show you the main web page.  Bad guys could capture these cookies.  They could use them to masquerade as you, and access the web site.  Once they were on the web site, they could change the password -- your password.  Oops!  See [Firesheep](https://en.wikipedia.org/wiki/Firesheep) for more info.  This issue has been addressed by the major web sites (Gmail, Facebook, Twitter, etc.)  Bob's Bargain Web Site may not have fixed it.

If you use VPN, all of your web traffic is hidden from your local LAN by the tunnel.  It's not just your web traffic.  ALL of your network traffic is hidden.

* Whenever you are entering a user ID and a password, **check to be sure your URL begins with "https://"**.  
    * If you are using a modern version of Chrome, which hides "http://" and "https://" in the address bar, it will show "Secure" at the beginning of the address bar instead of "https://" and "Not Secure" otherwise.
* Use a VPN if you are logging into your bank (or other financial web site), email (or any Google service, since they all share your GMail login)
    * You really, really don't want someone to see your bank ID/password.  You don't want them to break into your email account because they can use your bank's "forgot my password" feature to send a new bank password to your email account.

#### Proxies and WPAD

There's this thing called a proxy server.  Your college *may* hide the internet from your computer by a firewall.  But you want to browse the internet.  To get around this, there's a thing called a 'proxy server.'  YOUR computer isn't allowed to talk to the internet, but the proxy server is.  So instead of talking to the internet directly, your browser says to the proxy, "Hey! Go get this page for me," and the proxy fetches it and gives it to your browser.

A proxy server has some visibility into your network traffic.  (More on this later.)

Your computer has to discover the proxy server in order to use it.  Your browser uses something called WPAD (Windows Proxy Auto Discovery) to discover the proxy.  Even on many non-Windows computers, despite the name.  

WPAD has some shortcomings.  A bad guy can trick your computer into using the wrong proxy by setting up his own WPAD server.  Thats' bad.

If you are using Windows, I recommend that you edit C:\Windows\System32\drivers\etc\hosts, and append a line with:

* `255.255.255.255 wpad.`

The trailing period is important.  You will have to use an Administrator-enabled account to edit the file.

This will disable WPAD.  If that breaks your internet access, you'll have to un-delete it or ask your college help desk how to manually specify an auto-proxy server.  Tell them you can't use WPAD and you need help configuring your browser to use a manually specified URL for the proxy auto-config file.

**I recommend disabling WPAD, whether or not you use VPN.**  If you do not disable WPAD and you do use VPN, it is more difficult for a bad guy to use WPAD to trick your computer into using a bad proxy.  It is not impossible.  That's why I recommend disabling WPAD.

#### College Snooping

Colleges sometimes try to be your parents at their worst.  Read about "in loco parentis," if you want to know why.  If you are using HTTP, they can see all your web traffic.  If you are using HTTPS, they can't see inside the web pages, but they can still tell which web sites you visit.  If you browse to http://people-doing-vile-and-nasty-things, you might not want your school to know.  Shucks, they may actually prevent you from browsing there.  If you really want to visit that site, perhaps to do research for an Abnormal Psychology term paper, a VPN can (mostly) hide the fact that you're going there from your college.

So privacy is one reason to use a VPN.

Colleges may have a list of web sites they don't want you to visit.  They may have protocols (such as BitTorrent) that they don't want you to use.  A VPN can work around college blocking.  Exercise caution here.  In all of those papers you signed when you enrolled, and all of those "I read this" checkboxes you checked online, you may have agreed to something like, "I promise not to circumvent web site blocking and you can spank me if I do."

Colleges may outright block VPN because people use it to work around site blocking.  You might be able to work around their blocking of VPN.  It is generally a bad idea, because even if you work around a VPN block, they can still tell that you are using VPN if they try hard enough.  If they block VPN, they probably have a policy against working around the block.  They may or may not send you a warning letter before they expel you (or disable your internet access) for violating policy.

#### Changing Your Location

Maybe you run into a web site which says, "We don't allow access to people who live where you live."  When you use a VPN, they don't see your local LAN as being where you live -- they see your VPN LAN as your home.  You now "live" somewhere different.

This is actually a common use for commercial VPN by some people.  You can buy access to a commercial VPN and, if you live in the USA, you can use the VPN to look like you live in Europe, or vice versa.  If you want to watch a movie which is only available in some countries, this is a way to "live" in a different country.

#### Hiding Your Tracks

I include 'Hiding Your Tracks' here for completeness -- not as a guide.

If you're trying to break into a web site, you want to be hard to find.  If you just casually start hacking, they'll probably find you in your dorm room.  You could use VPN to cover your tracks.  In fact, some criminals use VPN #1 to connect to VPN #2 to connect to VPN #3, to be really hard to find.

Don't do this.  If you're committing a big enough crime to make this worth the effort, you're committing a big enough crime for the FBI to go to the trouble to track you down despite your VPN.  If you're crossing state lines, you're committing Interstat Wire Fraud, and that's a federal crime.  It doesn't matter how smart you are.  Eventually, you'll slip up and leave a track somewhere.  Perfection is not achievable.

#### It Isn't Free

* Using a VPN takes effort.
* Using a VPN slows your traffic.  Instead of going directly to the site, your traffic must detour to the VPN's LAN first.
* Using VPN uses bandwidth of your VPN provider.  If your VPN provider is a company, you probably don't care. If your VPN provider is Dad, Dad's ISP probably has a bandwidth cap and you'll annoy Dad if you make him hit that cap.
    * *But I never hit the cap at home!*  Yeah, but now you are using DOUBLE the bandwidth.  All of your traffic first travels *into* Dad's LAN and then it turns around and travels *out* from Dad's LAN.

## Summary

*I've moved away to college.  When should I be using a VPN?*

* Be sure to run a firewall, whether or not you run VPN.  VPNs hide your traffic. They don't hide your computer.
* Use VPN when you do something you don't want everyone to see.
* VPN is more work, and it is slower than not using VPN, so you might not want to use it for everything.
* Really, really be sure to use it when accessing financial accounts or your email.
* Your college might object to VPN or prevent VPN.
