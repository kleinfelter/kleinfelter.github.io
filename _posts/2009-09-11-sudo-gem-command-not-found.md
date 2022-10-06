---
excerpt: "There are hundreds of reports on the net about &quot;sudo: gem: command
  not found&quot;.&nbsp; Out of the dozen or so I looked at, the suggested resolution
  amounted to &quot;ensure that 'gem' is in your PATH.&quot;\r\n  \r\n  \r\n  \r\n
  \ <br />\r\n  <br />Yep.&nbsp; It is in <u>my</u> path.&nbsp; That is to say, the
  following works:\r\n  ­\r\n  \r\n  \r\n  <br /><strong>gem --help</strong>\r\n  <br
  />but the following fails:\r\n  \r\n  \r\n  \r\n  <br /><strong>sudo gem --help</strong>\r\n
  \ <br />\r\n  <br />Further confusing matters, gem is in the path shown by:\r\n
  \ \r\n  \r\n  \r\n  "
categories: []
layout: post
title: 'sudo: gem: command not found'
created: 1252707688
---
There are hundreds of reports on the net about &quot;sudo: gem: command not found&quot;.&nbsp; Out of the dozen or so I looked at, the suggested resolution amounted to &quot;ensure that 'gem' is in your PATH.&quot;
  
  
  
  <br />
  <br />Yep.&nbsp; It is in <u>my</u> path.&nbsp; That is to say, the following works:
  ­
  
  
  <br /><strong>gem --help</strong>
  <br />but the following fails:
  
  
  
  <br /><strong>sudo gem --help</strong>
  <br />
  <br />Further confusing matters, gem is in the path shown by:
  
  
  
  <br /><strong>sudo echo $PATH</strong>
  <br />
  <br />The trick is that sudo doesn't use $PATH for its path on some editions of Linux.&nbsp; This behavior is considered &quot;more secure.&quot;&nbsp; (See <a title="http://stackoverflow.com/questions/257616/sudo-changes-path-why" href="http://stackoverflow.com/questions/257616/sudo-changes-path-why">http://stackoverflow.com/questions/257616/sudo-changes-path-why</a> ).
  
  
  
  <br />
  <br />Bah!&nbsp; It is still a pain to work around.&nbsp; You have to get 'gem' into the path (not simply the $PATH!)&nbsp; You'll read about options you can pass to sudo, and that is fine and dandy when you type the command-line yourself.&nbsp; When someone's script invokes sudo for you, you're stuck with the command line that it uses.
  
  
  
  <br />
  <br />The hack, reproduced from the stackoverflow article:
  
  
  
  <br />­<code></code>
  <br />
  <pre>mv /usr/bin/sudo /usr/bin/sudo.orig
cat &gt; /usr/bin/sudo &lt;&lt;EOF
<code><span class="com">#!/bin/bash</span><span class="pln">
</span><span class="str">/usr/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">sudo</span><span class="pun">.</span><span class="pln">orig env PATH</span><span class="pun">=</span><span class="pln">$PATH </span><span class="str">"$@"</span><span class="pln"></span></code>
EOF
</pre>
­
then your regular sudo works just like the non secure-path sudo.
