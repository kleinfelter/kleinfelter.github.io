---
excerpt: "<p>Can Evernote 4 (Windows) be run portably? </p>\r\n  <p><strong>Update
  for Evernote 4.1:</strong></p>"
categories: []
layout: post
title: Running Evernote 4 Portably
created: 1288468375
---
<p>Can Evernote 4 (Windows) be run portably? </p>
  <p><strong>Update for Evernote 4.1:</strong></p>
  <ul>
    <li>To extract the .msi from the downloaded Evernote_4.1.0.3365.exe, run the .exe, and go look in %TEMP%.&nbsp; You'll see Evernote.msi.&nbsp; Copy this file, and then cancel the setup .exe.</li>
    <li>You can then follow the 4.0.1 instructions, with the exception that you might have to look in &quot;C:\Temp\Evernote4.1\PFiles\Evernote\[ApplicationFolderName]&quot; instead of %TEMP%\Evernote\Pfiles\Evernote\Evernote.</li>
  </ul>
  <p><strong>Original Instructions for Evernote 4.0.1:</strong></p>
  <ul>
    <li>Download Evernote 4.0.1.2927 </li>
    <li>Open Evernote_4.0.1.2927.exe </li>
    <li>Open an Explorer window in your TEMP folder. (You can click Start/Run, enter %TEMP%, and press enter. </li>
    <li>You'll find Evernote.msi </li>
    <li>Run Universal Extractor (I used v1.6.1.) </li>
    <li>Drag Evernote.msi and drop it on Universal Extractor </li>
    <li>Press OK, and it will ask you which extract to do. </li>
    <li>Choose &quot;MSI Administrative Installer&quot; and press OK. </li>
    <li>It will run, and create a %TEMP%\Evernote folder. </li>
      <ul>
        <li>Update: Some versions of Evernote/Universal Extractor will put your files in the output directory specified in Universal Extractor.</li>
      </ul>
    <li>Browse to %TEMP%\Evernote\Pfiles\Evernote\Evernote </li>
    <li>Open Evernote.exe, and enter your Evernote account and password and press OK. </li>
    <li>It will run Evernote. For me, it crashed on the first synch. </li>
    <li>Exit Evernote. </li>
    <li>Move %TEMP%\Evernote\Pfiles\Evernote\Evernote to wherever you store your portable apps. I moved mine to S:\Evernote\Evernote-4.01-portable </li>
    <li>Create a folder where you'd like to store your Evernote data. I used S:\Evernote\Evernote-4.01-data </li>
    <li>Run Evernote.exe from wherever you copied it to. e.g. S:\Evernote\Evernote-4.01-portable\Evernote.exe </li>
    <li>Choose Tools/Options and set the following: 
      <ul>
        <li>Check for updates at Launch = No </li>
        <li>Evernote Local Files = wherever you want. I used S:\Evernote\Evernote-4.01-data </li>
      </ul>
    </li>
    <li>Exit and restart Evernote </li>
    <li>If you run into trouble, you may have to manually deploy files from %TEMP%\Evernote\Windows 
      <ul>
        <li>I copied the contents of %TEMP%\Evernote\Windows\system32 to S:\Evernote\Evernote-4.01-portable </li>
        <li>I also copied the winsxs folder from %TEMP%\Evernote\Windows to S:\Evernote\Evernote-4.01-portable. These files won't get loaded from there, but I wanted to preserve them, in case I later discover that I need them. </li>
      </ul>
    </li>
  </ul>Honestly, after playing around with it just a little bit, it works pretty good. I think I'm finally going to move off of Evernote-3.1.0.1225-portable to and onto this manually created portable 4.01. It writes a bunch of stuff to HKEY_CURRENT_USER\Software\Evernote\Evernote in the registry, but I can live with that. I'm not looking for *stealth* Evernote. Just a way to run it without violating the &quot;no installs&quot; policy at work.
