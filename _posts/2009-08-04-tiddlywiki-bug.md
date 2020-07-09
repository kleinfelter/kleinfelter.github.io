---
excerpt: "As I reported on the Google TiddlyWiki group...\r\n  \r\n  <br />\r\n  <br
  /><font face=\"Courier, Monospaced\" class=\"fixed_width\">Problem: Version 2.5.2
  fails to save backup on a network drive in a\r\n\r\n    \r\n    <br /> Windows domain
  environment with IE7.\r\n\r\n    \r\n    <br /></font>\r\n  <p><font face=\"Courier,
  Monospaced\" class=\"fixed_width\">I've got two empty TiddlyWikis. &nbsp;One is
  v2.5.0 and the other is\r\n\r\n      \r\n      <br /> v2.5.2. &nbsp;I have saved
  each in the same folder on a network folder\r\n\r\n      \r\n      "
categories: []
layout: post
title: TiddlyWiki Bug
created: 1249401100
---
As I reported on the Google TiddlyWiki group...
  
  <br />
  <br /><font face="Courier, Monospaced" class="fixed_width">Problem: Version 2.5.2 fails to save backup on a network drive in a

    
    <br /> Windows domain environment with IE7.

    
    <br /></font>
  <p><font face="Courier, Monospaced" class="fixed_width">I've got two empty TiddlyWikis. &nbsp;One is v2.5.0 and the other is

      
      <br /> v2.5.2. &nbsp;I have saved each in the same folder on a network folder

      
      <br /> (i.e. \\servername\sharename\foldername). &nbsp;I have defined

      
      <br /> txtBackupFolder to be &quot;backups&quot;. &nbsp;When I click Save Changes, 2.5.0

      
      <br /> saves the file and saves a backup in backups; 2.5.2 fails.

      
      <br /></font></p>
  <p><font face="Courier, Monospaced" class="fixed_width">No plugins.

      
      <br /> Windows XP SP3

      
      <br /> On a Windows network, using Windows domain security.

      
      <br />­Fails when browser is IE7.

      
      <br /> It works with Firefox 2.5.1.

      
      <br /></font></p>
  <p><font face="Courier, Monospaced" class="fixed_width">Work-around:

      
      <br /> I used a text editor on the file, and inside the definition of

      
      <br /> copyFile, I changed

­<code></code>
      <pre>    copyFile: function(dest,source) {
        drivers.activeX.createPath(dest);
</pre>
to
<code></code>
      <pre>    copyFile: function(dest,source) {
        var browser=navigator.appName;
        if (browser=="Microsoft Internet Explorer")
            ieCreatePath(dest);
        drivers.activeX.createPath(dest);
</pre>
      <br />and I pasted ieCreatePath from the 2.5.0 TiddlyWiki immediately after

      
      <br /> the Main function.

      
      <br /></font></p>
  <p><font face="Courier, Monospaced" class="fixed_width">With the work-around, it saves the file and it saves the backup file.</font></p>
  <br />
