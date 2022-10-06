---
excerpt: <p>(Much content based on <a title="http://www.netbeans.org/kb/docs/ruby/rapid-ruby-weblog.html"
  href="http://www.netbeans.org/kb/docs/ruby/rapid-ruby-weblog.html">http://www.netbeans.org/kb/docs/ruby/rapid-ruby-weblog.html</a>)</p>
categories: []
layout: post
title: Rails on Windows April 2009
created: 1239574058
---
<p>(Much content based on <a title="http://www.netbeans.org/kb/docs/ruby/rapid-ruby-weblog.html" href="http://www.netbeans.org/kb/docs/ruby/rapid-ruby-weblog.html">http://www.netbeans.org/kb/docs/ruby/rapid-ruby-weblog.html</a>)</p>  <ul>   <li>Install Ruby 1.8.6 from the one-click installer. </li>    <li>Install MySQL 5.0.27, as a Windows Service, with developer Tools. </li>    <li>Install NetBeans 6.5.1 with just the Ruby package. </li>    <li>gem update –system </li>    <li>gem install mysql      <ol>       <li>It installed mysql-2.7.3-mswin32.&#160; Note: Only MySQL 5.0.27 works with 2.7.3 of the gem.&#160; That is the version it was linked with when it was compiled.&#160; If you mismatch the versions, you’ll get “rake aborted! undefined method `each' for #&lt;Mysql:…” </li>        <li>It gave an error installing the doc, but the rest appears OK. </li>     </ol>   </li>    <li>gem install rails </li>    <li>Start NetBeans      <ol>       <li>File/New Project          <ol>           <li>Ruby </li>            <li>Ruby on Rails Application </li>            <li>Project Name = rubyweblog </li>            <li>Location=K:\NetBeansProjects </li>            <li>Platform=Ruby 1.8.6-p287 </li>            <li>Server=WebRick </li>            <li>Database Adapter=mysql </li>            <li>database name = rubyweblog_development </li>            <li>user=root </li>            <li>Rails Version=2.3.2 </li>         </ol>       </li>        <li>Right-click Rubyweblog in the tree          <ol>           <li>Generate / Scaffold </li>            <li>Model Name = Post (singular, initial Cap.) </li>         </ol>       </li>        <li>Right-click Rubyweblog in the tree          <ol>           <li>Run/Debug rake task </li>            <li>db:create </li>         </ol>       </li>        <li>Right-click Rubyweblog in the tree          <ol>           <li>Migrate Database </li>            <li>To Current Version </li>         </ol>       </li>        <li>Open rubyweblog/Configuration/routes.rb          <ol>           <li>Add&#160;&#160; map.root :controller =&gt; &quot;posts&quot;&#160;&#160;&#160; somewhere inside the do. </li>         </ol>       </li>        <li>Delete K:\NetBeansProjects\rubyweblog\public\index.html </li>        <li>Right-click rubyweblog and select Run. </li>        <li>Open a web browser to <a href="http://localhost:3000/">http://localhost:3000/</a> and create a couple of posts. </li>        <li>Right-click Database Migrations, and select Generate (Generator = migration; Arguments = “<code>AddBodyToPost body:text</code>”) </li>        <li>Right-click Rubyweblog in the tree          <ol>           <li>Migrate Database </li>            <li>To Current Version </li>         </ol>       </li>        <li>Edit rubyweblog\views\posts\edit.html.erb, and add a “&lt;p&gt;” for the body, similar to the title. </li>        <li>Edit rubyweblog\views\posts\new.html.erb, and add a “&lt;p&gt;” for the body, similar to the title. </li>        <li>Edit rubyweblog\views\posts\show.html.erb and make it look like:          <pre>&lt;p&gt;
  &lt;b&gt;Title:&lt;/b&gt;
  &lt;%=h @post.title %&gt;
&lt;/p&gt;

<b>&lt;p&gt;
  &lt;b&gt;Body:&lt;/b&gt;
  &lt;%=h @post.body %&gt;
&lt;/p&gt;</b>

&lt;%= link_to 'Edit', edit_post_path(@post) %&gt; |
&lt;%= link_to 'Back', posts_path %&gt;</pre>
      </li>

      <li>Use your browser to edit the posts and add bodies. </li>
    </ol>
  </li>
</ul>

<p>Let’s add Clearance authentication:</p>

<p>&#160;</p>

<p>In config/environment.rb:</p>

<pre><code>config.gem &quot;thoughtbot-clearance&quot;, 
  :lib     =&gt; 'clearance', 
  :source  =&gt; 'http://gems.github.com', 
  :version =&gt; '&gt;= 0.5.3'</code></pre>

<p>In config/environments/test.rb:</p>

<pre><code>config.gem 'thoughtbot-shoulda',
  :lib     =&gt; 'shoulda',
  :source  =&gt; &quot;http://gems.github.com&quot;, 
  :version =&gt; '2.10.0'
config.gem 'thoughtbot-factory_girl',
  :lib     =&gt; 'factory_girl',
  :source  =&gt; &quot;http://gems.github.com&quot;, 
  :version =&gt; '&gt;= 1.2.0'</code></pre>

<p>Then:</p>

<pre><code>rake gems:install
rake gems:unpack 
rake gems:install RAILS_ENV=test
rake gems:unpack  RAILS_ENV=test</code></pre>

<pre><code>ruby script/generate clearance</code></pre>

<p>Define a HOST constant in your environments files. In config/environments/test.rb and config/environments/development.rb it can be:</p>

<pre><code>HOST = &quot;localhost&quot;</code></pre>

<p>In production.rb it must be the actual host your application is deployed to. The constant is used by mailers to generate URLs in emails.</p>

<p>In config/environment.rb (outside the ‘do’):</p>

<pre><code>DO_NOT_REPLY = <a href="mailto:donotreply@dialectic.us">donotreply@dialectic.us</a></code></pre>

<p>Migrate Database / to current version</p>

<p>Add this to posts_controller.rb</p>

<pre><code>  before_filter :authenticate, :except =&gt; [:index, :show]
</code></pre>

<p>Confirm that you can view posts but not create them without logging in </p>

<p>To logout enter <a href="http://localhost:3000/sessions/destroy">http://localhost:3000/sessions/destroy</a></p>

<p>If you put “map.logout&#160;&#160;&#160; '/logout',&#160;&#160;&#160; :controller =&gt; 'sessions',&#160; :action =&gt; 'destroy' ” into routes.rb, you can logout with <a href="http://localhost:3000/logout">http://localhost:3000/logout</a></p>

<p>These are some handy routes:</p>

<pre><code>map.register  '/register',  :controller =&gt; 'users',     :action =&gt; 'new'
map.login     '/login',     :controller =&gt; 'sessions',  :action =&gt; 'new'
map.logout    '/logout',    :controller =&gt; 'sessions',  :action =&gt; 'destroy'</code></pre>
