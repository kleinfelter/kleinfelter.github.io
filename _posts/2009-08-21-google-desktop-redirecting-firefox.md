---
excerpt: "I had a strange problem with Firefox 3.5.2 and Google Desktop.&nbsp; Searching
  GDS via double-control, would send Firefox to an URL resembling:\r\n  <br />\r\n
  \ <br />http://127.0.0.1:4664/search?s=1234567894&amp;q=searchterm&amp;aq=t\r\n
  \ <br />\r\n  <br />which would redirect to my external IP address, and then fail
  (because I'm not running a web server).\r\n  <br />\r\n  <br />When I switched from
  Firefox as my default browser to Internet Explorer, double-control search worked.&nbsp;
  Furthermore, Firefox would work (i.e. not redirect) if I pasted\r\n  <br />\r\n
  \ "
categories: []
layout: post
title: Google Desktop Redirecting Firefox
created: 1250875695
---
I had a strange problem with Firefox 3.5.2 and Google Desktop.&nbsp; Searching GDS via double-control, would send Firefox to an URL resembling:
  <br />
  <br />http://127.0.0.1:4664/search?s=1234567894&amp;q=searchterm&amp;aq=t
  <br />
  <br />which would redirect to my external IP address, and then fail (because I'm not running a web server).
  <br />
  <br />When I switched from Firefox as my default browser to Internet Explorer, double-control search worked.&nbsp; Furthermore, Firefox would work (i.e. not redirect) if I pasted
  <br />
  <br />http://localhost:4664/search?s=1234567894&amp;q=searchterm&amp;aq=t
  <br />
  <br />into the address bar manually.
  <br />
  <br />I tried disabling add-ons, turning off my proxy.pac file, and starting in safe mode.&nbsp; No joy.&nbsp; However, clearing the cache did fix the problem.
  <br />
