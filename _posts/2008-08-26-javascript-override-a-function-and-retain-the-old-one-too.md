---
excerpt: "<code>\r\n    <pre>\r\n&lt;SCRIPT language=javascript&gt;\r\nvar base_foo;\r\nfunction
  foo(yourname){\r\n    alert('Hello ' + yourname);\r\n}\r\n\r\nbase_foo = foo;\r\n\r\nfoo
  = function(yourname){\r\n    alert('(overide) Hello ' + yourname);\r\n}\r\n&lt;/SCRIPT&gt;\r\n</pre></code>From
  <a href=\"http://dataerror.blogspot.com/2005/08/javascript-function-overriding-part-2.html\">http://dataerror.blogspot.com/2005/08/javascript-function-overriding-part-2.html</a>"
categories: []
layout: post
title: Javascript - Override a Function and Retain the Old One Too
created: 1219759232
---
<code>
    <pre>
&lt;SCRIPT language=javascript&gt;
var base_foo;
function foo(yourname){
    alert('Hello ' + yourname);
}

base_foo = foo;

foo = function(yourname){
    alert('(overide) Hello ' + yourname);
}
&lt;/SCRIPT&gt;
</pre></code>From <a href="http://dataerror.blogspot.com/2005/08/javascript-function-overriding-part-2.html">http://dataerror.blogspot.com/2005/08/javascript-function-overriding-part-2.html</a>
