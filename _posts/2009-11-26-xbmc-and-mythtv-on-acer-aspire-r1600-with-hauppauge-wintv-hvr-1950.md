---
excerpt: "<ol>\r\n    <li>Acer Aspire R1600, 1 GB RAM, Intel Atom 230 CPU, 160 GB
  drive, Invidia Ion LE Integrated video, many USB ports, and an eSATA port (bought
  cheap at BestBuy) </li>\r\n    <li>Hook up a KVM cable to it, and set the KVM to
  use the R1600 </li>\r\n    <li>Boot the pre-installed Windows XP, and use TrueImage
  to make a full drive back-up (just in case I later decide I want to run Windows)</li>\r\n
  \   <li>Put Ubuntu 9.10 on a flash drive.&nbsp; Insert my blue flash drive into
  the USB connector on the corner with the power switch, with the writing facing away
  from the power switch. </li>\r"
categories: []
layout: post
title: XBMC and MythTV on Acer Aspire R1600 with Hauppauge WinTV-HVR-1950
created: 1259260354
---
<ol>
    <li>Acer Aspire R1600, 1 GB RAM, Intel Atom 230 CPU, 160 GB drive, Invidia Ion LE Integrated video, many USB ports, and an eSATA port (bought cheap at BestBuy) </li>
    <li>Hook up a KVM cable to it, and set the KVM to use the R1600 </li>
    <li>Boot the pre-installed Windows XP, and use TrueImage to make a full drive back-up (just in case I later decide I want to run Windows)</li>
    <li>Put Ubuntu 9.10 on a flash drive.&nbsp; Insert my blue flash drive into the USB connector on the corner with the power switch, with the writing facing away from the power switch. </li>
    <li>Boot to BIOS (Press DEL during POST) </li>
    <ol>
      <li>disable RevoBoot </li>
      <li>Advanced Chipset Features -&gt; iGPU Frame Buffer Size = 256MB</li>
    </ol>
    <li>Reboot and press F12 during POST and boot from the flash drive</li>
    <li>Install Ubuntu -- It will be pretty slow, so don't give up if it looks dead for 5 minutes. </li>
    <ol>
      <li>Ensure you have a functioning Ethernet connection so that it will search for proprietary drivers. </li>
      <li>USA (normal USA, not Dvorak, because other people will be using this)</li>
      <li>Partitioning: Use the entire disk</li>
      <li>User = kevin; password = my generic, moderately secure password; computer name = xbmc; require password to login </li>
      <li>At &quot;Ready to Install&quot;, check Advanced and ensure that you're installing a boot loader to /dev/sda.&nbsp; Then press Install. </li>
    </ol>
    <li>After the first reboot:</li>
    <ol>
      <li>Login as kevin</li>
      <li>Add the NVidia accelerated graphics driver version 185 (System-&gt;Administration-&gt;Hardware Drivers)&nbsp;</li>
      <li>System-&gt;Preferences-&gt;Remote Desktop: Allow other users to view your desktop; Clear &quot;You must confirm...&quot; set a password, and &quot;Configure network automatically...&quot;</li>
      <li>sudo visudo and append a row with &quot;kevin ALL=NOPASSWD: ALL&quot;</li>
      <li>sudo reboot</li>
      <ol>
        <li>(To enable the new video drivers)</li>
      </ol>
    </ol>
    <li>After the reboot:</li>
    <ol>
      <li>Login as kevin</li>
      <ol>
        <li>System-&gt;Preferences-&gt;Appearance: Visual Effects = None.&nbsp; (Otherwise, VNC doesn't work right, and you don't need the overhead of Gnome's special effects.)</li>
      </ol>
      <li>apt-get -y install openssh-server </li>
      <li>sudo apt-get -y install mythtv&nbsp;</li>
      <ol>
        <li>MySQL root password = password (Hey! It is on my home LAN.)</li>
        <li>Yes, allow other computers to use MythTV</li>
        <li>It will save your &quot;random password&quot; to /etc/mythtv/mysql.txt.&nbsp; Note that the password is a database password.&nbsp; the mythtv user ID is not used, so there is no usable password for the mythtv user.</li>
      </ol>
      <li>sudo apt-get -y install ffmpeg</li>
      <li>wget http://www.isely.net/downloads/fwextract.pl</li>
      <li>Go to a Windows computer and: </li>
      <ol>
        <li>Download WinTV V7 version 1.2b from http://www.hauppauge.com/site/support/support_hvr1950.html</li>
        <li>Run the downloaded .exe and let it extract to &quot;C:\Hauppauge\WinTV 7 CD 1.2b&quot;.&nbsp; Exit when it asks what language.</li>
        <li>Zip up the Drivers folder, and ship it to your Linux box.&nbsp;</li>
      </ol>
      <li>Go back to your Linux box and get the firmware into the right place: </li>
      <ol>
        <li>unzip the Drivers folder, and rename the extracted folder from Drivers to win_driver.</li>
        <li>perl fwextract.pl</li>
        <li>sudo copy *.fw /lib/firmware/</li>
      </ol>
      <li>So far, it has been easy.&nbsp; Unfortunately the firmware has grown too large for the pvrusb2 driver shipped with Ubuntu 9.10.&nbsp; I had to download source for pvrusb2 and build it: </li>
      <ol>
        <li>wget http://www.isely.net/downloads/pvrusb2-mci-20091124.tar.bz2</li>
        <li>bunzip2 pvrusb2-mci-20091124.tar.bz2</li>
        <li>tar -xvf pvrusb2*.tar</li>
        <li>rm pvrusb2*.tar </li>
      </ol>
      <li>But wait! You can't build pvrusb2 without kernel source (not just headers):</li>
      <ol>
        <li>sudo apt-get -y install dpkg-dev</li>
        <li>cd /usr/src</li>
        <li>sudo apt-get install linux-source </li>
        <li>sudo tar -xjvf /usr/src/linux-source-2.6.31.tar.bz2 </li>
        <li>cd /usr/src/linux-source/2.6.31</li>
        <li>sudo cp -vi /boot/config-`uname -r` .config</li>
        <li>sudo libncurses5 libncurses5-dev </li>
        <li>sudo make oldconfig</li>
        <li>sudo make prepare&nbsp;</li>
        <li>sudo make modules_prepare</li>
        <li>sudo make </li>
      </ol>
      <ol></ol>
      <li>Now build pvrusb2:</li>
      <ol>
        <li>cd ~/pvr* </li>
        <li>export KDIR=/usr/src/linux-source-2.6.31 </li>
        <li>make --directory driver</li>
        <li>sudo make --directory driver install</li>
        <li>rmmod pvrusb2</li>
        <li>insmod pvrusb2</li>
        <li>chmod ugo+rw /dev/video0</li>
      </ol>
      <li>sudo mythtv-setup</li>
      <ol>
        <li>It will add root to the mythtv group, and you'll have to logout and login. </li>
        <li>Capture Card Type: IVTV MPEG-2 encoder card</li>
        <li>Exit.&nbsp; When asked, let it run mythfilldatabase.</li>
      </ol>­ 
      <br />
      <li>Applications-&gt;Sound and Video-&gt;MythTV Frontend.&nbsp; It may add you to the mythtv group, and log you out.&nbsp; Log back in and start MythTV Frontend again if it does.&nbsp; It is slow (30-40 seconds) to show anything beyond a blank screen, so be patient.</li>
      <ol>
        <li>Utilities/Setup-&gt;Setup:</li>
        <ol>
          <li>Select the &quot;MythCenter (Widescreen)&quot; theme</li>
          <li>Paint Engine = OpenGL&nbsp; (Note: You might want to defer setting this from QT until you are done using VNC, because once you go to OpenGL, your screen updates do not get replicated to your VNC client.)</li>
          <li>Set Current Video Playback Profile to CPU-- </li>
        </ol>
      </ol>
    </ol>
  </ol>
