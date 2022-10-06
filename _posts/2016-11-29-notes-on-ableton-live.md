---
categories: []
layout: post
title: Notes on Ableton Live
created: 1480465693
redirect_from: /content/notes-ableton-live
---
High-level:

* Ableton Live is a Digital Audio Workstation (DAW).
* It is used for creating/editing digital audio compositions.  (Tunes, symphonies, sessions, etc.)


Technical:

*   Documents are called "Live Sets"
* Core Library is in C:\ProgramData\Ableton\Live 9\Resources\Core Library or ~/Library/Application Support/Ableton/Live 9 Core Library
* Downloaded Live Packs are in ~\Documents\Factory Packs or ~/Music/Ableton/Factory Packs
* User Library (with your presets and defaults) is ~\Documents\Ableton\User Library or ~/Music/Ableton/User Library
* Drag up/down on the ruler to zoom in/out.
* Drag left/right on the ruler to scroll left/right
* Switch between Arrangement (timeline) view and Session view with Tab.
* Switch between Clip View and Device View with Shift-Tab (for a MIDI track)

Tasks:

* Get some 'starter' data to work with
    * Download, unzip, and add to the PLACES panel in Ableton: "Chapter Examples" from http://www.oup.com/us/interactivecomposition
* How to play some midi sound
    * Select Arrangement View
    * Drag a .mid file from PLACES to a MIDI track. (When it asks about adding the tempo, tell it No.) This adds "un-voiced" MIDI data.
    * Drag a Sound from CATEGORIES on top of the MIDI track.  This adds a voice ("sound").
    * Press spacebar to play/stop.
* Create a new MIDI voice (instrument? sound?)
    * We're going to take a set of mp3 files with 3 octaves of trombone notes and turn them into a new MIDI instrument (a voice to apply to MIDI data so you can hear it).
    * Using your web browser, go to http://www.compositiontoday.com/sound_bank/trombone/trombone.asp and download each of the notes by right-clicking on the note on the staff.
        * Name the files something like Tromb-2-G.mp3 for the sample of the note G2.
        * These samples are all MP3 files, but I'll bet you can use many other audio file types.
    * All of the following instructions are in Ableton Live Intro v9.7, unless otherwise indicated...
    * Select Arrangement view using the icon with 3 horizontal lines near the upper-right corner of the main panel.
    * Select the Instruments CATEGORY.
    * Drag Instrument Rack (an "instrument") onto the top track in the main panel.  It should say "1 Instrument" to the right of the track.
    * Double-click on "1 Instrument".  In the lower-main panel, you should see "Drop Audio Effects Here"
    * To the left of "Drop Audio Effects Here" is a panel which says "Drop an Instrument or Sample Here".  This is your Instrument Rack.
    * Drag all of your trombone sample files from your Finder/Windows-Explorer window and drop them onto your Instrument Rack.
    * Now you have 37 notes in your Instrument Rack.
    * There are some buttons on the left edge of your Instrument Rack. ( Hover over them to see which is which.)
        * Enable Device Activator
        * Hide Macro Controls
        * Show Rack's Chain List
        * Hide Devices
    * Press the button labeled "Key" in the Instrument Rack.
    * The bulk of the Instrument Rack now contains a piano keyboard and long green lines.  There is a green line for each imported sample (MP3 file).  The green line indicates "this sample file will be played when this note is pressed."  It is currently showing you that every sample file gets played for every note on the piano.  You will need to tell it that each sample gets played by exactly one piano key.
    * To hear what this Instrument Rack sounds like now, look near the upper right corner of your screen.  You'll see a tiny button that looks like a few notes of a piano keyboard, a button labeled "KEY" and a button labeled "MIDI".  Ensure that the piano keyboard button is enabled.  (Yellow.  Click it to toggle, if necessary.)  Press the "A" key on your keyboard.  You should hear lots of noise.  This is because every key on the piano is playing ALL samples.  Yuck.
    * First, you'll want to tell it not to play all those notes.
        * Click on any sample in the Instrument Rack (e.g. Tromb-4-A).  Press Control-A (Cmd-A on the Mac).  This will select all samples.
        * Drag the left edge of any of the green bars to C0.  Drag the right edge of any of the green bars to C0.  You've now told it that C0 on the piano keyboard will play all samples, and no other piano keys do anything.
    * Next, we'll tell it to play the Tromb-4-C sample only when the piano key for C4 is pressed:
        * Scroll up/down in the Instrument Rack until you find Tromb-4-C.  Click it.
        * Drag the right edge of the green bar for Tromb-4-C to piano key C4.
        * Drag the left edge of the green bar for Tromb-4-C to piano key C4.
        * If you have a MIDI keyboard connected, press C4.  If not, press the K key on your keyboard.  (If you are using a non-QWERTY keyboard, press the 8th key on the home row.  Ableton uses your physical key's location and not the letter associated with that key.)  You'll hear Tromb-4-C played.
    * Repeat the process you applied to Tromb-4-C for all samples and assign each sample to the desired piano keyboard key.
    * Test your instrument rack using your MIDI keyboard or the home-row keys on your computer keyboard.
    * To see if this works with Ableton MIDI data, take a .mid file (I used "Piano Riff 1.mid" from http://www.vjmanzo.com/oup/ic/Chapter_Examples/Chapter%201%20-%20Basics.zip) and drag it from PLACES and drop it on the first track (labeled "1 Instrument") in the main panel.
    * Press the spacebar and you should hear the tune played.


