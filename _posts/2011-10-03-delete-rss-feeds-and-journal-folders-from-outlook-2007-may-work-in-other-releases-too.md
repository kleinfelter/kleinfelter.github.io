---
excerpt: "First, exit Outlook.\r\n<p>\r\n<b>Regedit:<b>\r\n<p>\r\n<pre>\r\nHKEY_CURRENT_USER\\Software\\Policies\\Microsoft\\Office\\12.0\\Outlook\\Options\\RSS\r\nDWORD:
  Disable\r\nValue: 1\r\n</pre>\r\n<p>\r\n<pre>\r\nHKEY_CURRENT_USER\\Software\\Policies\\Microsoft\\Office\\12.0\\Outlook\\Options\\Journal\r\nDWORD:
  Disable\r\nValue: 1\r\n</pre>\r\n<p>\r\nThen run <a href=\"http://mfcmapi.codeplex.com/\">MFCMapi</a>
  and delete the folders:\r\n<ul>\r\n<li>Click OK when it shows its start-up message.\r\n<li>Click
  Session->Logon and Display Store Table.\r\n<li>If you get a prompt to choose a profile,
  choose the one you want to change.\r"
categories: []
layout: post
title: Delete RSS Feeds and Journal Folders From Outlook 2007 (May work in other releases
  too)
created: 1317673249
---
First, exit Outlook.
<p>
<b>Regedit:<b>
<p>
<pre>
HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\12.0\Outlook\Options\RSS
DWORD: Disable
Value: 1
</pre>
<p>
<pre>
HKEY_CURRENT_USER\Software\Policies\Microsoft\Office\12.0\Outlook\Options\Journal
DWORD: Disable
Value: 1
</pre>
<p>
Then run <a href="http://mfcmapi.codeplex.com/">MFCMapi</a> and delete the folders:
<ul>
<li>Click OK when it shows its start-up message.
<li>Click Session->Logon and Display Store Table.
<li>If you get a prompt to choose a profile, choose the one you want to change.
<li>Double-click on Mailbox... in the list.
<li>Expand the tree control to show Root->IPM_Subtree
<li>Right-click on the folder to delete, and select Delete.
</ul> 
<p>
Start up Outlook and bask in the glory of success.
