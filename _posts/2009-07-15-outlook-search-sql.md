---
excerpt: "You can use a pseudo-SQL called &quot;DASL&quot; to search Outlook items
  in VBA (vbscript/Visual Basic for Applications).&nbsp; I never can quite remember
  the syntax.&nbsp; To interactively discover the syntax:\r\n  "
categories: []
layout: post
title: Outlook Search SQL
created: 1247679231
---
You can use a pseudo-SQL called &quot;DASL&quot; to search Outlook items in VBA (vbscript/Visual Basic for Applications).&nbsp; I never can quite remember the syntax.&nbsp; To interactively discover the syntax:
  <br />
  <ol>
    <li>Select View/Arrange By/Current View/Customize Current View</li>
    <li>Press the Filter button</li>
    <li>Use the Advanced tab to build your query.</li>
    <li>Use the SQL tab to see the DASL.</li>
  </ol>One thing I haven't figured out yet is how to select items that do not have &quot;waiting&quot; as one of the categories.&nbsp; If you build a query using &quot;doesn't contain&quot; and &quot;waiting&quot;, the DASL it builds is &quot;&lt;&gt; 'waiting'&quot; and that fails if the item has multiple categories.
  <br />
  <br />
