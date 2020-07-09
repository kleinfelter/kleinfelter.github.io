---
excerpt: "Here's a better method (better than my first method) for running a multiple
  wiki dekiwiki farm.&nbsp; My first instance was wiki.kleinfelter.org (with DocumentRoot
  /usr/local/wikis/deki-wiki-hayes-kleinfelter.org) and my second will be wiki.kleinfelter.com
  (with DocumentRoot /usr/local/wikis/deki-wiki-hayes-kleinfelter.com).\r\n  \r\n
  \ \r\n  \r\n  <br />\r\n  <br />My wikis run on the same physical host, but with
  different domain names.&nbsp; Here's how I created my second instance.\r\n  \r\n
  \ \r\n  \r\n  <br />\r\n  "
categories: []
layout: post
title: Creating a Second Instance of Dekiwiki (Better Method)
created: 1195840472
---
Here's a better method (better than my first method) for running a multiple wiki dekiwiki farm.&nbsp; My first instance was wiki.kleinfelter.org (with DocumentRoot /usr/local/wikis/deki-wiki-hayes-kleinfelter.org) and my second will be wiki.kleinfelter.com (with DocumentRoot /usr/local/wikis/deki-wiki-hayes-kleinfelter.com).
  
  
  
  <br />
  <br />My wikis run on the same physical host, but with different domain names.&nbsp; Here's how I created my second instance.
  
  
  
  <br />
  <br />Before you start this procedure, you must have at least one instance of the &quot;Hayes&quot; release of Dekiwiki running on your Unix/Linux server.
  
  
  
  
  <br />
  <br />
  <ol>
    <li>cd ~ /Deki_Wiki_1.8.1a_Hayes_source</li>
    <ol>
      <li>Decide where you are going to put your DocumentRoot.&nbsp; (I'm using /usr/local/wikis/deki-wiki-hayes-kleinfelter.com.)&nbsp;</li>
      <li>mkdir /usr/local/wikis/deki-wiki-hayes-kleinfelter.com</li>
      <li>cp -r web/*&nbsp; /usr/local/wikis/deki-wiki-hayes-kleinfelter.com</li>
      <li>chown -R apache /usr/local/wikis/deki-wiki-hayes-kleinfelter.com</li>
    </ol>
    <li>Edit your httpd.conf file (Mine is /usr/local/apache/conf/httpd.conf).</li>
    <ol>
      <li>Copy the entire &quot;&lt;VirtualHost *:80&gt;&quot; section for your first instance and paste it below your existing instance.</li>
      <li>In the newly pasted copy:</li>
      <ol>
        <li>Change ServerName to the dns name of your new instance.&nbsp; (e.g. wiki.kleinfelter.com)&nbsp;</li>
        <li>Change DocumentRoot to your new instance's DocumentRoot. (e.g. DocumentRoot &quot;/usr/local/wikis/deki-wiki-hayes-kleinfelter.com&quot;)</li>
      </ol>
    </ol>
    <li>edit /etc/init.d/dekihost.&nbsp; What you do here will be different, depending on whether you are starting with the dekihost file provided with dekiwiki, or you already have a multi-instance deki wiki running.</li>
    <ol>
      <li>If you are going from one wiki to two wikis, you'll want a dekihost file that looks something <a title="dekitouch config file" href="/files/mindtouch.deki.startup.xml">like this one</a>.&nbsp; Note that your apikey must match your dekihost's apikey.
        
        <br /></li>
      <li>If you are simply adding another instance to a multi-instance setup, just create another 'config id=xxxx' section.</li>
    </ol>
    <li>Restart apache (e.g. service httpd restart)</li>
    <li>Restart dekihost (e.g. service dekihost restart)</li>
    <li>Open a browser to httpd://your-site-example.com/config/index.php.&nbsp; (Use your site's URL.)&nbsp;</li>
    <li>Fill in the blanks and submit the form.&nbsp; Be sure to use a different Site Name, Database Name, and DB username than your other instances!</li>
    <li>cd to the config directory under your DocumentRoot (e.g. cd /usr/local/wikis/example.com/config)</li>
    <li>cp LocalSettings.php to your DocumentRoot (e.g. cp LocalSettings.php /usr/local/wikis/example.com/)&nbsp;</li>
    <li>cp AdminSettings.php to your DocumentRoot (e.g. cp AdminSettings.php /usr/local/wikis/example.com/)&nbsp;</li>
  </ol>UPDATE: Well shoot!&nbsp; That didn't work so well. The problem is that the code is still immature, and I decided that I really need complete independence of my two Deki wikis.&nbsp; This will let me upgrade them independently.&nbsp; I also ran into trouble with lucene when I re-indexed both wikis at the same time (Find/Search started giving error messages).
  <br />
  <br />
  <ol>
    <li>Create /etc/init.d/dekihost and /etc/init.d/dekihost2</li>
    <li>Create /etc/dekiwiki/mindtouch.deki.startup.xml and /etc/dekiwiki/mindtouch.deki2.startup.xml</li>
    <ol>
      <li>Do NOT change deki to deki2 in &quot;&lt;path&gt;deki&lt;/path&gt;&quot;</li>
      <li>Point this to each wiki in the two flavors: &lt;deki-path&gt;/usr/local/wikis/deki-wiki-hayes-kleinfelter.org&lt;/deki-path&gt;</li>
      <li>Update&nbsp; &lt;config <a href="http://www.kleinfelter.org">id=&quot;www.kleinfelter.org&quot;&gt;</a>&nbsp; for each of your wikis</li>
      <li>Ensure that the following is unique per wiki&nbsp; &lt;path.store&gt;/usr/local/var/luceneindex&lt;/path.store&gt; and&nbsp; &lt;path.store&gt;/usr/local/var/luceneindex2&lt;/path.store&gt;</li>
      <li>Point the filter paths at each wiki's code base.
        <br /></li>
    </ol>
    <li>Create a file in vhosts.d for your wiki</li>
    <ol>
      <li>In the second wiki, set both proxy rows to use 8082</li>
    </ol>
    <li><a href="http://mindtouch.host.sh">/usr/local/apache/htdocs/kleinfelter-org/lbin/mindtouch.host.sh:</a>&nbsp; set HTTP_PORT=&quot;8082&quot;
      <br />
      <br /></li>
  </ol>
  <br />
