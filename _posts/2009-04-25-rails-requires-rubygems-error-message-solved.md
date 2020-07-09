---
excerpt: "<p>When running script/server, I was getting the error message</p><code>\r\n
  \   <pre>\r\nRails requires RubyGems &gt;= . Please install RubyGems and try again:
  <A href=\"http://rubygems.rubyforge.org/\">http://rubygems.rubyforge.org</A></CODE></pre>\r\n
  \   <ul>\r\n      <li>Ruby Enterprise Edition in /opt/ruby-enterprise/bin</li>\r\n
  \     <li>Ubuntu's default ruby</li>\r\n    </ul>\r\n    <pre>\r\n<CODE>apt-get
  remove ruby</CODE></pre>fixed the problem</code>"
categories: []
layout: post
title: Rails requires RubyGems Error Message Solved
created: 1240684897
---
<p>When running script/server, I was getting the error message</p><code>
    <pre>
Rails requires RubyGems &gt;= . Please install RubyGems and try again: <A href="http://rubygems.rubyforge.org/">http://rubygems.rubyforge.org</A></CODE></pre>
    <ul>
      <li>Ruby Enterprise Edition in /opt/ruby-enterprise/bin</li>
      <li>Ubuntu's default ruby</li>
    </ul>
    <pre>
<CODE>apt-get remove ruby</CODE></pre>fixed the problem</code>
