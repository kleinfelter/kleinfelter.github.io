---
excerpt: "<h2>Sqlite DDL</h2>   <pre>C:\\work\\rb\\test&gt;sqlite db\\test.db<br />SQLite
  version 2.8.16<br />Enter &quot;.help&quot; for instructions<br />sqlite&gt; create
  table articles<br />   ...&gt; (id integer primary key,<br />   ...&gt; title varchar(255),<br
  />   ...&gt; text varchar(1024)<br />   ...&gt; );<br />sqlite&gt; .quit<br />(or
  create table articles (id integer primary key, title varchar(255), text varchar(1024)
  );<br /><br />C:\\work\\rb\\test&gt;dir db<br /> Volume in drive C has no label.<br
  /> Directory of C:\\work\\rb\\test\\db<br />14.04.2005  14:14             4 096
  test.db"
categories: []
layout: post
title: SQLite and Ruby on Rails
created: 1187371723
---
<h2>Sqlite DDL</h2>   <pre>C:\work\rb\test&gt;sqlite db\test.db<br />SQLite version 2.8.16<br />Enter &quot;.help&quot; for instructions<br />sqlite&gt; create table articles<br />   ...&gt; (id integer primary key,<br />   ...&gt; title varchar(255),<br />   ...&gt; text varchar(1024)<br />   ...&gt; );<br />sqlite&gt; .quit<br />(or create table articles (id integer primary key, title varchar(255), text varchar(1024) );<br /><br />C:\work\rb\test&gt;dir db<br /> Volume in drive C has no label.<br /> Directory of C:\work\rb\test\db<br />14.04.2005  14:14             4 096 test.db<br />               1 File(s)          4 096 bytes<br />C:\work\rb\test&gt;<br /></pre><h1>Configure database.yml to use sqlite</h1>   	<p>SQLite does not use authentication and needs only a pointer to the database file. <br />The adapter parameter tells Ruby to use SQLite for a database.</p>   <pre>development:<br />  adapter: sqlite<br />  dbfile: db/dev.db<br /><br />test:<br />  adapter: sqlite<br />  dbfile: db/test.db<br /><br />production:<br />  adapter: sqlite<br />  dbfile: db/prod.db<br /></pre>  	<p><span style="color: red">If you are using SQLite3 use “sqlite3” instead of “sqlite” for the adapter.</span></p><p>&nbsp;</p><p>(Swiped from a site whose URL I&#39;ve misplaced </p>
