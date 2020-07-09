---
excerpt: "<p>It is possible to run the Oracle exp or imp (and probably other commands)
  without getting your tnsnames.ora and your environment variables 100% right.&nbsp;
  (You will need them at least part-way right.) Here's how to run exp:</p>\r\n  <pre>\r\nexp
  userid/password@sidname direct=y recordlength=65535 feedback=1000 file=test1.dmp
  log=test1.log tables=(TABLENAME)\r\n</pre>\r\nNote: sidname might be globalname
  instead; I'm not sure."
categories: []
layout: post
title: Oracle exp (and other utilities) Without TNSNAMES
created: 1218244532
---
<p>It is possible to run the Oracle exp or imp (and probably other commands) without getting your tnsnames.ora and your environment variables 100% right.&nbsp; (You will need them at least part-way right.) Here's how to run exp:</p>
  <pre>
exp userid/password@sidname direct=y recordlength=65535 feedback=1000 file=test1.dmp log=test1.log tables=(TABLENAME)
</pre>
Note: sidname might be globalname instead; I'm not sure.
<hr />
<p>SQL*Plus can be run without TNSNAMES by using <pre>sqlplus userid/pwd@database.company.com:1521/sid</pre></p>
