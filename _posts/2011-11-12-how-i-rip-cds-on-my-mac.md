---
categories: []
layout: post
title: How I Rip CDs on My Mac
created: 1321136812
redirect_from: /content/how-i-rip-cds-my-mac
---


### Rip CDs with Exact Audio Copy - 2017 Edition - I'm Just Ripping to FLAC

#### Getting Started

* Note: The LiteOn USB drive and the Dell USB drive are similar in features/speed.  I'm using the Dell with a WinXP VM and the LiteOn with a Win10 VM.
* If using VM, connect the CD drive to the VM.
* Tap Windows key, type "windows features", enable .net 3.5
* Install EAC 1.3 into Windows 10 VM.
    * Accept defaults, except do not launch EAC.

#### Configure EAC

* After the install completes, then launch EAC.
* Load my old EACProfile.cfg.  (It contains my naming convention.)
* Run the config wizard and select:
  * Accurate Results
  * FLAC
  * Set up freedb with freedb@kleinfelter.com
  * Leave naming scheme unchanged (because I loaded it from .cfg)
  * I am an expert.
* Go to EAC options and Filename and confirm:
  * `%albumartist%\%albumtitle%\%albumartist%~%albumtitle%~%tracknr2%~%title%~%genre%`
* Go to Metadata options and set metadata to freedb
* Note: Do not USE "built-in freedb" for metadata. That won't download album art.  Use "freedb Metadata Plugin".
* Quit EAC

#### To rip:

* Start EAC
* Insert CD
* Press Alt-G to load metadata
* Choose Medium Images and double-click the right cover art.
* Correct Album Title (if needed)
* Rename artist to Lastname, Firstname
* Press the CMP button
* Select a destination folder
  * e.g. Music, and it will write to the artist-name sub-folder.  A local folder is faster than a network folder because it will write a .WAV, then read it back and compress it with FLAC.
  * If you get "The external compressor returned an error", chose a destination folder which has a simpler path name.  Do NOT rip to a UNC name.




----- Obsolete Content Follows -----

I always purchase my music (unless I get it free, legitimately).  Once in a while, I purchase it on a physical CD.  Here's how I rip CDs on my MacBook.  Note that I rip to FLAC, and then generate MP3 files from FLAC for use in portable devices and in iTunes.
<p>Here are some things I tried and didn't like:
<ul>
<li>I tried and didn't like xACT.  It doesn't name tracks the way I want them named, and it takes way too long to rip.
<li>I tried Exact Audio Copy under WINE, and found it way way too fiddly.
<li>I tried dBpowerAmp under WINE, and found it too fiddly. 
</ul>
So I threw in the towel, and went with a mix of Mac and Parallels.  To get started, I installed a bunch of programs.  I didn't end up using them all.
<ul>
<li>Parallels: Installed Exact Audio Copy v1.0 beta 3
<li>Parallels: Installed dBpowerAmp r13 with PowerPack.  I told it to add the FLAC codec.  I told it to add DSP Effects.
<li>Parallels: Installed MP3Tag ( http://www.mp3tag.de/en/download.html )
<li>Mac: Install Tag ( http://www.macupdate.com/app/mac/21641/tag ) 
<li>Mac: Install Max ( http://www.macupdate.com/app/mac/19873/max )
</ul>
Then, when I'm ready to rip:
<ul>
<li>Parallels: Use EAC to rip to [mac-desktop]/album-name as WAV files.
<li>Mac: Start Max

    <ul>
    <li>Menu: File/Convert_Files
    <li>Select and Open your WAV files
    <li>Menu: Tools/Convert
    <li>Exit Max
    </ul>
<li>Parallels
    <ul>
    <li>Select all the FLAC files
    <li>Right-click, and select MP3Tag
    <li>In MP3Tag, select all the files
    <li>Drag and drop the album art into MP3Tag's window.
    <li>Click the Save button
    </ul>
<li>Mac: Start Tag
    <ul>
    <li>Menu: File/Open
    <li>Select and Open your FLAC files
    <li>Use Tools/Guess_Tags, with <code>{artist}~{album}~{trackNumber}~{title}~{genre}</code>
    <li>File/Save
    <li>Exit Tag
    </ul>
<li>Parallels: Select the FLAC files, right click, 
<li>Parallels: Select the FLAC files, right-click, choose Convert, and convert them to MP3 (VBR, 190 KBS)
</ul>
