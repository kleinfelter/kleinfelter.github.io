---
excerpt: "Building from source hangs on a really big gmcs (C-sharp version of cc).&nbsp;
  I edited the Makefile in src/Dekiservices to remove excess trailing whitespace on
  lines ending with backslash.\r\n  <br /><hr />\r\n  <br />\r\n  <div id=\"post_message_7117\">&quot;My
  passwords&quot; is not on the User Preferences screen for non-admin users.\r\n    \r\n
  \   \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    <br />\r\n    <br />\r\nWork-around:
  \ From your wiki root directory, edit includes/SpecialPreferences.php.  At (or about)
  line 312, you'll see:\r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n    \r\n
  \   <br />\r\n    "
categories: []
layout: post
title: Notes on Using Dekiwiki
created: 1196034361
---
Building from source hangs on a really big gmcs (C-sharp version of cc).&nbsp; I edited the Makefile in src/Dekiservices to remove excess trailing whitespace on lines ending with backslash.
  <br /><hr />
  <br />
  <div id="post_message_7117">&quot;My passwords&quot; is not on the User Preferences screen for non-admin users.
    
    
    
    
    
    
    
    <br />
    <br />
Work-around:  From your wiki root directory, edit includes/SpecialPreferences.php.  At (or about) line 312, you'll see:
    
    
    
    
    
    
    
    <br />
    <br /><em>//todo: was using isLocal(), but that doesn't work
      
      
      
      
      
      
      
      <br />
if ($wgUser-&gt;GetService()-&gt;GetSID() == WebService::SIDAUTHLOCAL) {
      
      
      
      
      
      
      
      <br /></em>
    <br />
    <br />
Change the &quot;if&quot; line to read:
    
    
    
    
    
    
    
    <br />
   if (true) {
    
    
    
    
    
    
    
    <br />
    <br />
and you will begin getting the &quot;My password&quot; fields.
    
    
    
    
    
    
    
    <br />
    <br />
QUESTION: What have I just done by removing the test for SIDAUTHLOCAL?  Have I opened up a security hole?
    
    
    
    
    
    
    <br />
    <br />UPDATE: This is not enough to get password updates to actually work.
    
    
    
    
    
    
    <br />1. Update includes/User.php and change this:
    
    
    
    
    
    
    <br />
    <ul>
      <li>function isLocalAccount() { return $this-&gt;getService()-&gt;isLocal(); }</li>
    </ul>to this:
    
    
    
    
    
    
    <br />
    <ul>
      <li>function isLocalAccount() { return true;}</li>
    </ul>2. Also edit includes/Title.php and change function isLocal to always return true
    
    
    
    
    
    <br />3. Note: I think that changing just 2 should do it, but it doesn't, so do both.
    
    
    
    
    <br />
  </div><!-- / message --><!-- controls --><img style="display: none;" id="progress_7117" src="http://forums.opengarden.org/images/misc/progress.gif" /><a href="http://forums.opengarden.org/editpost.php?do=editpost&amp;p=7117" name="vB::QuickEdit::7117"></a><hr />
  <br />If attachments give error messages about not being able to create directories or set permissions on files, but your permissions are correct, adding &quot;LD_LIBRARY_PATH=/opt/mono-1.2.5.1/lib:&quot; to the environment in which dekihost runs resolved the problem.
  
  
  
  
  
  
  
  
  
  <br />
  <br /><!-- / message --><!-- controls --><img style="display: none;" id="progress_7117" src="http://forums.opengarden.org/images/misc/progress.gif" /><a href="http://forums.opengarden.org/editpost.php?do=editpost&amp;p=7117" name="vB::QuickEdit::7117"></a><hr />Timezone appears to be broken. To fix it:
  
  
  
  
  <br />
  <ul>
    <li>vi languages/Language.php</li>
    <li>find&nbsp; function userAdjust</li>
    <li>right after $tz gets set, add</li>
    <ul>
      <li> $tz = '-5:00';&nbsp;&nbsp; # KPK KEVIN changed to force EST, because saving the timezone preference is broken.&nbsp;
        
        
        
        <br />
        <br /></li>
    </ul>
    <li>&nbsp;vi includes/SpecialPreferences.php</li>
    <li>Around line 301, comment out the 2 (not 3) lines that send the timezone control.</li>
  </ul>
  <br /><!-- / message --><!-- controls --><img style="display: none;" id="progress_7117" src="http://forums.opengarden.org/images/misc/progress.gif" /><a href="http://forums.opengarden.org/editpost.php?do=editpost&amp;p=7117" name="vB::QuickEdit::7117"></a><hr />The part of changing your password that checks your old password appears to be broken, because all attempts in the code to fetch the password fail.&nbsp; Hack the code to allow ANY old password:
  
  
  
  <br />
  <ul>
    <li>vi includes/User.php</li>
    <li>Change function checkPassword to always return true.&nbsp; This does not break login, because login uses a different method to check the password.&nbsp;</li>
  </ul>
  <br /><!-- / message --><!-- controls --><img style="display: none;" id="progress_7117" src="http://forums.opengarden.org/images/misc/progress.gif" /><a href="http://forums.opengarden.org/editpost.php?do=editpost&amp;p=7117" name="vB::QuickEdit::7117"></a><hr />The &quot;Forgot password&quot; feature is broken.&nbsp; To work around:
  
  
  <br />
  <ul>
    <li>cd ~kevin/Deki_Wiki_1.8.1d_Hayes_source/src
      
      
      <br /></li>
    <li>vi src/services/Deki/Entities/UserBE.cs</li>
    <li>Locate &quot;public XDoc ToXml&quot;</li>
    <li>Inside this function, ensure that &quot;showPrivateInfo = false&quot; gets changed to &quot;showPrivateInfo = true&quot;</li>
    <li>cd src</li>
    <li>make root_dir=`pwd` PREFIX=`pwd`/bin</li>
    <ul>
      <li>(Those are back-ticks above.)
        
        
        <br /></li>
    </ul>
    <li>e
      
      
      <br /></li>
  </ul>
