---
excerpt: "<p>Tested on Windows XP Pro SP2 on a Windows Domain network. The following
  instructions assume that you want to install to &quot;C:\\Program Files\\OpenSSH&quot;
  and that you want your SSH server to run under the user-ID &quot;sshd&quot; and
  that you'll create a home directory for sshd named C:\\OpenSSH-server.&nbsp; You'll
  need to edit where appropriate if you make other choices.</p>"
categories: []
layout: post
title: Set Up SSH Service on Windows
created: 1193343079
---
<p>Tested on Windows XP Pro SP2 on a Windows Domain network. The following instructions assume that you want to install to &quot;C:\Program Files\OpenSSH&quot; and that you want your SSH server to run under the user-ID &quot;sshd&quot; and that you'll create a home directory for sshd named C:\OpenSSH-server.&nbsp; You'll need to edit where appropriate if you make other choices.</p>
  <ol>
    <li>Install OpenSSH for Windows from <a href="http://sshwindows.sourceforge.net/">http://sshwindows.sourceforge.net/</a>&nbsp;into C:\Program Files\OpenSSH (or other directory of your choosing).&nbsp; I refer to this directory as [install-dir] throughout this document. </li>
    <li>Run the <a title="SSHD Setup Batch File" href="/files/sshd-setup.cmd">attached batch file</a> from a command prompt. </li>
    <li>Edit [install-dir]\etc\sshd_config and set UsePrivilegeSeparation to yes </li>
    <li>Right click on C:\OpenSSH-server, select the Security tab, and grant sshd (or whatever you named the account)&nbsp; and grant these permissions to the folder and subtree. 
      <ol>
        <li>Read </li>
        <li>Read &amp; Execute </li>
        <li>List Folder Contents </li>
        <li>Full Control </li>
        <li>Also make the sshd account the Owner of the folder and subtree. </li>
      </ol>
    </li>
    <li>Open the Services applet (from Control Panel/Administrative Tools) and change the OpenSSH service to use the sshd account. </li>
    <li>Stop and start the OpenSSH service. </li>
  </ol>
  <p>At this point you've got password login.&nbsp; There is more work to be done to enable PKI-based login.</p>
  <p>&nbsp;</p>
