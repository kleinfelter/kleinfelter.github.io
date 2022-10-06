---
excerpt: "This is a step-by-step guide to setting up a sandbox/playground for Melody
  1.0.2 on OS X 10.7.1 (Lion).  This will give you a working Melody (Movable Type
  fork) installation, suitable for learning and experimentation and NOT a production-ready
  site.\r\n\r\nNote: I assume that you don't have other web sites running on your
  Mac, and that you want Melody to be your primary site, accessible at http://localhost:80/index.html.
  \  If your user ID isn't \"kevin\", substitute your user ID for \"kevin\".\r\n\r\n\r\nPrerequisites:
  \ You must have the following installed:\r\n<ol>\r"
categories: []
layout: post
title: Installing a Melody Sandbox On OS X Lion
created: 1315775366
---
This is a step-by-step guide to setting up a sandbox/playground for Melody 1.0.2 on OS X 10.7.1 (Lion).  This will give you a working Melody (Movable Type fork) installation, suitable for learning and experimentation and NOT a production-ready site.

Note: I assume that you don't have other web sites running on your Mac, and that you want Melody to be your primary site, accessible at http://localhost:80/index.html.   If your user ID isn't "kevin", substitute your user ID for "kevin".


Prerequisites:  You must have the following installed:
<ol>
<li>XCode (the Apple development environment)
<li>SQLite
<li>The following Perl modules.   (Install by entering "sudo cpan module name".)
   <ul>
    <li>DBD::mysql
    <li>IPC::Run
    <li>Crypt::SSLeay
    <li>IO::Uncompress::Gunzip
    <li>IO::Compress::Gzip
    <li>Mail::Sendmail
    <li>Crypt::DSA
   </ul>
 <li>These packages:
   <ul>
    <li>JPEG library -- See "Install LibJPEG" section of http://www.beausmith.com/mt/2009/05/install-movable-type-on-a-mac.php for details.
    <li>PNG library -- Install by entering "sudo port install libpng"
    <li>TIFF library -- See "Install lib tiff" section of http://www.beausmith.com/mt/2009/05/install-movable-type-on-a-mac.php for details.
   </ul>
<li>ImageMagick -- Install by entering "sudo port install imagemagick +perl"
      <ul><li>I couldn't get www.beausmith.com's instructions to give a working ImageMagick plus working Perl modules.</ul>
</ol>
<p>
Instructions:
<ul>
   <li>Download the zip file from http://openmelody.org/download-melody. I got Melody 1.0.2.  If they've come out with something newer, that's what you'll get.
   <li>Go to /Library/WebServer/Documents, and delete everything except the postgresql folder.  (You can delete that too, if you don't want it for some other purpose.)
   <li>Edit /etc/apache2/httpd.conf, and un-comment the LoadModule for libphp5.so.  i.e. Ensure it contains a line "LoadModule php5_module libexec/apache2/libphp5.so".  Note that if you've got the original version of this file, you'll just have to remove a leading "#" from a line which otherwise matches this.
   <li>mkdir -p ~/Sites/melodemo/conf
   <li>touch ~/Sites/melodemo/conf/httpd.conf
   <li>sudo ln -s /Users/kevin/Sites/melodemo/conf/httpd.conf /etc/apache2/other/kevin-melodemo.conf
      <ul><li>Note that after this point, when these instructions refer to httpd.conf, they're referring to /Users/kevin/Sites/melodemo/conf/httpd.conf unless they specifically name /etc/apache2/httpd.conf. </ul>
   <li>mkdir ~/Sites/melodemo/htdocs
   <li> mkdir ~/Sites/melodemo/htdocs/blog1
   <li>chmod ugo+rwx ~/Sites/melodemo/htdocs/blog1
   <li>mkdir ~/Sites/melodemo/cgi
   <li>mkdir ~/Sites/melodemo/db
   <li>chmod ugo+rwx ~/Sites/melodemo/db
   <li>Edit httpd.conf, and make it contain this:
</ul>
<pre><code>
&lt;VirtualHost *:80>
    ServerName macbook.local
    ServerAlias localhost
    DocumentRoot /Users/kevin/Sites/melodemo/htdocs
    DirectoryIndex index.html
    &lt;Directory /Users/kevin/Sites/melodemo/htdocs>
        Order allow,deny
        Allow from all
        AllowOverride All
        Options Indexes FollowSymLinks MultiViews
        AddHandler application/x-httpd-php .php .html
    &lt;/Directory>
&lt;/VirtualHost>

ScriptAlias /cgi/ /Users/kevin/Sites/melodemo/cgi/
Alias /static/ /Users/kevin/Sites/melodemo/htdocs/mt-static/

AllowEncodedSlashes On

&lt;Directory "/Users/kevin/Sites/melodemo/cgi">
    AllowOverride All
    Options None
    Order allow,deny
    Allow from all
    Options FollowSymLinks
&lt;/Directory>
&lt;Directory "/Users/kevin/Sites/melodemo/htdocs">
    AllowOverride All
    Options +Indexes
    Order allow,deny
    Allow from all
    Options FollowSymLinks
&lt;/Directory>
SetEnv PERL5LIB /opt/local/lib/perl5/site_perl/5.12.3/darwin-multi-2level:/opt/local/lib/perl5/site_perl/5.12.3
#SetEnv MAGICK_HOME /usr/local/ImageMagick-6.4.0
#SetEnv DYLD_LIBRARY_PATH /usr/local/ImageMagick-6.4.0/lib
</code></pre>

<ul>
   <li>Run "perldoc perllocal" to see where it installed your Perl libraries.  Probably something like "/opt/local/lib/perl5/site_perl/5.12.3".
   <li>Update the SetEnv for PERL5LIB to include your Perl libraries.
   <li>sudo apachectl configtest
   <li>sudo apachectl restart
   <li>Create a sample ~/Sites/melodemo/htdocs/index.html and make sure you can browse it via http://localhost/index.html.  Then delete the file.
   <li>open (double-click) Melody-v1.0.2.zip in your Downloads folder.  This will create a folder named Melody-v1.0.2.
   <li>Copy the *contents* of Melody-v1.0.2 into ~/Sites/melodemo/cgi
   <li>Move the *folder* ~/Sites/melodemo/cgi/mt-static to ~/Sites/melodemo/htdocs/
   <li>chmod go+rwx mt-static/
   <li>chmod go+rwx mt-static/support/
   <li>Copy ~/Sites/melodemo/cgi/config.cgi-original to config.cgi
   <li>Make the following changes to config.cgi:
   <ul>
      <li>Change CGIPath to point to http://localhost/cgi/
      <li>Change StaticWebPath to point to http://localhost/static/
      <li>Add an entry: "StaticFilePath   /Users/kevin/Sites/melodemo/htdocs/mt-static"
      <li>Comment out the entries for PostgreSQL and mysql
      <li>Change the SQLite Database to point to /Users/kevin/Sites/melodemo/db/data
   </ul>
   <li>Browse to http://localhost/cgi/check.cgi
   <li>Everything should report success, except possibly "DBD::SQLite2"
   <li>Configure Melody:
      <ul>
      <li>Set up an Administrator account.  Browse to http://localhost/cgi/index.cgi and enter:
         <ul>
         <li>Username: administrator
         <li>Display Name: The Administrator
         <li>Email Address: administrator@example.com
         <li>Password: password
         <li>Password confirm: password
         <li>Submit the form, and continue.
      </ul>
      <li>Set up a blog.  Enter:
         <ul>
         <li>Blog Name: My First Blog
         <li>Blog URL: http://localhost/blog1/
         <li>Publishing Path: /Users/kevin/Sites/melodemo/htdocs/blog1
         <li>Template Set: (whatever you like)
         <li>Timezone: (as appropriate for your time zone)
         <li>Submit the form
    </ul>
  </ul>
   <li>Once you get a page with "Installation complete!", click "Sign in to Melody".
   <li>You'll get a "Time to Upgrade!" page. Click on "Begin Upgrade"
   <li>Sign in as administrator
   <li>When you get "Upgrade complete!", click on "Return to Melody"
   <li>Click on the "Write your first post" link, and create something.
</ul>
 
At this point, http://localhost/cgi/index.cgi shows you the admin interface and http://localhost/blog1 shows you the non-logged-in user interface.
