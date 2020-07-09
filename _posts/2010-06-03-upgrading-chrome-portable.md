---
excerpt: "<p>I have Chrome Portable 4.1.249.1036 (41514).&#160; I'm having trouble
  with extensions crashing.&#160; One of the extension vendors suggested upgrading
  to a newer version.&#160; Google has 5.0.375.55 at chrome.google.com, so here's
  how I (tried to) upgrade.</p>  <p>Chrome 4 is installed in S:\\Chrome-Portable.&#160;
  I'm going to (try to) put Chrome 5 in S:\\Chrome-Portable-5.</p>"
categories: []
layout: post
title: Upgrading Chrome Portable
created: 1275615994
---
<p>I have Chrome Portable 4.1.249.1036 (41514).&#160; I'm having trouble with extensions crashing.&#160; One of the extension vendors suggested upgrading to a newer version.&#160; Google has 5.0.375.55 at chrome.google.com, so here's how I (tried to) upgrade.</p>  <p>Chrome 4 is installed in S:\Chrome-Portable.&#160; I'm going to (try to) put Chrome 5 in S:\Chrome-Portable-5.</p>  <ol>   <li>Install from chrome.google.com.&#160; Google installed itself to C:\Documents and Settings\username\Local Settings\Application Data\Google\Chrome\Application.</li>    <li>Copy S:\Chrome-Portable to S:\Chrome-Portable-5</li>    <li>Rename S:\Chrome-Portable to S:\Chrome-Portable-4 (just in case some of the files I copied refer to S:\Chrome-Portable).</li>    <li>Start Chrome Portable from S:\Chrome-Portable-5, just to be sure it works before I start messing with it.</li>    <li>Copy the contents of C:\Documents and Settings\username\Local Settings\Application Data\Google\Chrome\Application to S:\Chrome-Portable-5\App\Chrome-bin.</li>    <li>Delete S:\Chrome-Portable-5\App\Chrome-bin\4.1.249.1036.</li>    <li>Run S:\Chrome-Portable-5\GoogleChromePortable.exe, and check the version.&#160; It reports 5.0.375.55.</li>    <li>Uninstall the installed Chrome via Control Panel.&#160; (The uninstall in the Google Chrome folder of the Start menu failed to find setup.exe.)&#160; Choose &quot;Also delete my browsing data.&quot;</li>    <li>Run S:\Chrome-Portable-5\GoogleChromePortable.exe, and check the version.&#160; It reports 5.0.375.55.</li>    <li>Spot check some extensions.&#160; They work.</li>    <li>Call it a success.</li> </ol>
