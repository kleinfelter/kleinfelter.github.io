---
excerpt: "Here's a non-intuitive error from Excel.\r\n<code></code>\r\n  <pre>run-time
  error '-21474417848 (80010108)'­ Automation Error - The object has disconnected
  from its clients' ­\r\n</pre>­\r\nI was getting this on a call to QueryTables.Add.Refresh.
  \ Sometimes I also received out-of-memory errors and sometimes Excel 2003 simply
  crashed.\r\n  <br />\r\n  "
categories: []
layout: post
title: Automation Error - The object has disconnected from its clients
created: 1256584579
---
Here's a non-intuitive error from Excel.
<code></code>
  <pre>run-time error '-21474417848 (80010108)'­ Automation Error - The object has disconnected from its clients' ­
</pre>­
I was getting this on a call to QueryTables.Add.Refresh.  Sometimes I also received out-of-memory errors and sometimes Excel 2003 simply crashed.
  <br />
  <br />I was sourcing from a CSV file with newline terminated lines.&nbsp; Excel was reading in the entire file and trying to treat it as a single record.&nbsp; Converting to CR/LF by running unix2dos on the server fixed the issue.&nbsp; Ultraedit could have fixed it on the Windows box as a one-time conversion, but this is going to run every day.
  <br />
