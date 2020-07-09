---
excerpt: "I'm evaluating Dekiwiki.&nbsp; Since I run multiple wikis, if I convert
  one to Deki, I want to convert them all.&nbsp; My wikis run on the same physical
  host, but with different domainnames.&nbsp; Here's how I created my <strong>second</strong>
  instance.&nbsp; (To create a 3rd instance, substitute &quot;3&quot; for the &quot;2&quot;
  in the appropriate lines.)\r\n  \r\n  \r\n  <br />\r\n  <br />Before you start this
  procedure, you must have at least one instance of the &quot;Hayes&quot; release
  of Dekiwiki running on your Unix/Linux server.\r\n  \r\n  \r\n  <br />\r\n  "
categories: []
layout: post
title: Creating a Second Instance of Dekiwiki
created: 1195594510
---
I'm evaluating Dekiwiki.&nbsp; Since I run multiple wikis, if I convert one to Deki, I want to convert them all.&nbsp; My wikis run on the same physical host, but with different domainnames.&nbsp; Here's how I created my <strong>second</strong> instance.&nbsp; (To create a 3rd instance, substitute &quot;3&quot; for the &quot;2&quot; in the appropriate lines.)
  
  
  <br />
  <br />Before you start this procedure, you must have at least one instance of the &quot;Hayes&quot; release of Dekiwiki running on your Unix/Linux server.
  
  
  <br />
  <br />
  <ol>
    <li>When you installed your first instance, you un-tarred the source somewhere.&nbsp; (I put mine in ~ /Deki_Wiki_1.8.1a_Hayes_source.)&nbsp; cd into that directory. (e.g. cd ~ /Deki_Wiki_1.8.1a_Hayes_source)</li>
    <ol>
      <li>Decide where you are going to put your second instance.&nbsp; This will be your DocumentRoot.&nbsp; I'm using /usr/local/wikis/example.com.Substitute your DocumenRoot in the below commands:</li>
      <li>mkdir /usr/local/wikis/example.com 
        
        
        <br />cp -r web/*&nbsp; /usr/local/wikis/example.com 
        
        
        <br />chown -R apache /usr/local/wikis/example.com
        
        
        <br /></li>
    </ol>
    <li>Edit your httpd.conf file (often found in /usr/local/apache/conf or /etc/httpf/conf).
      
      
      <br /></li>
    <ol>
      <li>Copy the entire &quot;&lt;VirtualHost *:80&gt;&quot; section for your first instance and paste it below your existing instance.</li>
      <li>In the newly pasted copy:</li>
      <ol>
        <li>Change ServerName to the dns name of your new instance.&nbsp; For example, www.example.com.</li>
        <li>Change DocumentRoot to the DocumentRoot you selected above. (e.g. DocumentRoot &quot;/usr/local/wikis/example.com&quot;)</li>
        <li>Change the port number on ProxyPass and ProxyPassReverse to an unused number.&nbsp; I like using the last digit as my instance number. (e.g. My second wiki is on 8082).&nbsp; For the rest of this procedure, '8082' means whatever port you used here.
          
          
          <br /></li>
      </ol>
    </ol>
    <li>edit /etc/init.d/dekihost:</li>
    <ol>
      <li>Make a copy of the DEKI_PATH and the DEKI_SERVERNAME rows, changing the values to suit your new wiki, and adding a single digit (e.g. 2) after PATH and SERVERNAME (e.g. DEKI_PATH2 and DEKI_SERVERNAME2)</li>
      <li>Duplicate the first “su apache” line in both the start and the stop functions</li>
      <li>Make your copied lines reference the names you created above (e.g. DEKI_PATH2 and DEKI_SERVERNAME2, respectively).</li>
      <li>Inside the testDream function, copy and paste the original 7 lines, changing the copy to use the names you created above (e.g. DEKI_PATH2 and DEKI_SERVERNAME2, respectively).&nbsp; Optional: Also change the echo –n “Dream…” to be something like echo –n “Dream2…”.
        
        
        <br /></li>
    </ol>
    <li>Restart apache (e.g. service httpd restart)</li>
    <li>Restart dekihost (e.g. service dekihost restart)</li>
    <li>Open a browser to httpd://your-site-example.com/config/index.php.&nbsp; (Use your site's URL.)
      <br /></li>
    <li>Fill in the blanks and submit the form.&nbsp; Be sure to use a different Site Name, Database Name, and DB username than your other instances!</li>
    <li>cd to the config directory under your DocumentRoot (e.g. cd /usr/local/wikis/example.com/config)</li>
    <li>cp mindtouch.deki.startup.xml /etc/dekiwiki/mindtouch.deki2.startup.xml (substitute your instance number for 2).</li>
    <li>cp LocalSettings.php to your DocumentRoot (e.g. cp LocalSettings.php /usr/local/wikis/example.com/)</li>
    <li>cp AdminSettings.php to your DocumentRoot (e.g. cp AdminSettings.php /usr/local/wikis/example.com/)</li>
    <li>Edit mindtouch.host.sh:</li>
    <ol>
      <li>change SCRIPT= to reference mindtouch.deki2.startup.xml (substitute your instance number).</li>
      <li>Change the HTTP_PORT to match the port number you used in your httpd.conf (above)</li>
      <li>Change the LOGFILE to a unique name (e.g. add a 2)</li>
      <li>Change the PIDFILE to a unique name (e.g. add a 2)
        <br /></li>
    </ol>
    <li>touch /var/log/deki2-api.log (substitute the LOGFILE value you used above)
      <br /></li>
    <li>chown apache /var/log/deki2-api.log (substitute the LOGFILE value you used above)</li>
    <li>cp mindtouch.host.sh /usr/local/wikis/example.com/bin/ (substitute the DocumentRoot portion of the name to match your DocumentRoot)
      <br />
      <br />
      <br /></li>
  </ol>
