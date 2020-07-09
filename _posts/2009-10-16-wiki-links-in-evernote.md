---
excerpt: "I'd really like to be able to link from one Evernote note to another, but
  Evernote doesn't have this feature (yet).\r\n  \r\n  <br />\r\n  <br />Here's an
  idea for grafting wiki words onto Evernote (without access to the source code).\r\n
  \ \r\n  <br />\r\n  <br />\r\n  <ol>\r\n    <li>Register a custom URI handler per
  <a href=\"http://msdn.microsoft.com/en-us/library/aa767914%28VS.85%29.aspx\">http://msdn.microsoft.com/en-us/library/aa767914%28VS.85%29.aspx</a>.&nbsp;
  I'd probably register &quot;en:&quot;.\r\n      \r\n      "
categories: []
layout: post
title: Wiki Links in Evernote
created: 1255703101
---
I'd really like to be able to link from one Evernote note to another, but Evernote doesn't have this feature (yet).
  
  <br />
  <br />Here's an idea for grafting wiki words onto Evernote (without access to the source code).
  
  <br />
  <br />
  <ol>
    <li>Register a custom URI handler per <a href="http://msdn.microsoft.com/en-us/library/aa767914%28VS.85%29.aspx">http://msdn.microsoft.com/en-us/library/aa767914%28VS.85%29.aspx</a>.&nbsp; I'd probably register &quot;en:&quot;.
      
      <br /></li>
    <li>Set up the URI handler to call &quot;<a href="http://www.evernote.com/about/developer/win_scripting.php">ENScript.exe</a>showNotes &lt;uri-goes-here&gt;&quot;.</li>
  </ol>In use, you would select the text you want to be a wiki link to another note, press control-K, and enter &quot;en:&quot; followed by the name of the note to which you'd like to link.&nbsp; Following the wiki word would just be to use Evernote's control-double-click handler.
  
  <br />
  <br />Of course, this would only work on the Windows edition of Evernote (because ENScript.exe runs only on Windows).&nbsp; I think it would work with the web version of Evernote for creation of links, but following the link in the web version of Evernote would open the local note, and only on the PC where the URI handler was registered.
  
  <br />
  <br />When Evernote gets around to implementing internal links to other notes, you'd have to convert these links manually, or write a conversion program using the Evernote API.
  
  <br />
  <br /><strong>UPDATE</strong>:
  <br />It turns out that Evernote almost already does this.&nbsp; I'm using Portable Evernote, so I didn't see that Evernote registers the &quot;evernote3&quot; protocol handler.&nbsp; Unfortunately, it appears that Evernote has a bug.&nbsp; When I set a hyperlink in a Note, as soon as I move off the note and return to it, it forgets hyperlinks that use the evernote3 protocol.&nbsp; (It does remember hyperlinks with the http protocol.)
  <br />
