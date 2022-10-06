---
title: Remove OneDrive From Office 2016 Save Menu
layout: post
---

Office 2016 always offers the option of saving your file to OneDrive (via File/Save or File/Save As).  I hate that, because I don't use OneDrive.  To disable, set:

``HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\SignIn\SignInOptions = DWORD 3``
