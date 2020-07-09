---
excerpt: "<p>This works better than the method by headtailgrep at <a href=\"http://www.pdastreet.com/forums/showthread.php?s=&amp;threadid=47229\">http://www.pdastreet.com/forums/showthread.php?s=&amp;threadid=47229</a>&nbsp;because
  Blackberry Desktop will auto-uninstall headtailgrep's installs, but not Blackberry
  Desktop's installs.&nbsp; htg's method works for generic Java applications, while
  this method works for Blackberry applications.</p>\r\n  <p>This method is useful
  if you don't have a Blackberry data plan.</p>"
categories: []
layout: post
title: Installing Gmail (or Any Blackberry App) on a Blackberry via Blackberry Desktop
  Without a Blackberry Data Plan
created: 1224361356
---
<p>This works better than the method by headtailgrep at <a href="http://www.pdastreet.com/forums/showthread.php?s=&amp;threadid=47229">http://www.pdastreet.com/forums/showthread.php?s=&amp;threadid=47229</a>&nbsp;because Blackberry Desktop will auto-uninstall headtailgrep's installs, but not Blackberry Desktop's installs.&nbsp; htg's method works for generic Java applications, while this method works for Blackberry applications.</p>
  <p>This method is useful if you don't have a Blackberry data plan.</p>
  <p>EDIT: Please note that you do have to have a <u>data</u> plan, just not a &quot;<u>Blackberry</u> data plan.&quot;
    <br /></p>
  <p>Prerequisites:</p>
  <ol>
    <li>Firefox (could use another browser if it lets you change your user agent) </li>
    <li>User Agent Switcher 0.6.11 add on for Firefox (or your browser's equivalent). See <a href="http://chrispederick.com/work/user-agent-switcher/">http://chrispederick.com/work/user-agent-switcher/</a></li>
    <li>BlackBerry Desktop Software (I'm using 4.6.0.12) </li>
  </ol>
  <p>Actions:</p>
  <ol>
    <li>Define&nbsp;a user agent: 
      
      <ol>
        <li>Description = blackberry 8700 </li>
        <li>User Agent = BlackBerry8700/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/180 </li>
      </ol>
    </li>
    <li>Set Firefox to use this user agent.&nbsp; Check to make sure it did via Tools/User Agent Switcher </li>
    <li>Browse to m.google.com 
      
      <ol>
        <li>Click on Gmail </li>
        <li>Click on Install Now.&nbsp; This will download <a href="http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail.jad">http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail.jad</a></li>
        <li>Save it as C:\temp\bb\GoogleMail.jad </li>
      </ol>
    </li>
    <li>Edit C:\temp\bb\GoogleMail.jad with a text editor that can handle newline-terminated lines 
      
      <ol>
        <li>Find all lines containing RIM-COD-URL.&nbsp; In GoogleMail.jad, there are 4, named: 
          
          <ol>
            <li>GoogleMail.cod </li>
            <li>GoogleMail-1.cod </li>
            <li>GoogleMail-2.cod </li>
            <li>GoogleMail-3.cod </li>
          </ol>
        </li>
        <li>Using the path (not the file name) from the .jad file url (e.g. <a href="http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail.jad"><u><font color="#0000ff">http://m.google.com/app/v2.0.5/L1/BlackBerry-41/</font></u></a>) construct the .cod urls: 
          
          <ol>
            <li><a href="http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail.cod">http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail.cod</a></li>
            <li><a href="http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail-1.cod">http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail-1.cod</a></li>
            <li><a href="http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail.cod-2">http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail-2.cod</a></li>
            <li><a href="http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail-3.cod">http://m.google.com/app/v2.0.5/L1/BlackBerry-41/GoogleMail-3.cod</a></li>
          </ol>
        </li>
      </ol>
    </li>
    <li>Download the .cod files into C:\temp\bb </li>
    <li>Create a file that looks a lot like this, and name it C:\temp\bb\GoogleMail.alx.&nbsp; (Lines must be CR/LF terminated.): </li>
  </ol>
  <p></p>
  <pre>&lt;loader version="1.0"&gt;
&lt;application id="Gmail:Google"&gt;
&lt;name&gt;Gmail&lt;/name&gt;
&lt;description&gt;&lt;/description&gt;
&lt;version&gt;2.0.5&lt;/version&gt;
&lt;vendor&gt;Google&lt;/vendor&gt;
&lt;copyright&gt;&lt;/copyright&gt;
&lt;fileset Java="1.0"&gt;
&lt;files&gt;
GoogleMail-3.cod
GoogleMail-2.cod
GoogleMail-1.cod
GoogleMail.cod
&lt;/files&gt;
&lt;/fileset&gt;
&lt;/application&gt;
&lt;/loader&gt;</pre>
  <p>&nbsp;Note: It is important to take the value for VERSION from the MIDlet-Version row in the .JAD file.&nbsp; Otherwise, BB desktop can tell you &quot;No additional applications designed for your device were found&quot;&nbsp; Other reasons for this message include:</p>
  <ul>
    <li>You need to download the software that tells the Desktop Manager how to properly talk to your device. 
      
      <br />RIM calls this software the “Device” software (or &quot;BlackBerry Handheld Software&quot; for newer versions), but it is your PC's device driver for the BB. 
      
      <br />To see the version of the device software you have installed, Desktop Manager/Help/About/Device_Software”.&nbsp; If you don’t see your BlackBerry model in the list, Download it from <a href="http://na.blackberry.com/eng/support/downloads/download_sites.jsp">http://na.blackberry.com/eng/support/downloads/download_sites.jsp</a>&nbsp; . 
      
      <br />Select your carrier and then select the software for your model.&nbsp;&nbsp; (I used <span class="cMB">BlackBerry Handheld Software v4.2.1.155 (Multilanguage).)</span></li>
    <li><span class="cMB">Check to see if your file is exactly like mine.</span></li>
    <li><span class="cMB">You need CR/LF terminated lines (I think).</span></li>
    <li><span class="cMB">Don't put a trailing CR/LF after the last line</span></li>
  </ul>
  <ol start="7">
    <li>Open Blackberry Desktop 
      
      <ol>
        <li>Application Loader </li>
        <li>Add-Remove applications </li>
        <li>Browse to C:\temp\bb\GoogleMail.alx </li>
      </ol>
    </li>
  </ol>
