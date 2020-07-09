---
excerpt: "I've got a web page that works just fine in Firefox but not in IE 8.&nbsp;
  It includes HTML that looks like this:\r\n  <br />\r\n  <pre>&lt;a href=\"#\" onclick=\"myFunc(0);\"&gt;Call
  myFunc&lt;/a&gt;\r\n</pre>and in my JavaScript, it includes something like this:\r\n
  \ <br />\r\n  <pre>function myFunc(num) {\r\nalert(\"got here\");\r\n}\r\n</pre>In
  Firefox, clicking on the link displays the alert.&nbsp; In Internet Explorer, it
  produces an &quot;Object expected&quot; error.\r\n  <br />\r\n  <br />I did a little
  poking around and I learned that myFunc is not defined in IE.\r\n  "
categories: []
layout: post
title: Object Expected Error in Internet Explorer
created: 1266632305
---
I've got a web page that works just fine in Firefox but not in IE 8.&nbsp; It includes HTML that looks like this:
  <br />
  <pre>&lt;a href="#" onclick="myFunc(0);"&gt;Call myFunc&lt;/a&gt;
</pre>and in my JavaScript, it includes something like this:
  <br />
  <pre>function myFunc(num) {
alert("got here");
}
</pre>In Firefox, clicking on the link displays the alert.&nbsp; In Internet Explorer, it produces an &quot;Object expected&quot; error.
  <br />
  <br />I did a little poking around and I learned that myFunc is not defined in IE.
  <br />
  <pre>&lt;a href="#" onclick="alert("Type is:" + typeof(myFunc));"&gt;Call myFunc&lt;/a&gt;</pre>produces an alert which says, &quot;Type is:undefined&quot;.
  <br />
  <br />I defined the function in a systemConfig Tiddler in my TiddlyWiki, so I thought maybe it was something funky about TiddlyWiki.&nbsp; It turns out that IE has a quirk, in that global functions aren't visibly globally by default.&nbsp; Or, maybe it is that references to apparently global functions are qualified with &quot;window.&quot;
  <br />
  <br />At any rate, changing my JavaScript to:
  <br />
  <pre>function myFunc(num) {
alert("got here");
}

window.myFunc = myFunc;</pre>resolved the problem.
  <br />
