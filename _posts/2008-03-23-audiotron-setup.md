---
excerpt: "<p>I still use (and love) my Audiotron.&nbsp; The facts that it accesses
  files via SMB and does not require a TV to operate it are the chief reasons.&nbsp;
  Setting up the Audiotron can be an epic task.&nbsp; Here's a checklist to try when
  you get &quot;Error accessing share&quot; when you search for files:</p>"
categories: []
layout: post
title: Audiotron Setup
created: 1206322069
---
<p>I still use (and love) my Audiotron.&nbsp; The facts that it accesses files via SMB and does not require a TV to operate it are the chief reasons.&nbsp; Setting up the Audiotron can be an epic task.&nbsp; Here's a checklist to try when you get &quot;Error accessing share&quot; when you search for files:</p>
  <ol>
    <li>Check that the user ID and password at <a href="http://audiotron/filecfg.asp">http://audiotron/filecfg.asp</a> match the ID and password you set up on your server. </li>
    <li>Check to see if you can access the server from ANOTHER computer using the ID/password you assigned at <a href="http://audiotron/filecfg.asp">http://audiotron/filecfg.asp</a></li>
    <li>Share 1 at <a href="http://audiotron/shares.asp">http://audiotron/shares.asp</a> should be <a href="file://servername/SHARENAME/RADIO.XML">\\SERVERNAME\SHARENAME\RADIO.XML</a></li>
    <li>Share 2 at <a href="http://audiotron/shares.asp">http://audiotron/shares.asp</a> should be <a href="file://servername/SHARENAME">\\SERVERNAME\SHARENAME</a></li>
    <li>&quot;Search all folders in shared folders listed below&quot; should be selected at <a href="http://audiotron/shares.asp">http://audiotron/shares.asp</a></li>
    <li>Go to Control Panel/Administrative Tools/Locas Security Settings and make sure &quot;Microsoft network server: Digitally sign communications (always)&quot; is DISabled. </li>
    <li>Turn OFF your firewall on your PC. </li>
    <li>Does your server have more than one NIC?&nbsp; 
      <ol>
        <li>Try disabling all NICs except for the one you want the Audiotron to use.&nbsp; This fixed it for me one time.&nbsp; The Audiotron software was written in a time when multiple NIC&nbsp;home PCs&nbsp;were rare. </li>
        <li>If disabling the other NICs fixed it, but you need to use them: right-click on the other NIC, select Properties/Internet Protocol(TIP/IP)/Properties/Advanced/WINS and DISable NetBIOS over TCP/IP for the NICs you don't want the Audiotron to use.&nbsp; You have to do this on all the non-NetBIOS NICs, and you may have to reboot both the PC and the Audiotron to get it to &quot;take.&quot; </li>
        <li>According to <a href="http://tech.groups.yahoo.com/group/audiotron/message/594">http://tech.groups.yahoo.com/group/audiotron/message/594</a>&nbsp;: 
          <ol>
            <li>The AT broadcasts a NETBIOS query to find the address of the host. </li>
            <li>The PC responds with ALL of its IP addresses. </li>
            <li>The Audiotron chooses the first address, regardless of whether it is for the subnet the Audiotron is on. </li>
          </ol>
        </li>
        <li>Dunno whether the XP PC sends too many addresses or it should send the right subnet first, or whether the Audiotron is at fault for not choosing the right one. </li>
        <li>Note: It is currently taking about 45 seconds for the AT to locate the RADIO.XML file.&nbsp; I wish I had a network monitor so I could see what is taking all that extra time. </li>
      </ol>
    </li>
    <li>If you have VMWare (or VirtualBox or AndLinux or Colinux or Microsoft Virtual PC or Xen or...) then your virtual NICs count as NICs.&nbsp; See the &quot;Does your server have more than one NIC&quot; entry above. </li>
    <li>Special note for using an Audiotron with Mac OS X (Leopard).&nbsp;&nbsp;I was getting&nbsp;eDSAuthFailed in /var/log/samba/log.smbd when the Audiotron did a file search.&nbsp; I changed the user-ID that the Audiotron uses to access the share to an invalid user name (one that does not exist on the Mac), and it successfully accessed the share as &quot;nobody&quot;. </li>
    <li>To create a TOC (table-of-contents) file: <a href="http://audiotron/apidumptoc.asp?share=\\boxtop\mp3">http://audiotron/apidumptoc.asp?share=\\boxtop\mp3</a></li>
    <ol>
      <li>&quot;audiotron&quot; should be the IP name or address of your audiotron.&nbsp; Mine really is DNS-name &quot;audiotron&quot;.&nbsp; <a href="file://\\boxtop\mp3">\\boxtop\mp3</a> should be the server and share name of you music.</li>
    </ol>
  </ol>
