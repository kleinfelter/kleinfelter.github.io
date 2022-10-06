---
excerpt: "Collected from many different sources...\r\n  \r\n  <br />\r\n  <ul>\r\n
  \   <li>Run Cygwin's setup.exe&nbsp; <a href=\"http://www.cygwin.com/setup.exe\">http://www.cygwin.com/setup.exe</a>
  and add the repository for Cygwin Ports -- <a href=\"ftp://sunsite.dk/projects/cygwinports\">ftp://sunsite.dk/projects/cygwinports</a></li>\r\n
  \   <ul>\r\n      <li>Select Cygwin's Ruby package (you'll get a 1.8.x release)\r\n
  \       \r\n        "
categories: []
layout: post
title: Ruby, Cygwin, Sqlite, Gems
created: 1225718082
---
Collected from many different sources...
  
  <br />
  <ul>
    <li>Run Cygwin's setup.exe&nbsp; <a href="http://www.cygwin.com/setup.exe">http://www.cygwin.com/setup.exe</a> and add the repository for Cygwin Ports -- <a href="ftp://sunsite.dk/projects/cygwinports">ftp://sunsite.dk/projects/cygwinports</a></li>
    <ul>
      <li>Select Cygwin's Ruby package (you'll get a 1.8.x release)
        
        <br /></li>
    </ul>
    <ul>
      <li>From the Databases category, add libsqlite3-devel and sqlite3</li>
      <li>Complete Cygwin's setup.exe</li>
    </ul>
    <li>From a bash shell:</li>
    <ul>
      <li>Ensure that RUBYOPT is set to nothing</li>
      <li>Install Rubygems</li>
      <ul>
        <li>Download the tar file from http://rubyforge.org/frs/?group_id=126</li>
        <li>tar -zxvf rubygems-1.3.1.tgz</li>
        <li>cd rubygems-1.3.1</li>
        <li>ruby setup.rb
          
          <br /></li>
      </ul>
      <li>&nbsp;gem install sqlite3-ruby&nbsp;</li>
    </ul>
  </ul>Note: If you also have Windows Ruby installed, you'll need to ensure that your Cygwin environment variables (including PATH) reference the Cygwin edition and not the Windows edition.&nbsp; The two editions are NOT compatible due to the binary parts of some gems and the path separator differences.
  <br />
  <br />
