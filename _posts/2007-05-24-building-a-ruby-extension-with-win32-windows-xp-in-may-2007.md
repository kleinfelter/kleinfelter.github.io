---
excerpt: <p>When I Googled for building Ruby extensions for Windows, I found a lot
  of old (very old) information. I found some good info at <a href="http://blogs.law.harvard.edu/hoanga/2006/12/14/getting-a-ruby-c-extension-to-compile-on-windows/"
  target="_blank" title="this web site">this web site</a>.  What follows is a record
  of my attempts to follow this guidance.</p>
categories: []
layout: post
title: Building a Ruby Extension With Win32, Windows XP, in May 2007
created: 1180056072
---
<p>When I Googled for building Ruby extensions for Windows, I found a lot of old (very old) information. I found some good info at <a href="http://blogs.law.harvard.edu/hoanga/2006/12/14/getting-a-ruby-c-extension-to-compile-on-windows/" target="_blank" title="this web site">this web site</a>.  What follows is a record of my attempts to follow this guidance.</p> <ol> <li>Download and install Visual C++ 2005 Express Edition (free)</li> <li>Download and install the Platform SDK (ISO Edition) from Microsoft.<ol> <li>I installed none of the 64–bit stuff — mostly just the 32–bit Intel core SDK</li></ol></li>  <li>Edit $RUBY_HOME/lib/ruby/1.8/i386-mswin32/config.h and delete the “#error MSC version unmatch” line</li> <li>Click your way to:<ul> <li>Start</li> <li>All Programs</li> <li>Microsoft Platform SDK…</li> <li>Open Build Environment Window</li> <li>Windows XP 32–bit Build Environment</li> <li>Set Windows XP…(Retail)</li></ul></li>  <li>cd &quot;C:\Program Files\Microsoft Visual Studio 8\VC\bin&quot;<ul> <li>The quotes are important.</li></ul></li>  <li>vcvars32.bat</li> <li>cd C:\temp\guitest\ext\cguitest<ul> <li>I&#39;m building the guitest extension</li></ul></li>  <li>ruby extconf.rb</li> <li>nmake</li> <li>mt.exe -manifest my_test.so.manifest -outputresource:my_test.so;2<ul> <li>Copy and paste the command above. You need it all from the &#39;mt&#39; to the &#39;;2&#39;</li></ul></li>  <li>nmake install</li> <li>cd \temp\guitest</li> <li>ruby install.rb install</li> <li>irb<ul> <li>require &#39;win32/guitest&#39;</li></ul></li>  <li>Happiness</li></ol>
