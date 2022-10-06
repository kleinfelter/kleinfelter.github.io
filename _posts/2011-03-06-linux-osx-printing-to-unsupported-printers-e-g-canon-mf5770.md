---
excerpt: "Some printers cannot be used directly from Linux or OS X.  These are typically
  budget printers, which do lots of GDI print processing in a Windows driver, and
  they speak only a proprietary protocol.\r\n\r\nThis story tells how to use a Windows-only
  printer from Linux and OS X.  I use this with my Canon MF5770, but the general process
  works for almost any Windows based printer.\r\n\r\n<h4>Getting Started</h4>\r"
categories: []
layout: post
title: Linux/OSX - Printing to Unsupported Printers (e.g. Canon MF5770)
created: 1299433971
---
Some printers cannot be used directly from Linux or OS X.  These are typically budget printers, which do lots of GDI print processing in a Windows driver, and they speak only a proprietary protocol.

This story tells how to use a Windows-only printer from Linux and OS X.  I use this with my Canon MF5770, but the general process works for almost any Windows based printer.

<h4>Getting Started</h4>
You'll need a copy of Windows 2000/XP/Vista/Windows 7, running on a real machine, or in a VM.  VMware or VirtualBox (vbox) will work.  This virtual/physical machine can be on another computer on your LAN; it need not be on the machine from which you want to print.

Sadly, none of this is going to work with WINE or Crossover.  You'll need a real copy of Windows running in a VM or on a physical machine.

Get the printer working from Windows before proceeding.

<h4>Install Ghostscript and RedMon</h4>
This is all done on the Windows machine that can print to the Windows-only printer.
<ol>
<li>Download Ghostscript from <a href="http://pages.cs.wisc.edu/~ghost/doc/GPL/gpl864.htm">http://pages.cs.wisc.edu/~ghost/doc/GPL/gpl864.htm</a>.  You'll want to select the 32-bit or the 64 bit .exe file, to match your Windows edition.  I used version 8.64, but newer versions should work too.</li>
<li>Install Ghostscript</li>
<li>Install GSview.  There's a link to it from the Ghostscript page mentioned above.</li>
<li>Install <a href="http://www.is-foehr.de/">RedMon EE</a>.</li>
<li>Set up RedMon: </li>
<ul>
<li>Redirect this port to the program: C:\Program Files\Ghostgum\gsview\gsprint.exe</li>
<li>Arguments for this program are: -printer "Your Windows Printer Name Here" -copies 1 -</li>
<ul>
<li>Don't miss the trailing dash on the arguments!</li>
<li>"Your Windows Printer Name Here" should be the name of the printer that works from Windows.  This is the printer name you see when you open Start -&gt; Printers and Faxes.</li>
</ul>
<li>Output: Program handles output</li>
</ul>
</ol>
<h4>Set Up Virtual PostScript printer</h4>
This is all done on the Windows machine that can print to the Windows-only printer.
<ol>
<li>Using Windows add-a-printer dialog, add an "AppleLaserwriter 12/640 PS" printer.</li>
<li>Set it to print to local port "RPT1: Redirected Port"</li>
<li>Share this Printer</li>
</ol>
<h4>Using the Virtual PostScript Printer</h4>
You've got a shared Windows PostScript printer on your network.  On your Linux or OS X machine, connect to the shared printer, use an AppleLaserwriter 12/640 PS driver (or a generic PostScript driver, if you don't have this exact driver).

When you print to the shared PS printer, RedMon captures the PostScript data, sends it through Ghostscript, and Ghostscript prints it to the Windows-only printer.  The printer is a little slow to start, since the ENTIRE document has to get processed from whatever, into PostScript, into GDI, and spooled on the Windows machine, before printing starts.  But it works.

If your printer is a printer/scanner (e.g. Canon MF5770), you can connect the scanner to the VM, and have the VM save scanned images to a shared folder, and your Linux/OS X machine can collect the scanned images from there.  If your scanner needs buttons pushed in Windows (e.g.  answering prompts such as "Do you want to save this document?", you can automate this using PTFB or AutoHotkey. 
