---
categories: []
layout: post
title: Download YouTube Videos
created: 1415542512
redirect_from: /content/download-youtube-videos
---
I don't do this often, but once in a while I need to download a YouTube video.  

(These are the steps for a Mac.  Windows steps will be similar, but not identical.)

* Open the YouTube page for the video in your browser.
* Copy the page URL.
* Start VLC
    * File >> Open Network
    * Paste the URL and click Open.
    * Wait for the video to start playing.  It takes a while to start.
    * Window >> Playlist
    * Right-click on the record for the video in the Play List.  Choose Media Information.
    * On the Codec Details tap, right-click and copy the Location field.
        * If the codec is VP8, you might want to save it as .webm.  Chrome and VLC can play this.  For Windows users, they'll either need to install the VP8 codec or you will have to convert it to mp4 for them.
    * Paste the clipboard into the browser's location field, press Enter, and start the video playing.
    * Right click on the video and choose Save Video As.

-----
Obsolete content follows.  I stopped using DownloadHelper because it looks like it omits the top quality stream.

Here's how I get HTML 5 video from YouTube:

* Use Firefox and https://addons.mozilla.org/en-US/firefox/addon/video-downloadhelper/
    * Browse to the YouTube page
    * When the icon for DownloadHelper animates (it looks like three color dots, spinning in a circle), click the down-arrow to the right of the color dots.
    * Choose the highest non-HQ value.  For example, it showed the following and I chose 720p
        * HQ5  (I've read that this is mostly for AUDIO downloads.)
        * Mobile
        * Medium
        * 720p
        * HQ36  (I've read that this is mostly for AUDIO downloads.)
    * After choosing which format to download, you can choose the method of download.  I went with "Download".  It downloaded an mp4 file.

