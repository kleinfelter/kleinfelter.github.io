---
excerpt: "I've been messing around with a Deki wiki, and now I'm ready to start using
  it for real.&nbsp; Here's how I set it back to its newly created state.\r\n  \r\n
  \ \r\n  \r\n  \r\n  \r\n  \r\n  <br />\r\n  <br />\r\n  <br />\r\n  <ol>\r\n    <li>cd
  /path/to/your/deki/wiki/root</li>\r\n    <li>cd ./attachments</li>\r\n    <li>rm
  -rf *</li>\r\n    <li>mysql -u root -p</li>\r\n    <ol>\r\n      <li>use db-catalog-name-from-mindtouch.deki.startup.xml;</li>\r\n
  \     <ol>\r\n        <li>Mine is deki-kleinfelter\r\n          \r\n          \r\n
  \         \r\n          \r\n          \r\n          "
categories: []
layout: post
title: Reinitialize a Deki Wiki
created: 1196113239
---
I've been messing around with a Deki wiki, and now I'm ready to start using it for real.&nbsp; Here's how I set it back to its newly created state.
  
  
  
  
  
  
  <br />
  <br />
  <br />
  <ol>
    <li>cd /path/to/your/deki/wiki/root</li>
    <li>cd ./attachments</li>
    <li>rm -rf *</li>
    <li>mysql -u root -p</li>
    <ol>
      <li>use db-catalog-name-from-mindtouch.deki.startup.xml;</li>
      <ol>
        <li>Mine is deki-kleinfelter
          
          
          
          
          
          <br /></li>
      </ol>
      <li>DELETE FROM pages WHERE page_title!='' and page_namespace=0;</li>
      <li>DELETE FROM attachments;</li>
      <li>DELETE FROM comments;</li>
      <li>select user_id, user_name, user_role_id from users;</li>
      <li>You may want to delete some users rows.&nbsp; Do not delete your admin ID or the 'Anonymous' user.&nbsp;&nbsp;
        Me -- I didn't follow this advice. So here's the recovery:</li>
      <ol>
        <li>service dekihost stop</li>
        <li>mysqladmin -p drop database-name-here</li>
        <li>Delete everything from /path/to/deki/wiki/root  
          
          
          <br /></li>
        <li>cd to ~/Deki_Wiki_1.8.1a_Hayes_source</li>
        <li>cp -r web/*&nbsp; /path/to/deki/wiki/root</li>
        <li>chown -R apache /path/to/deki/wiki/root</li>
        <li>service httpd restart
          
          
          <br /></li>
        <li>Browse to http://www.example.com/config/index.php</li>
        <li>Complete and submit the form.
          
          
          <br /></li>
        <li value="8">cd to the config directory under your DocumentRoot (e.g. cd /usr/local/wikis/example.com/config)</li>
        <li>cp LocalSettings.php to your DocumentRoot (e.g. cp LocalSettings.php /usr/local/wikis/example.com/)&nbsp;</li>
        <li>cp AdminSettings.php to your DocumentRoot (e.g. cp AdminSettings.php /usr/local/wikis/example.com/)&nbsp;</li>
        <li>cp mindtouch.host.sh ../bin/</li>
        <li>service dekihost start
          
          <br /></li>
      </ol>
    </ol>
  </ol><!-- google_ad_section_end -->
  <ol>
    <ol>
      <ol></ol>
    </ol>
    <li>If I missed something, please let me know!
      
      
      
      
      
      <br /></li>
  </ol>
