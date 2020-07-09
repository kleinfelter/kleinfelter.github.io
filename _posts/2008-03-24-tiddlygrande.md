---
excerpt: "TiddlyGrande is a plugin for <a title=\"TiddlyWiki Web Site\" href=\"http://www.tiddlywiki.com\">TiddlyWiki</a>,
  adapting it to store its data in a SQLite database.\r\n  \r\n  <br />\r\n  "
categories: []
layout: post
title: TiddlyGrande
created: 1206390970
---
TiddlyGrande is a plugin for <a title="TiddlyWiki Web Site" href="http://www.tiddlywiki.com">TiddlyWiki</a>, adapting it to store its data in a SQLite database.
  
  <br />
  <br />To some people, the essence of <a title="TiddlyWiki Web Site" href="http://www.tiddlywiki.com/">TiddlyWiki</a> is that it is all in a single file.&nbsp; To others, the  <a title="TiddlyWiki Web Site" href="http://www.tiddlywiki.com/">TiddlyWiki</a> user interface is most interesting.&nbsp; If you fall into the latter group, and you have LOTS of tiddlers, you may be interested in TiddlyGrande.&nbsp; (There's a story out there that  <a title="TiddlyWiki Web Site" href="http://www.tiddlywiki.com/">TiddlyWiki</a> becomes slow when you have thousands of tiddlers.&nbsp; I don't know how true it is.)
  
  <br />
  <br /><strong>Note:</strong>&nbsp; I haven't published the code yet.&nbsp; It isn't ready.&nbsp; Some people release code before doc.&nbsp; I release doc before code.
  
  <br />
  <br /><strong>Prerequisites</strong>:
  
  <br />1. Install Google Gears.&nbsp; Google Gears makes SQLite available to JavaScript running in the browser.
  
  <br />2. You need a  <a title="TiddlyWiki Web Site" href="http://www.tiddlywiki.com/"></a>TiddlyWiki file.&nbsp; You can get one from <a href="http://www.tiddlywiki.com">http://www.tiddlywiki.com</a>.
  
  <br />
  <br /><strong>How-to:</strong>
  <br />
  <ol>
    <li>If you have an existing TiddlyWiki with real data in it, I suggest you do this to a copy of your TiddlyWiki.</li>
    <li>Paste the content of the attached MarkupPostBody.txt into a tiddler named MarkupPostBody in your TiddlyWiki, and click the Save Changes link on your TiddlyWiki page.</li>
    <li>Copy the attached ggtiddlywiki.js into the same directory as your TiddlyWiki file.</li>
    <li>Copy gears_init.js into the same directory as your TiddlyWiki file.</li>
    <li>Refresh your browser (typically via pressing the F5 key, if you're running Windows).</li>
  </ol><strong>Usage Notes</strong>:
  <br />
  <ol>
    <li>The first time you open/refresh your modified TiddlyWiki, it will migrate all of your data tiddlers into the SQLite database.&nbsp; If you have a lot of tiddlers, this can take a lot of time.</li>
    <li>Tiddlers tagged with systemConfig are always stored in the TiddlyWiki file.&nbsp; All other tiddlers get stored in the database.</li>
    <li>For non-systemConfig tiddlers, edits are immediately saved to the database.&nbsp; There is no need to &quot;Save Changes.&quot;</li>
    <li>When you click &quot;Save Changes&quot;, it will save the entire set of Tiddlers (systemConfig tiddlers AND database tiddlers) to your TiddlyWiki file.&nbsp; Don't click Save Changes if you don't want to do this.</li>
    <li>I recommend that you turn OFF TiddlyWiki's Autosave option when using TiddlyGrande.
      <br /></li>
  </ol>
  <br />
