---
excerpt: "<ul>\r\n    <li>Download from http://www.jello-dashboard.net/?page_id=29</li>\r\n
  \   <li>Whether you use the .exe or the .zip, you may see a &quot;Could not obtain
  offline settings...&quot; error when trying to set the folder's home page to Jello5.htm.&nbsp;
  Clicking Cancel will get you past the error, with no ill effects (so far as I can
  tell).</li>\r"
categories: []
layout: post
title: Notes on Jello Dashboard Version 5
created: 1235064610
---
<ul>
    <li>Download from http://www.jello-dashboard.net/?page_id=29</li>
    <li>Whether you use the .exe or the .zip, you may see a &quot;Could not obtain offline settings...&quot; error when trying to set the folder's home page to Jello5.htm.&nbsp; Clicking Cancel will get you past the error, with no ill effects (so far as I can tell).</li>
    <li>It seems to access Outlook secured fields without using Redemption.&nbsp; To avoid the &quot;A program is trying to access e-mail addresses you have stored in Outlook&quot; error, install <a href="http://www.mapilab.com/outlook/security.">http://www.mapilab.com/outlook/security.</a> &nbsp; (I downloaded this and saved it as Outlook-Disable-Security-Warning-Plugin.zip.)</li>
    <li>I wanted to set a Home Page for a PST file (instead of my default store, which is an Exchange folder).&nbsp; Outlook 2007 makes this difficult.&nbsp; Download &quot;Office 2007 system Administrative Template files&quot; from Microsoft, run the group policy editor, and:</li>
    <ul>
      <li>User Configuration &gt; Administrative Templates</li>
      <li>Action &gt; Add/Remove Templates</li>
      <li>Add outlk12.adm from the download</li>
      <li>Close the Add dialog</li>
      <li>User Configuration &gt; Administrative Templates &gt; Microsoft Outlook 2007 &gt; Tools|Options &gt; Other &gt; Advanced</li>
      <li>Disable &quot;Do not allow folders in non-default stores to be set as folder home page...&quot;
        
        
        <br /></li>
    </ul>
  </ul>I think that covers all the hacking, just to get it running.&nbsp; To actually USE the thing...
  
  <br />
  <br /><strong>Glossary</strong>
  <br />
  <ul>
    <li>&quot;The Hierarchy&quot; - the tree control in the panel on the right side of the Jello display.</li>
  </ul><strong>How Do I...</strong>
  <br />
  <ul>
    <li>Create contexts:</li>
    <ul>
      <li>Right-click <em>Tags</em> in the hierarchy, and select <em>Insert</em>.&nbsp; Jello 5 doesn't treat context any different than other tags, so be sure to use the @ prefex, so you can recognize contexts.
        
        <br /></li>
    </ul>
    <li>Add an Action:</li>
    <ul>
      <li>Click <em>Collect</em> on the Home Page.
        <br /></li>
    </ul>
    <li>
      <br /></li>
  </ul><strong>Shortcut Keys (&quot;Hot keys&quot;)</strong>:
  <br />
  <ul>
    <li>They only work when you're looking at the Jello Dashboard page.&nbsp; They aren't Outlook hot-keys.
      <br /></li>
    <li>Home Screen - ^H</li>
    <li>Search - ^Z</li>
    <li>
      <br /></li>
  </ul>
