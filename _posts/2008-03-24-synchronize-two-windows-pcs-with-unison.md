---
excerpt: "<p>Unison is a wonderful tool.&nbsp; Cygwin is a wonderful tool.&nbsp; Windows
  is the dominant desktop platform.&nbsp; Synchronizing two PCs with Unison, where
  both run Windows is possible, with the aid of Cygwin.</p>\r\n  <p>Unison+Windows+Cygwin
  is NOT obvious to set up.&nbsp; Here's what I did:</p>"
categories: []
layout: post
title: Synchronize Two Windows PCs With Unison
created: 1206400789
---
<p>Unison is a wonderful tool.&nbsp; Cygwin is a wonderful tool.&nbsp; Windows is the dominant desktop platform.&nbsp; Synchronizing two PCs with Unison, where both run Windows is possible, with the aid of Cygwin.</p>
  <p>Unison+Windows+Cygwin is NOT obvious to set up.&nbsp; Here's what I did:</p>
  <ol>
    <li>Install Cygwin.&nbsp; Include Open-SSH when you install.</li>
    <li>From a Cygwin shell prompt, enter &quot;ssh-host-config&quot;.&nbsp;</li>
    <ol>
      <li>Answer all yes/no questions with yes.</li>
      <li>CYGWIN value is &quot;ntsec tty&quot;</li>
      <li>Privilege separation is NO.</li>
      <li>Do not create an sshd user.</li>
      <li>Note: I run sshd under my personal user-ID instead of sshd, because service accounts&nbsp;don't get to access network shares, and I sometimes want that.</li>
    </ol>
    <li>Ensure that 'kevin' (my Windows user) has Full Control privileges (via Windows Explorer and item properties) to </li>
    <ol>
      <li>C:\cygwin</li>
      <li>C:\cygwin\var</li>
      <li>C:\cygwin\var\log</li>
      <li>C:\cygwin\var\log\sshd.log</li>
      <li>C:\cygwin\var\log\lastlog</li>
    </ol>
    <li>Using the Services applet, change the logon user for the &quot;Cygwin sshd&quot; service to kevin.</li>
    <li>Ensure that you can access the Windows server via ordinary ssh login.</li>
    <li>If you use any SUBST drives in Windows, you may need to add to your Cygwin .profile something like &quot;subst K: F:\\k-drive&quot;</li>
    <li>Make sure that unison is in a directory on your PATH on the server.&nbsp; You can eventually get it to work not on your PATH, but there are so many things that can go wrong when you're setting this up that you really want to eliminate this potential source.&nbsp; (Is it /cygdrive/c/bin/unison.exe or is it C:\\bin\\unison.exe or is it C:/bin/unison.exe, etc.)</li>
    <li>The first few lines of your &quot;.prf&quot; file look something like the following.&nbsp; Note that there is a SINGLE slash between winserver and k:.&nbsp; With a Unix&nbsp; host, you'd have TWO slashes.&nbsp; This is because your root is K:/ and it is NOT &quot;/K:/&quot;.&nbsp; In Unix, your root is /, you you get &quot;ssh://user@host/&quot; followed by the root &quot;/&quot;.</li>
  </ol>
  <p>&nbsp;</p>
  <pre>
root = K:\
root = ssh://kevin@winserverserver/k:/
servercmd =  unison-2.28.9-win-text.exe</pre>
