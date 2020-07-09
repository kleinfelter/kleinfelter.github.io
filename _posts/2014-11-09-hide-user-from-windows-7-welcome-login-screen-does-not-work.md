---
categories: []
layout: post
title: Hide User From Windows 7 Welcome/Login Screen - Does Not Work
created: 1415538583
redirect_from: /content/hide-user-windows-7-welcomelogin-screen-does-not-work
---
There are a million and one tutorials on how to hide an account from the Windows 7 (and Windows Vista and Windows 8) Welcome screen.  They all say to create a DWORD under

    HKLM\Software\Microsoft\Windows NT\CurrentVersion\WinLogon\SpecialAccounts\UserList

where the DWORD name is the account name to hide and the DWORD value is zero.

Sometimes it doesn't work.  The trick is that Windows (like Unix/Linux) has two names for an account.  There is the 'user name', which is often something like billsmith, and the 'user full name' which is something like 'William Smith, III'.  The full name is really just descriptive text, and the *actual* user ID is billsmith (in this case).

Windows shows the user full name on the Welcome screen.  If you make the DWORD name match the user full name (e.g. 'William Smith, III') it will NOT hide the account.  You must use the user name (e.g. 'billsmith').

But... If you are using the Home versions of Windows 7, there is no way to edit the user name -- just the user full name.  Fortunately, there is a way to show the user name.  Open a Command prompt, and type 

   net user

This will list all of the user names (not the user full names).  Be sure that the DWORD name matches one of these names, not the names you see on the Welcome screen.
