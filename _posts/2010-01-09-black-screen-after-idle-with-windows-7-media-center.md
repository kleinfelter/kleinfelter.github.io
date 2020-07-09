---
excerpt: "I'm running \r\n  \r\n  \r\n  \r\n  <br />\r\n  <ul>\r\n    <li>Windows
  7 Media Center on an \r\n      \r\n      \r\n      \r\n      <br /></li>\r\n    <li>Acer
  Revo with \r\n      \r\n      \r\n      \r\n      <br /></li>\r\n    <li>nVidia
  ION graphics, hooked to a \r\n      \r\n      \r\n      \r\n      <br /></li>\r\n
  \   <li>Panasonic 720p TVr via a \r\n      \r\n      \r\n      \r\n      <br /></li>\r\n
  \   <li>Pioneer VSX-819 A/V amplifier, using \r\n      \r\n      \r\n      \r\n
  \     "
categories: []
layout: post
title: Black Screen After Idle With Windows 7 Media Center
created: 1263055887
---
I'm running 
  
  
  
  <br />
  <ul>
    <li>Windows 7 Media Center on an 
      
      
      
      <br /></li>
    <li>Acer Revo with 
      
      
      
      <br /></li>
    <li>nVidia ION graphics, hooked to a 
      
      
      
      <br /></li>
    <li>Panasonic 720p TVr via a 
      
      
      
      <br /></li>
    <li>Pioneer VSX-819 A/V amplifier, using 
      
      
      
      <br /></li>
    <li>HDMI for video and audio.&nbsp;&nbsp;</li>
  </ul>I leave the PC running 24x7.&nbsp; I turn off the TV when not watching it.&nbsp; <em>
    <br />
    <br />Sometimes</em>, after the TV is off overnight and the PC is idle, when I turn the TV on, Media Center shows a black screen, even after a mouse wiggle or keystrokes.&nbsp; Additional symptoms:
  
  
  
  <br />
  <ul>
    <li>I do get a mouse pointer when I move the mouse.</li>
    <li>I do not hear sound effects when I move the mouse (that I would normally hear when mousing over a Media Center button).</li>
    <li>The screen (back-light) gets slightly darker when I move the mouse to the edges of the screen.</li>
  </ul>Here are some things I'm trying:
  
  
  
  <br />
  <ol>
    <li>mouse wiggle - gets a mouse pointer, and back-light level changes as I near screen edge, but screen always blank.</li>
    <li>press space/shift/letter key on keyboar - no effect</li>
    <li>press the dedicated start-IE button (a globe) on the remote:</li>
    <ol>
      <li>Starts Internet Explorer</li>
      <li>Shows a media-center-not-responding dialog</li>
      <li>Media center works after I select Restart.
        
        
        
        <br /></li>
    </ol>
    <li>Disabled screen saver and disabled monitor-off power-save.
      
      
      
      <br /></li>
    <li>amplifier off and back on - no effect
      
      
      <br /></li>
    <li>Configure PC and TV to send video via VGA (as a preventative, not as curative) - test in progress</li>
    <li>run hdmiOn.exe from a telnet session
      
      
      <br /></li>
    <li>tv off and back on - ???? (not tested yet)</li>
    <li>&quot;devcon reset&quot; followed by the device ID - not tested&nbsp;</li>
    <ol>
      <li>Might need to &quot;devcon status * &gt; C:\temp\foo.txt&quot; first, to learn the device ID
        <br /></li>
    </ol>
    <li>Could it be running on another virtual monitor?&nbsp; Disable non-HDMI output.&nbsp; Is there a move-to-next-monitor hot-key?</li>
    <li>alt-F4 (it does work when NOT black first)</li>
    <li>dxdiag</li>
    <li>Enable monitor-off-on-idle. Then maybe a mouse wiggle will turn it ON.</li>
    <li>unplug and re-plug monitor. if this works get an HDMI switch.&nbsp; What if I switch monitor on the AMP?</li>
    <li>Does it happen if I go direct from PC to TV via HDMI?</li>
    <li>make it go to sleep on idle.&nbsp; When wakes up, does THAT make monitor light up?</li>
    <li>Remove Nvidia driver and use Windows driver.&nbsp; Re-add Nvidia driver.</li>
    <li>Can I set up a hot-key (maybe via Autohotkey). To re-set video (maybe change resolution and back).&nbsp; Maybe a monitor-off followed by a monitor-on.</li>
    <li>Set up a background task that periodically writes current monitor settings to a log file.&nbsp; See if/when something changes.</li>
    <li>Can test monitor on/off via telnet?
      
      
      
      <br /></li>
  </ol>
  <br />
