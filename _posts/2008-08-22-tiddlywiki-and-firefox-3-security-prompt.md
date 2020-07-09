---
excerpt: "When <a href=\"javascript:;\" title=\"The tiddler 'TiddlyWiki' doesn't yet
  exist\" class=\"tiddlyLink tiddlyLinkNonExisting\" refresh=\"link\" tiddlylink=\"TiddlyWiki\">TiddlyWiki</a>
  goes to save a file, in Firefox, you get the following dialog\r\n  <br />=====\r\n
  \ <br />Internet Security\r\n  <br />\r\n  <br />A script from &quot;<a class=\"externalLink\"
  href=\"file:///\" title=\"External link to file://\" target=\"_blank\">file://</a>&quot;
  is requesting enhanced abilities that are UNSAFE and could be used to compromise
  your machine or data\r\n  <br />=====\r\n  <br />\r\n  "
categories: []
layout: post
title: TiddlyWiki and Firefox 3+ Security Prompt
created: 1219430311
---
When <a href="javascript:;" title="The tiddler 'TiddlyWiki' doesn't yet exist" class="tiddlyLink tiddlyLinkNonExisting" refresh="link" tiddlylink="TiddlyWiki">TiddlyWiki</a> goes to save a file, in Firefox, you get the following dialog
  <br />=====
  <br />Internet Security
  <br />
  <br />A script from &quot;<a class="externalLink" href="file:///" title="External link to file://" target="_blank">file://</a>&quot; is requesting enhanced abilities that are UNSAFE and could be used to compromise your machine or data
  <br />=====
  <br />
  <h3>Update:</h3>
I now use this:<br />
Type "about:config" into the URL address bar, and set the property
security.fileuri.strict_origin_policy
to false 
  <br />You'll often read doc about updating prefs.js with something that resembles:
  <br />
  <br />
  <pre>user_pref("capability.principal.codebase.p0.granted","UniversalXPConnect  UniversalBrowserRead");
user_pref("capability.principal.codebase.p0.id", "file://"); 
</pre>
  <br />This advice is almost correct, but you you specify only &quot;<a class="externalLink" href="file:///" title="External link to file://" target="_blank">file://</a>&quot; you will still get the message.  You must specify the full path name of the file.  Instead of &quot;<a class="externalLink" href="file:///" title="External link to file://" target="_blank">file://</a>&quot;, give it something like:
  <br />
  <pre>user_pref("capability.principal.codebase.p1.granted", "UniversalXPConnect");
user_pref("capability.principal.codebase.p1.id", "file:///C:/Documents and Settings/kevin/Desktop/TwoNote/ScrapBook.html");
user_pref("capability.principal.codebase.p1.subjectName", "");

</pre>
  <br />Firefox no longer accepts that &quot;<a class="externalLink" href="file:///" title="External link to file://" target="_blank">file://</a>&quot; is good for &quot;<a class="externalLink" href="file:///blah-blah/blah.html" title="External link to file:///blah-blah/blah.html" target="_blank">file:///blah-blah/blah.html</a>
