---
excerpt: "Webrat is a lovely testing tool, particularly when used with Cucumber.&nbsp;
  But every time I put it aside for a few weeks, when I come back to it, I forget
  about this...\r\n  \r\n\r\n  <pre><code>\r\nAnd I fill in \"name\" with \"John Doe\"
  \  \r\nCould not find field: \"name\" (Webrat::NotFoundError)\r\n</code></pre>\r\n
  \ <br />\r\n  <br />but when I go to the .html.erb file, I see the field, plainly
  defined:\r\n  \r\n\r\n  <pre><code>\r\n&lt;%= f.text_field :name %&gt;\r\n</code></pre>\r\n
  \ <br />\r\n  "
categories: []
layout: post
title: Webrat (Cucumber) Can't Find the Field to Fill-in
created: 1251412244
---
Webrat is a lovely testing tool, particularly when used with Cucumber.&nbsp; But every time I put it aside for a few weeks, when I come back to it, I forget about this...
  

  <pre><code>
And I fill in "name" with "John Doe"   
Could not find field: "name" (Webrat::NotFoundError)
</code></pre>
  <br />
  <br />but when I go to the .html.erb file, I see the field, plainly defined:
  

  <pre><code>
&lt;%= f.text_field :name %&gt;
</code></pre>
  <br />
  <br />So why doesn't webrat find the field?&nbsp; Because the field is NOT named &quot;name&quot;.&nbsp; It is named &quot;user_name&quot;.&nbsp; This is because it is wrapped inside 
  

  <pre><code>
&lt;% form_for :user, :url =&gt; users_path do |f| -%&gt;
</code></pre>
  <br />
  <br />Because of the form_for, all field names get prefixed with the form name.
  
  
  <br />­
