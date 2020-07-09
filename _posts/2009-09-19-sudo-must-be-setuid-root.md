---
excerpt: "<p>I bought a TonidoPlug, which is a wall-wart with an embedded Linux server
  (running Ubuntu 9.04 Jaunty).&nbsp; Out of the box, sudo gave the error:</p>\r\n
  \ <pre>\r\nsudo: must be setuid root</pre>\r\n  <p>This message means exactly what
  it says -- the sudo command is not setuid and it must be setuid (and owned by root).</p>\r\n
  \ <pre>\r\nchown root:root /usr/bin/sudo\r\nchmod u+s /usr/bin/sudo</pre>\r\n  <p>will
  correct the 'problem.' (I put quotes around 'problem' because there are some who
  will say that this is a security feature.)</p>"
categories: []
layout: post
title: 'sudo: must be setuid root'
created: 1253375867
---
<p>I bought a TonidoPlug, which is a wall-wart with an embedded Linux server (running Ubuntu 9.04 Jaunty).&nbsp; Out of the box, sudo gave the error:</p>
  <pre>
sudo: must be setuid root</pre>
  <p>This message means exactly what it says -- the sudo command is not setuid and it must be setuid (and owned by root).</p>
  <pre>
chown root:root /usr/bin/sudo
chmod u+s /usr/bin/sudo</pre>
  <p>will correct the 'problem.' (I put quotes around 'problem' because there are some who will say that this is a security feature.)</p>
