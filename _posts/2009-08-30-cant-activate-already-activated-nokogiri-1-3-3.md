---
excerpt: "I was getting &quot;can't activate , already activated nokogiri-1.3.3&quot;
  for some environments, but not others.&nbsp; In particular, I got it when I ran:\r\n
  \ \r\n  <br />\r\n  <pre>rake environment RAILS_ENV=test db:migrate</pre>\r\n  <br
  />I'm using Suspenders, and config/test.rb and config/cucumber.rb specify version
  1.3.2.&nbsp; Solution: Remove the version specification from these files.\r\n  \r\n
  \ <br />\r\n  <br />"
categories: []
layout: post
title: can't activate , already activated nokogiri-1.3.3
created: 1251652192
---
I was getting &quot;can't activate , already activated nokogiri-1.3.3&quot; for some environments, but not others.&nbsp; In particular, I got it when I ran:
  
  <br />
  <pre>rake environment RAILS_ENV=test db:migrate</pre>
  <br />I'm using Suspenders, and config/test.rb and config/cucumber.rb specify version 1.3.2.&nbsp; Solution: Remove the version specification from these files.
  
  <br />
  <br />
