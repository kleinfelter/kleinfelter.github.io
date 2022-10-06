---
categories: []
layout: post
title: How to Locate Which Link Is Dropping Your Data
created: 1325871527
redirect_from: /content/how-locate-which-link-dropping-your-data
---
Suppose you have two computers -- we'll call one 'Client' and the other 'Server' -- and you're experiencing dropped frames <em>somewhere</em> between them.  You'd like to know exactly which hop is dropping them, so you know who to call to fix the problem.  Here's a step-by-step guide to identify which link is dropping your data.

Some assumptions:
<ul>
<li>We'll assume that Client is client.example.com and Server is server.example.com.
<li>I'll assume that Client is a Windows PC.  If you're using a Unix based system, substitute "traceroute" where I've said "tracert".
<li>When I say "ping the router", I want you to use your operating system's ping command, with the necessary options to cause ping to continuously ping that router's IP address until you press Control-C.  On Windows this might look like, "ping  -t  127.0.0.1"
</ul>

The steps:
<ol>
<li>From Client, run this command: tracert server.example.com
<li>You'll get a long list of times and IP addresses.  Make a list of those IP addresses (on paper, in Notepad, with vi, etc.).  
   <ul>
   <li>Make sure you keep those addresses in the same sequence that tracert provided them.  
   <li>For any rows where tracert does not print an address, just ignore that row.
   <li>Number your list from 1 to n, where n is the number of addresses.  
   <li>For the rest of these instructions, I'll assume that n is 20.
   </ul>
<li>ping the last router (e.g. The 20th address.)
   <ul>
   <li>Depending on how bad your packet loss is, you may immediately see errors about timeouts, or you may have to let it run for a few minutes.  If you don't see any errors, you're not CURRENTLY experiencing packet loss, so try again later.
   <li>Notice how long it takes you to get your first error.  Take that time and multiply it by 4.  For subsequent steps in this guide, the x4 time is how long you have to wait before you decide that your link is clean if you don't get an error.  (e.g. If you get an error after 10 seconds, you'll use 40 seconds in the remaining steps.)   We'll call this WAIT_TIME.
   </ul>
<li>Now ping your middle router.  (e.g. The 10th address).  Wait up to WAIT_TIME seconds or until you get an error, whichever comes first.
<li>If you got an error, delete all routers in your list which you've numbered higher than this router.  (e.g. 11, 12, 13, 14, 15, 16, 17, 18, 19, 20).  If you did NOT get an error, delete all the routers numbered lower than this router, and also delete this router.  (e.g. 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
<li>Re-number your list of routers.
</ol>
Repeat the last 3 steps in the list above, until you can identify the router closest to Client where errors happen.  Your packets are getting dropped between that router, and the router which is one hop nearer to Client.  Call the owner of that link (or call the owners for EACH of these 2 routers).
