---
excerpt: "I need to be able to find programs I already own that meet a need. I nearly
  bought a second copy of software that didn't meet my needs on the first purchase.
  \r\n  \r\n  <br />I'd love to use tagging. Here are the problems: \r\n  \r\n  <br
  />Google Desktop doesn't search metadata \r\n  \r\n  <br />Microsoft Desktop Search
  does search metadata, but it doesn't search Thunderbird email. \r\n  \r\n  <br />Copernic
  searches metadata and email, but … \r\n  \r\n  "
categories: []
layout: post
title: Notes on Desktop Search
created: 1229904115
---
I need to be able to find programs I already own that meet a need. I nearly bought a second copy of software that didn't meet my needs on the first purchase. 
  
  <br />I'd love to use tagging. Here are the problems: 
  
  <br />Google Desktop doesn't search metadata 
  
  <br />Microsoft Desktop Search does search metadata, but it doesn't search Thunderbird email. 
  
  <br />Copernic searches metadata and email, but … 
  
  <br />Microsoft PHLAT does keywords but it doesn't search Thunderbird, and it stores its tags in metadata that is not visible from Windows file property dialogs. <hr />Windows Search (Microsoft's indexed desktop search for Windows XP) - I don't use it for the following reasons: 
  
  <br />
  <ul>
    <li>When you un-install it, it wants you to un-install all programs installed after it, before you un-install it. </li>
    <li>It holds Outlook in memory, so you can't back-up Outlook mail files using standard backup applications. </li>
    <li>It removes the basic Windows search command.&nbsp; I want desktop search PLUS the basic windows scan-files-for-content, because not every file type gets indexed, and I need to be able to search for non-indexed files. </li>
  </ul>
  <p><strong>Update</strong>: You can retain the basic Windows search (via winkey-F or&nbsp; Start/Search):</p>
  <p>In RegEdit, go to HKEY_CURRENT_USER\Software\Microsoft\Windows Desktop Search\DS and set&nbsp;ShowStartSearchBand to 0
    
    <br /></p><hr />
  <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
  <meta content="BLOCKNOTE.NET" name="GENERATOR" />
  <title></title><style>BODY { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }
P { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }
DIV { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }
TD { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }
</style><basefont size="2" face="Tahoma" />Lookout and Outlook 2007

  <blockquote>
    <p>Installing Lookout on Outlook 2007</p>
    <p>1) First, you’ll have to find a copy of Lookout. &nbsp;Microsoft doesn’t distribute it anymore, but issuing this <a href="http://www.google.com/search?q=lookout%20outlook%20download">search on Google</a> seems to find it pretty handily.</p>
    <p>2) Next, install Lookout. &nbsp;You’ll need admin privileges (no difference from XP), and the install will go without a hitch.</p>
    <p>3) When you next restart Outlook, you’ll probably get a &quot;Lookout failed to start&quot; error dialog:</p>
    <p>4) The problem is that Outlook 2007 ships the Outlook 2007 Office PIAs by default. &nbsp;Open a command shell (as administrator), and issue the following commands:</p>
    <ul type="disc">
      <li>cd &nbsp;%SYSTEMROOT%\assembly\GAC</li>
      <li>rename &nbsp;Microsoft.Office.Interop.Outlook &nbsp;Microsoft.Office.Interop.Outlook.OLD</li>
    </ul>
    <p>5) Restart Outlook and you are good to go.</p>
    <p></p>
    <p><strong>Reversal</strong></p>
    <p>If this doesn’t work for you, or it breaks some other plugin, you’ll want to restore the interop library. &nbsp;Just undo the command above thusly:</p>
    <ul type="disc">
      <li>rename &nbsp;Microsoft.Office.Interop.Outlook.OLD &nbsp;Microsoft.Office.Interop.Outlook</li>
    </ul>
    <p>Why does this dialog exist?</p>
    <p>At the time Lookout was written, Microsoft’s strategy for shipping PIAs hadn’t fully been sorted out. &nbsp;Prior to Outlook 10, there were no official PIAs. &nbsp;Outlook 10 introduced <a href="http://support.microsoft.com/kb/328912">official PIAs</a>, which you could redistribute. &nbsp;Outlook 11 had official PIAs as well (<a href="http://msdn2.microsoft.com/en-us/library/aa159923(office.11).aspx">different ones</a>), but Microsoft didn’t permit redistribution of them, and they weren’t backward compatible. &nbsp;Further, with VS2003, it was pretty easy to create your own PIAs, which were almost identical to the official ones, but not signed. &nbsp;There were lots of plugins out there, and some of them handled PIAs badly. </p>
    <p>At some point, Lookout ended up requiring that it be able to find the official Outlook 10 PIA installed, or it would assume it would fail. &nbsp;It wasn’t smart enough to recognize that new versions of the PIA might be legit, and probably should have handled it better. &nbsp;Who would have guessed that Outlook 12 would introduce yet a 3rd PIA distribution strategy? &nbsp;OL2007 elects to install the PIAs into the GAC by default; so plugins no longer needed to redistribute them at all. &nbsp;I do believe this is the best strategy.</p>
    <p>What this simple fix does is temporarily uninstall the Office 12 version of the PIA. &nbsp;As long as no other .NET Outlook addins are running (C++ based addins don’t use PIAs), this has absolutely zero negative impact on your system. &nbsp;If other .NET addins exist on your system, and those addins are Outlook 11 or 12 specific (I don’t know of any OL12 specific plugins yet?), then you might have a problem with this fix. &nbsp;These conflicts should be rare, but not zero.</p>
    <p>Pasted from &lt;<a href="http://www.belshe.com/2007/12/06/how-to-install-lookout-on-outlook-2007">http://www.belshe.com/2007/12/06/how-to-install-lookout-on-outlook-2007/</a>&gt;</p>
  </blockquote>
