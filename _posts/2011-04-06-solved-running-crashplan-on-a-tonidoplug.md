---
excerpt: "<em>Update: This got me part-way there, but I never really got it 100% of
  the way to success.</em>  I'm leaving it here in the hopes that someone can get
  it the rest of the way to the finish line.\r\n\r\nI wanted to set up a TonidoPlug
  as a NAS, using CrashPlan to back-up my files.  It wasn't a cake-walk, but it appears
  to work.\r\n<ol>\r\n<li>Download  ARMv5 Linux - Headless EABI, soft float, little
  endian Java from http://www.oracle.com/technetwork/java/javase/downloads/embedded-jsp-135769.html.
  \ (You'll have to do this from a complete computer -- not your plug computer.)\r"
categories: []
layout: post
title: 'SOLVED: Running CrashPlan On a TonidoPlug'
created: 1302144240
---
<em>Update: This got me part-way there, but I never really got it 100% of the way to success.</em>  I'm leaving it here in the hopes that someone can get it the rest of the way to the finish line.

I wanted to set up a TonidoPlug as a NAS, using CrashPlan to back-up my files.  It wasn't a cake-walk, but it appears to work.
<ol>
<li>Download  ARMv5 Linux - Headless EABI, soft float, little endian Java from http://www.oracle.com/technetwork/java/javase/downloads/embedded-jsp-135769.html.  (You'll have to do this from a complete computer -- not your plug computer.)
<li>Push the downloaded Java to /tmp/java-jre.tgz on your plug.
<li>tar zxvf /tmp/java-jre.tgz
<li>mv ejre1.6.0_21 /usr/java6-kpk
<li>Edit /etc/environment, and add /usr/java6-kpk to the start of PATH
<li>Logout/login, and check to ensure you got the PATH right, before you install CrashPlan.
<li>Download CrashPlan for Linux from http://www.crashplan.com/consumer/download.html?os=Linux (You'll have to do this from a complete computer.)
<li>Push the downloaded crashplan to /tmp/crashp.tgz on your plug.
<li>tar zxvf crashp.tgz
<li>cd CrashPlan-install
<li>./install.sh [Note: I took all the defaults except I told it to put backups in /usr/local/crashplan-backups]
<li>Visit http://www.pchilton.co.uk/2011/01/29/crashplan-online-backup-on-qnap-ts-210-nas/
<li>Scroll down until you see "I have now attached my compiled version of the jtux library: libjtux.so"
<li>Download libjtux, push it to your plug as /tmp/libjtux.so.gz.
<li>On the plug, cd /usr/local/crashplan
<li>mv libjtux.so original-libjtux.so
<li>mv /tmp/libjtux.so /usr/local/crashplan/
<li>Reboot your plug.
<li>apt-get -d install libjna-java
<ul>
<li>If you don't do the libjna-java, CrashPlan will start, but it will forever say "Waiting for backup" and pressing the "Backup now" button won't do anything.
<li>Making this fit on the TP's flash drive can be a challenge. If you start running low on space (use "df -k" in another ssh session), you can "rm /usr/share/fonts/truetype/*" to recover font space.  You don't need fonts on a headless server.
<li>It might not complete the install.  Once /usr/share/java/jna.jar shows up, you can interrupt the install.  Oops! You're gonna need libjnidispatch.so too.
<li>Copy /usr/share/jva/jna.jar to a safe location.
<li>apt-get remove   acl ca-certificates-java consolekit dbus dbus-x11 default-jre default-jre-headless defoma fontconfig fontconfig-config gstreamer0.10-pulseaudio hal  hal-info hdparm icedtea-6-jre-cacao java-common libaccess-bridge-java libasound2 libasound2-plugins libavahi-client3 libavahi-common-data  libavahi-common3 libbluetooth3 libcap2 libck-connector0 libdbus-1-3 libdbus-glib-1-2 libffi5 libflac8 libfontconfig1 libfontenc1 libfreetype6 libgif4 libgstreamer-plugins-base0.10-0 libgstreamer0.10-0 libhal-storage1 libhal1 libice6 libjna-java liblcms1 libltdl7 libpam-ck-connector libpci3   libpciaccess0 libpolkit-dbus2 libpolkit-grant2 libpolkit2 libpulse-browse0 libpulse0 libpulsecore9 libsamplerate0 libsm6 libsndfile1 libspeexdsp1  libx11-6 libx11-data libxau6 libxcb1 libxdmcp6 libxext6 libxfont1 libxi6 libxrender1 libxtst6 openjdk-6-jre openjdk-6-jre-headless openjdk-6-jre-lib   pciutils pm-utils policykit powermgmt-base pulseaudio pulseaudio-esound-compat pulseaudio-module-hal pulseaudio-module-x11 pulseaudio-utils radeontool  rhino smartdimmer ttf-baekmuk ttf-bengali-fonts ttf-dejavu ttf-dejavu-core ttf-dejavu-extra ttf-indic-fonts-core ttf-kannada-fonts ttf-kochi-gothic   ttf-oriya-fonts ttf-sazanami-mincho ttf-telugu-fonts ttf-wqy-zenhei tzdata-java usbutils x-ttcidfont-conf x11-common xfonts-encodings xfonts-utils
<li>Note to self: Is there a flavor of "apt-get install" that DOES NOT bring in all the dependencies?
</ul>
<li>Login to your plug, and run "/etc/init.d/crashplan status".  It should report that CrashPlan is running.  
<li>Wait 60 more seconds, and check status again.  (If you got the libjtux wrong, it can take 30-50 seconds to die.)
<li>echo 1048576 > /proc/sys/fs/inotify/max_user_watches
<ul>
<li>This temporarily cures the "Your Linux system is currently configured to watch 8192 files in real time" message.
</ul>
<li>Add "fs.inotify.max_user_watches=1048576" to  /etc/sysctl.conf in order to permanently cure the message.
<li>See http://support.crashplan.com/doku.php/how_to/configure_a_headless_client for how to manage your 'headless' CrashPlan.
</ol>

This ought to work on any of the Marvel-based ARM/ARM5 "plug computers," including GuruPlug, ShivaPlug, TonidoPlug, PogoPlug, etc.
<hr>
Credits:
<ul> 
<li> mikestaszel on http://plugapps.com/forum/viewtopic.php?f=9&t=369 for the JRE pointer.
<li> http://www.pchilton.co.uk/2011/01/29/crashplan-online-backup-on-qnap-ts-210-nas/ for the libjtux.so
<li> http://support.crashplan.com/doku.php/client/troubleshooting/real-time
</ul>
