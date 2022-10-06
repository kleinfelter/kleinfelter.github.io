---
categories: []
layout: post
title: Adding Page Breaks to Drupal Pages
created: 1358906741
redirect_from: /content/adding-page-breaks-drupal-pages
---
<p>I wanted to create some pages on a Drupal blog and I wanted to control pagination when printing to paper. This blog is using the default &quot;bartik&quot; theme. I found two ways. Both work with recent versions of IE and Firefox; both fail with webkit (Safari and Chrome). In order to use the following, you must use the &quot;full html&quot; text format (not Markdown, not filtered html, not plain text), and you must use the plain text editor.</p>
<p>The easy way -- put the following line in your blog posting body, wherever you want a page break on print:</p>
<code>
<pre>
&lt;div style="page-break-before: always;"&gt;&lt;/div&gt;
</pre>
</code>
<p>The hard way -- edit drupal/themes/bartik/css/print.css and append the following:</p>
<code>
<pre>
 .page-break { page-break-before: always; }
</pre>
</code>
<p>Then put the following line in your blog posting body, wherever you want a page break on print:</p>
<code>
<pre>
&lt;div class=&quot;page-break&quot;&gt;&lt;/div&gt;
</pre>
</code>
<p>So far, so good -- so long as you use IE or Firefox. Chrome and Safari will respect page-break for some people on some sites, but they are really touchy about other elements of your CSS. Something about bartik or Drupal prevents them from processing page-break. Since Chrome and Safari will ignore our page-break code, I thought it might be nice to warn users of those browsers. But not every user of my pages will print them, so I decided to display the warning only for Chrome/Safari users who actually try to print my pages.</p>
<p>I appended the following to drupal/themes/bartik/css/print.css:</p>
<code>
<pre>
@media print and (-webkit-min-device-pixel-ratio:0) { .warnwebkit {display: inline; } } 
</pre>
</code>
<p>and at the end of each of my printable pages I add the following:</p>
<code>
<pre>
&lt;div class=&quot;warnwebkit&quot;&gt; This story will paginate properly with recent versions of Firefox and Internet Explorer. They paginate poorly with Chrome/Safari. Sorry about that. &lt;/div&gt;
</pre>
</code>
