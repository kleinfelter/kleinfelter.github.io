---
title: Compressing and Trimming DV Files
---

I used to own a MiniDV camcorder.  When you copy video from one of these, you wind up with a ".dv" file on your computer, and the video is 720x480. (That was considered high res in its day!)

.dv files are only lightly compressed.  i.e. They are very big. I wanted to compress to .mp4 using H.264 compression, using a  compressor that prioritized quality over size reduction.

Tinkering around with Handbrake, I found I could get videos indistinguishable from the .dv master, using the "Fast 480p30" preset.  I decided to use the next step up, to try and avoid future regret, so I'm using "HQ 480p30".  That preset also adds surround sound, which is silly for home video, so I'm using the preset with audio overriden to discard the surround sound track.

OK.  So I compressed a bunch of .dv files down to about 15% of the original size.  Great, right?

But then I noticed that some of them had long black section at the end.  I wanted to cut those off.  So my goal became, "Trim the junk and compress."  Somewhere along the way, my requirement morphed into "split every .dv into individual scenes and compress each scene."

I wanted to trim the junk before compressing, because if I *edited* the compressed file, even just to trim it, some NLE (non-linear editors) will uncompress and re-compress it, and that degrades quality, because video uses a lossy compression algorithm.

That meant I needed to edit .dv files, and very few NLE programs still support .dv.  Unless otherwise noted, these were tested on a Mac running Big Sur, in late 2021. 

* Davinci Resolve - won't load .dv files. (Otherwise, it looks like a fine NLE.)
* VirtualDub (Windows) - does have "direct stream copy" to avoid re-compressing, but it doesn't open .dv or even .mp4 files.
* QuickTime X -  can open .dv files but can't save them as .dv files.   They will be re-compressed using H.264 video codec. (That might actually accomplish my goal, but I can't pick and choose the compression level.)
* avidemux - can't open .dv file.
* Premier Elements 2022 - can't open .dv files
* Handbrake - You can tell Handbrake to convert only a section of a file from .dv to .mp4.
	* And you can control the compression paramenters.
	* But there's no GUI for selecting the start/stop frame.
	* The big problem is that if you play the video and pick the start/stop time, Handbrake only starts/stops at approximately the location you specifiy. It was off by a second or two.
		* That means that you are likely to end up with a brief flash of the NEXT section at the end of every cut. That will be irritating down the road.

Here's what I decided to do:
* Convert the entire 13 GB .dv file to high quality .mp4.
* Make a copy of the .mp4 for each scene on the video.
* Use Avidemux WITHOUT re-encoding to trim the MP4 to the precise start/stop frames. When setting its parameters, it is important to use the following, to avoid re-compressing:
	* Video Output = Copy
	* Audio Output = Copy
	* Output Format = MP4 Muxer
* The Avidemux parameters are per https://help.presentations2go.eu/editing/CutwithAvidemux.html
* I timed them, and the copy-to-output happens too fast for it to be re-encoding.
