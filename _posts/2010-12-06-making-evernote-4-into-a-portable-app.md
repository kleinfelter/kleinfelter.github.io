---
excerpt: "<p>Building on my <a href=\"/node/244\">prior story</a>, I decided to try
  and create a <a href=\"http://portableapps.com/\">Portable App</a> launcher for
  Evernote. The process for doing so at <a href=\"http://portableapps.com/\">Portable
  Apps</a> is incompletely documented, so I thought I'd capture a walk-through here.
  </p>\r\n  <p>Substitute your drive letter for &quot;S:&quot;, and your Evernote
  version for &quot;4.01&quot;.</p>"
categories: []
layout: post
title: Making Evernote 4 Into a Portable App
created: 1291663965
---
<p>Building on my <a href="/node/244">prior story</a>, I decided to try and create a <a href="http://portableapps.com/">Portable App</a> launcher for Evernote. The process for doing so at <a href="http://portableapps.com/">Portable Apps</a> is incompletely documented, so I thought I'd capture a walk-through here. </p>
  <p>Substitute your drive letter for &quot;S:&quot;, and your Evernote version for &quot;4.01&quot;.</p>
  <ul>
    <li>One-time stuff.&nbsp; (Other stuff gets done for each app you make portable.): 
      <ul>
        <li>Install NSISPortable to S:\PortableApps\NSISPortable </li>
        <li>Install PortableApps.comLauncher to S:\PortableApps\PortableApps.comLauncher </li>
        <li>Download the PortableApps Application Template, and put it in S:\PortableApps\PortableApps.com_Application_Template_2.0 </li>
      </ul>
    </li>
    <li>Create the directory structure for your app by copying 
      <ul>
        <li>&quot;S:\PortableApps\PortableApps.com_Application_Template_2.0\AppNamePortable&quot; </li>
        <li>&nbsp;to &quot;S:\PortableApps\&quot; </li>
        <li>&nbsp;and rename it to EvernotePortable (creating S:\PortableApps\EvernotePortable). </li>
      </ul>
    </li>
    <li>Copy the Evernote 4.01 program files and subdirectories 
      <ul>
        <li>from C:\Program Files\Evernote </li>
        <li>to S:\PortableApps\EvernotePortable\App\Evernote </li>
      </ul>
    </li>
    <li>Create S:\PortableApps\EvernotePortable\App\AppInfo\Launcher\EvernotePortable.ini, containing: 
      <pre>
[Launch]
ProgramExecutable=Evernote\Evernote.exe
WaitForExe1=EvernoteTray.exe

[Activate]
Registry=true

[DirectoriesMove]
-=%LOCALAPPDATA%\Evernote\Evernote\Logs

[DirectoriesCleanupForce]
1=%LOCALAPPDATA%\Evernote

[RegistryKeys]
EvernotePortable=HKCU\Software\Evernote

[RegistryValueWrite]
HKCU\Software\Evernote\Evernote\EvernotePath=REG_SZ:%PAL:DataDir%
    
[RegistryCleanupForce]
1=HKCU\Software\Evernote</pre>
    </li>
  </ul>
  <li>Create S:\PortableApps\EvernotePortable\App\AppInfo\appinfo.ini, containing: 
    <pre>
[Format]
Type=PortableApps.comFormat
Version=2.0

[Details]
Name=Evernote Portable
AppID=EvernotePortable

[Control]
Start=EvernotePortable.exe</pre>
  </li>
  <li>Copy appicon.ico 
    <ul>
      <li>from S:\PortableApps\PortableApps.comLauncher\App\AppInfo </li>
      <li>to S:\PortableApps\EvernotePortable\App\AppInfo </li>
      <li>(or ever better,&nbsp;use a tool like Icon Studio to extract the Evernote icon from Evernote.exe, and put it into AppInfo\appicon.ico). </li>
    </ul>
  </li>
  <li>Run S:\PortableApps\PortableApps.comLauncher\PortableApps.comLauncherGenerator.exe and tell it to use S:\PortableApps\EvernotePortable 
    <ol>
      <li>Note: Windows got weird on me about running PortableApps apps with multiple periods in the name, and the work-around was to&nbsp;rename the&nbsp;.exe files to have only a single &quot;.&quot; in the name. </li>
    </ol>
  </li>
  <li>Run S:\PortableApps\EvernotePortable\EvernotePortable.exe.&nbsp; It should start Evernote.&nbsp; 
    <ul>
      <li>Note that I do NOT recommend running it via the PortableApps menu at this point; if it runs into an error, running it directly will an error message; if you run it from the menu, you&nbsp;may not&nbsp;see the message. </li>
      <li>You are not running portably at this point.&nbsp; You're running your non-portable Evernote with a launcher.&nbsp; (Baby steps.) </li>
    </ul>
  </li>
  <li>Copy your Evernote data to S:\PortableApps\EvernotePortable\Data. 
    <ul>
      <li>You want to copy the Databases, Dict, and Logs folders from wherever you had them into Data\Databases, Data\Dict, and Data\Logs.&nbsp; </li>
      <li>For me, this was&nbsp;to move the contents of&nbsp;S:\Evernote\Evernote-4.01-data to S:\PortableApps\EvernotePortable\Data.&nbsp; </li>
      <li>Standard location is C:\Documents and Settings\user-ID\Local Settings\Application Data\Evernote\Evernote </li>
    </ul>
  </li>
  <li>Create a prototype Data\settings\EvernotePortable.reg. 
    <ul>
      <li>For many applications, this won't be necessary because&nbsp;you can&nbsp;use RegistryValueWrite in the app's analogue to S:\portableApps\EvernotePortable\App\AppInfo\Launcher\EvernotePortable.ini.&nbsp; However, I wanted to put a RegistryValueWrite that would set Evernote's data directory, but without additional registry keys present, Evernote set the data directory to its default. </li>
      <li>Don't forget to end the .reg file with TWO empty lines. (It is a .reg file rule.) </li>
    </ul>
  </li>
  <ul></ul>
  <pre>
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Evernote]

[HKEY_CURRENT_USER\Software\Evernote\Evernote]
"LastLogin"="kleinfelter"
"SyncServiceUrl"="www.evernote.com"
"TrunkUrl"="http://www.evernote.com/about/trunk/?layout=inapp"

[HKEY_CURRENT_USER\Software\Evernote\Evernote\AutoResponse]
"ConfirmAppExit"=""</pre>
  <p> Update: I moved it from S:\PortableApps\EvernotePortable to C:\kevin\EvernotePortable, and it worked without tinkering.</p>
  <p>&nbsp;</p>
