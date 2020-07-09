---
excerpt: "<p>I've been burned a few times by the Microsoft Loopback Adapter (MLA).&nbsp;
  It's a nice idea to have a loopback adapter, but it appears to me that when a program
  asks Windows for an adapter (pick an adapter, any adapter) Windows either provides
  the loopback adapter as the default, or when a program asks for a list of adapters,
  the&nbsp;MLA is the first adapter in the list.</p>\r\n  <p>So what? There is lots
  of software out there that once it finds a connected adapter, it stops looking for
  better adapters.&nbsp; Yeah, I know that isn't the fault of the MLA,&nbsp; but here's
  the effect:</p>"
categories: []
layout: post
title: Microsoft Loopback Adapter, How Do I Despise Thee -- Let Me Count the Ways
created: 1225040775
---
<p>I've been burned a few times by the Microsoft Loopback Adapter (MLA).&nbsp; It's a nice idea to have a loopback adapter, but it appears to me that when a program asks Windows for an adapter (pick an adapter, any adapter) Windows either provides the loopback adapter as the default, or when a program asks for a list of adapters, the&nbsp;MLA is the first adapter in the list.</p>
  <p>So what? There is lots of software out there that once it finds a connected adapter, it stops looking for better adapters.&nbsp; Yeah, I know that isn't the fault of the MLA,&nbsp; but here's the effect:</p>
  <ul>
    <li>I've got a program that works well enough.</li>
    <li>I enable the MLA.</li>
    <li>Sometime later (maybe months later), I try to use the program again, and it fails.</li>
    <li>The <em>action </em>I took that caused the problem was to enable the MLA.</li>
  </ul>
  <p>Here are some programs that have failed after enabling the MLA:</p>
  <ul>
    <li>Oracle database server</li>
    <ul>
      <li>I forget the details.&nbsp; It was months ago.</li>
    </ul>
    <li>Belkin USB Network Hub (Model F5L009)</li>
    <ul>
      <li>&quot;Control Center&quot; can't find the Belkin device.&nbsp; The list comes up empty.</li>
    </ul>
  </ul>
