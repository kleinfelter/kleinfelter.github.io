---
excerpt: "I wanted to upgrade a Drupal 5 blog to Drupal 7.  Drupal does not support
  skipping versions.  For bonus points, I moved it from one Linux host to another.
  \ For more bonus points, I moved to a multi-site with one Drupal installation.   Here's
  how I 'convinced' it.  (It's a hack.)\r\n<p>\r\nMy source database is named drupal5.
  \ My destination database is named drupal7_personal.  The user ID for drupal5 is
  drupal5 and the user ID for drupal7_personal is drupal7_personal.  (I'm not very
  creative about names.)\r\n<p>\r\n<h3>On the TARGET Server</h3>\r\n<ul>\r\n"
categories: []
layout: post
title: Upgrading a Drupal 5 Blog to Drupal 7
created: 1319332139
---
I wanted to upgrade a Drupal 5 blog to Drupal 7.  Drupal does not support skipping versions.  For bonus points, I moved it from one Linux host to another.  For more bonus points, I moved to a multi-site with one Drupal installation.   Here's how I 'convinced' it.  (It's a hack.)
<p>
My source database is named drupal5.  My destination database is named drupal7_personal.  The user ID for drupal5 is drupal5 and the user ID for drupal7_personal is drupal7_personal.  (I'm not very creative about names.)
<p>
<h3>On the TARGET Server</h3>
<ul>
<li>sudo apt-get install apache2 php5-mysql libapache2-mod-php5 mysql-server php5-gd
<li>mkdir ~/sites
<li>Download Drupal v7.x from http://drupal.org/project/drupal.  When I wrote this it was http://ftp.drupal.org/files/projects/drupal-7.8.tar.gz
<li>extract into ./drupal-7.8
<li>mkdir ~/sites/drupal-7.8
<li>mv ./drupal-7.8/* ./drupal-7.8/.htaccess ~/sites/drupal-7.8
<li>rm -rf ./drupal-7.8
<li>touch ~/sites/drupal.httpd.conf
<li>cd ~/sites
<li>ln -s drupal-7.8 drupal
<li>export APACHEUSER=www-data
<li>mkdir -p ~/sites/drupal/sites/default/files
<li>mkdir -p ~/sites/drupal/sites/personal/files
<li>cp ~/sites/drupal/sites/default/default.settings.php ~/sites/drupal/sites/default/settings.php
<li>chmod 666 ~/sites/drupal-7.8/install.php
<li>chmod 777 ~/sites/drupal-7.8/sites/*/files
<li>chmod 666 ~/sites/drupal-7.8/sites/default/settings.php
<li>mysqladmin -u root -p create drupal7
  <ul>
    <li>I store root's mysql password in LastPass under 'mysql'.
  </ul>
<li>mysqladmin -u root -p create drupal7_personal
<li>mysqladmin -u root -p create drupal5
<li>mysql -u root -p
<code><pre>
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON drupal7.* TO 'drupal7'@'localhost' IDENTIFIED BY 'see-mysql-in-lastpass';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON drupal7_personal.* TO 'drupal7_personal'@'localhost' IDENTIFIED BY 'see-mysql-in-lastpass';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON drupal5.* TO 'drupal5'@'localhost' IDENTIFIED BY 'see-mysql-in-lastpass';
</pre></code>
<li>Check that /etc/apache2/httpd.conf has mod_rewrite enabled.  If not,
    <ul>
    <li>sudo a2enmod rewrite
    </ul>
<li>sudo ln -s /home/$LOGNAME/sites/drupal.httpd.conf /etc/apache2/sites-enabled/001-drupal
<li>edit /etc/php5/apache2/php.ini and change 
    <ul>
        <li>upload_max_filesize from 2M to 100M
        <li> post_max_size from 8M to 100M
    </ul>
<li>edit ~/sites/drupal.httpd.conf and make it look the way you want it.  Here's something to get you started.
<code><pre>
&lt;VirtualHost localhost:80>
        ServerAdmin webmaster@localhost
        DirectoryIndex index.php index.html
        DocumentRoot /home/your-name-here/sites/drupal
        &lt;Directory />
                Options FollowSymLinks
                AllowOverride None
        &lt;/Directory>
        &lt;Directory /home/your-name-here/sites/drupal/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        &lt;/Directory>

        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
        &lt;Directory "/usr/lib/cgi-bin">
                AllowOverride None
                Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
                Order allow,deny
                Allow from all
        &lt;/Directory>

        ErrorLog ${APACHE_LOG_DIR}/drupal.error.log
        LogLevel warn

        CustomLog ${APACHE_LOG_DIR}/drupal.access.log combined
&lt;/VirtualHost>
</pre></code>
<li>sudo apachectl restart
<li>Browse to http://localhost/robots.txt and confirm that you can fetch it.  This ensures that your httpd.conf is at least somewhat right.
<li>Browse to http://localhost/install.php
<li>Complete the install taking the simple/standard route.  DB name should be 'drupal7'. This creates your 'prototype' drupal.  <b>Do not use this Drupal instance.</b>
<li>Add appropriate entries to /etc/hosts for your Drupal sites.  Something like:
<code><pre>
127.0.0.1       personal.com.local
127.0.0.1       www.personal.com.local
</pre></code>
<li>Add the entries to drupal.httpd.conf to support your Drupal sites.  Repeat something similar to the following, for each site.
<code><pre>
&lt;VirtualHost *:80>
        ServerAdmin drupal-webmaster@kevin.your_site.com
        DirectoryIndex index.php index.html
        DocumentRoot /home/kevin/sites/drupal
        &lt;Directory />
                Options FollowSymLinks
                AllowOverride None
        &lt;/Directory>
        &lt;Directory /home/kevin/sites/drupal/>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        &lt;/Directory>
        ServerName your_site.com
        ServerAlias www.your_site.com
        RewriteEngine On
        RewriteOptions inherit
        ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
        &lt;Directory "/usr/lib/cgi-bin">
                AllowOverride None
                Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
                Order allow,deny
                Allow from all
        &lt;/Directory>
        ErrorLog /var/log/drupal.personal.error.log
        LogLevel warn
        CustomLog /var/log/drupal.personal.access.log combined
&lt;/VirtualHost>
</pre></code>
<li>sudo apachectl restart
<li>cd ~/sites/drupal/sites
<li>cp example.sites.php sites.php
<li>Edit sites.php, creating an entry similar to the following, mapping URL host name to the sub-directory in 'sites' for that Drupal instance.
    <ul>
    <li>$sites['personal.com.local'] = 'personal';
    <li>$sites['www.personal.com.local'] = 'personal';
    </ul>
<li>cp -a  default/*  personal/
<li>edit personal/settings.php
    <ul>
    <li>Find the active "$databases = array" and edit it for your personal blog site.  Leave the name of the connection at 'default'
    <li>Copy/paste the 'default' entry, and set one up for 'legacy' and your drupal5 db.
    <li>The resulting section should resemble:
<code><pre>
$databases = array (
  'default' =>
  array (
    'default' =>
    array (
      'database' => 'drupal7_personal',
      'username' => 'drupal7_personal',
      'password' => 'your-password-here',
      'host' => 'localhost',
      'port' => '',
      'driver' => 'mysql',
      'prefix' => '',
    ),
  ),

    'legacy' =>  array (
    'default' =>
    array (
      'database' => 'drupal5',
      'username' => 'drupal5',
      'password' => 'your-password-here',
      'host' => 'localhost',
      'port' => '',
      'driver' => 'mysql',
      'prefix' => '',
    ),
  ),

);
</pre></code>
    </ul>
<li>Browse to http://personal.com.local/install.php
<li>Complete the install taking the simple/standard route.  DB name should be 'drupal7_personal'.</b>
<li>Immediately create a second user, and make this user a <b>not-Administrator.  Do NOT skip this step.</b>  This user will wind up as the nominal author for all your imported nodes.
</ul>
So now you've got an empty, personal blog in Drupal 7.  It is time to start working on actually migrating your data.
<h3>
On the Drupal 5 (source) server:
</h3>
<ul>
<li>Download backup_migrate 5.x from drupal.org.  When I wrote this, it was http://ftp.drupal.org/files/projects/backup_migrate-5.x-1.3.tar.gz
<li>Install backup_migrate, following standard Drupal 5 module install processes.
<li>Browse to http://www.old-site-here.com/admin/content/backup_migrate, and download a backup, excluding all cache*, sessions, and users tables completely.
<li>gunzip your downloaded file.  For the remainder of this document, I'll assume you gunzipped into old-site.sql. 
<li>Note that if you downloaded old-site.sql to your LOCAL machine, you'll have to push it to your TARGET machine.
</ul>
<h3>On the Target server</h3>
<ul>
<li>Edit old-site.sql and add a "use drupal5;" line to the beginning.
<li>mysql -u drupal5 -p &lt; old-site.sql
<li>Install the devel module from http://ftp.drupal.org/files/projects/devel-7.x-1.2.tar.gz following standard module install processes.
<li>mkdir ~/sites/drupal/modules/drupal5_blog_import
<li>cd ~/sites/drupal/modules/drupal5_blog_import
<li>Create a file named drupal5_blog_import.info, containing:
<code><pre>
name = Drupal5 Blog Import
description = Module to import from Drupal5.
core = 7.x
files[] = drupal5_blog_import.module
</pre></code>
<hr>
<li>Create a file named drupal5_blog_import.module, containing:
<code><pre>

&lt;?php
/**
 * @file
 * Originally from http://quicksketch.org/node/5739.
 * Modified by Kevin Kleinfelter to import blog posts and their comments from Drupal 5 into Drupal 7.
 */

function drupal5_blog_import_menu() {
  $items = array();
  $items['admin/content/drupal5-blog-import'] = array(
    'title' => 'Drupal5 Blog Import',
    'description' => 'Migrate a blog from Drupal 5 to Drupal 7.',
    'page callback' => 'drupal_get_form',
    'page arguments' => array('drupal5_blog_import_form'),
    'access arguments' => array('administer site configuration'),
  );
  return $items;
}

function drupal5_blog_import_form() {
  drupal_set_message('Are you sure you want to run the Drupal 5 import script?  No going back without reinitializing the database!', 'warning');
  $form['submit'] = array( '#type' => 'submit', '#value' => t('Start import'),);
  return $form;
}

function drupal5_blog_import_form_submit($form, &$form_state) {
  $batch = array(
    'title' => t('Importing data'),
    'operations' => drupal5_blog_import_batch_operations(),
    'finished' => 'drupal5_blog_import_batch_finished',
  );
  batch_set($batch);
}

function drupal5_blog_import_batch_operations() {
  $operations = array();

  // I don't know why, but batch_files(2) must not be immediately
  // after batch_files(1) or you wind up with only partial values population by batch_files(1).
  // And collapsing them into a single step has the same problem.
  $operations[] = array('drupal5_blog_import_batch_files', array(1));
  $operations[] = array('drupal5_blog_import_batch_nodes', array());
  $operations[] = array('drupal5_blog_import_batch_comments', array());
  $operations[] = array('drupal5_blog_import_batch_files', array(2));

  return $operations;
}

function drupal5_blog_import_batch_finished($success, $results, $operations) {
  if ($success) {
    $message = t('Import finished successfully.');
  }
  else {
    $message = t('Finished with an error.');
  }
  drupal_set_message($message);
}

function drupal5_blog_import_batch_files($pass, &$context) {
  db_set_active('legacy');

  if (empty($context['sandbox'])) {
    $query = db_select('files');
    $query->addExpression('COUNT(fid)', 'count');
    $max = $query->execute()->fetchField();

    $context['sandbox'] = array( 'progress' => 0, 'current_file' => 0, 'max' => $max,);
  }

  $query = db_select('files', 'f');
  $query->innerJoin('node', 'n', 'f.nid = n.nid');
  $query->fields('f');
  $query->fields('n', array('created'));
  $query->orderBy('f.nid', 'asc');
  $query->condition('fid', $context['sandbox']['current_file'], '>');
  $result = $query->execute();

  db_set_active('default');
  $oldnid = -1;
  foreach ($result as $row) {
    if ($oldnid != $row->nid) {
      $delta = 0;
    }
    else {
      $delta = $delta + 1;
    }

    $file = (object) array(
      'fid' => $row->fid,
      'uid' => 2,
      'filename' => $row->filename,
      'uri' => 'public://' . str_replace('files/', '', $row->filepath),
      'filemime' => $row->filemime,
      'filesize' => $row->filesize,
      'status' => 1,
      'timestamp' => $row->created,
    );

    $fileref = (object) array(
      'fid' => $row->fid,
      'module' => 'file',
      'type' => 'node',
      'id' => $row->nid,
      'count' => 1,
    );

    $fielddata = (object) array(
      'entity_type' => 'node',
      'bundle' => 'blog',
      'deleted' => 0,
      'entity_id' => $row->nid,
      'revision_id' => $row->nid,
      'language' => LANGUAGE_NONE,
      'delta' => $delta,
      'field_page_file_fid' => $row->fid,
      'field_page_file_display' => 1,
    );

    $fieldrev  = (object) array(
      'entity_type' => 'node',
      'bundle' => 'blog',
      'deleted' => 0,
      'entity_id' => $row->nid,
      'revision_id' => $row->nid,
      'language' => LANGUAGE_NONE,
      'delta' => $delta,
      'field_page_file_fid' => $row->fid,
      'field_page_file_display' => 1,
    );
    if ($pass == 1) {
      drupal_write_record('file_managed', $file);
      drupal_write_record('file_usage', $fileref);
    }
    if ($pass == 2) {
      drupal_write_record('field_revision_field_page_file', $fieldrev); // ?
      drupal_write_record('field_data_field_page_file', $fielddata);
    }
    $context['message'] = t('Importing file @name', array('@name' => $file->filename));
    $context['sandbox']['current_file'] = $row->fid;
    $context['sandbox']['progress']++;

    $oldnid = $row->nid;
  }


  if ($context['sandbox']['progress'] != $context['sandbox']['max']) {
    $context['finished'] = $context['sandbox']['progress'] / $context['sandbox']['max'];
  }
}

function drupal5_blog_import_batch_nodes(&$context) {
  db_set_active('legacy');

  // Build the total import count.
  if (empty($context['sandbox'])) {
    $query = db_select('node');
    $query->condition('type', array('feed', 'feed_item', 'page'), 'NOT IN');
    $query->addExpression('COUNT(nid)', 'count');
    $max = $query->execute()->fetchField();

    $context['sandbox'] = array( 'progress' => 0, 'current_node' => 0, 'max' => $max,);
  }

  $query = db_select('node', 'n');
  $query->join('node_revisions', 'nr', 'nr.vid = n.vid');
  $query->orderBy('n.nid', 'asc');
  $query->fields('n');
  $query->fields('nr', array('body', 'teaser', 'format'));
  $query->condition('n.nid', $context['sandbox']['current_node'], '>');
  $query->condition('n.type', array('feed', 'feed_item', 'page'), 'NOT IN');
  $result = $query->execute();

  foreach ($result as $row) {
    $node = (object) array(
      'type' => $row->type == 'story' ? 'article' : $row->type,
      'nid' => $row->nid,
      'vid' => $row->vid,
      'uid' => 2,
      'status' => $row->status,
      'language' => LANGUAGE_NONE,
      'created' => $row->created,
      'changed' => $row->changed,
      'comment' => $row->comment,
      'promote' => $row->promote,
      'title' => $row->title,
      'body' => array(LANGUAGE_NONE => array(array('value' => $row->body, 'summary' => $row->teaser, 'format' => 'full_html'))),
      'teaser' => $row->teaser,
      'log' => '',
    );

    db_set_active('legacy');
    $query = db_select('file_revisions', 'fr');
    $query->fields('fr');
    $query->condition('fr.vid', $row->vid);
    $file_results = $query->execute();
    foreach ($file_results as $file) {
      if ($file->fid) {
        $node->field_files[LANGUAGE_NONE][] = array('fid' => $file->fid, 'display' => $file->list, 'description' => $file->description);
      }
    }

    db_set_active('default');
    drupal_write_record('node', $node);
    drupal_write_record('node_revision', $node);
    node_save($node);

    $context['message'] = t('Importing node @title', array('@title' => $node->title));
    $context['sandbox']['current_node'] = $row->nid;
    $context['sandbox']['progress']++;
  }

  db_set_active('default');
  if ($context['sandbox']['progress'] != $context['sandbox']['max']) {
    $context['finished'] = $context['sandbox']['progress'] / $context['sandbox']['max'];
  }
}

function drupal5_blog_import_batch_comments(&$context) {
  $previous_db = db_set_active('legacy');

  if (empty($context['sandbox'])) {
    $query = db_select('comments');
    $query->addExpression('COUNT(cid)', 'count');
    $max = $query->execute()->fetchField();

    $context['sandbox'] = array( 'progress' => 0, 'current_comment' => 0, 'max' => $max,);
  }

  $query = db_select('comments', 'c');
  $query->fields('c');
  $query->orderBy('c.cid', 'asc');
  $query->condition('cid', $context['sandbox']['current_comment'], '>');
  $result = $query->execute();

  db_set_active('default');
  foreach ($result as $row) {
    $comment = (object) $row;
    $comment->language = LANGUAGE_NONE;
    $comment->status = (int) !$row->status; // Flipped between D6 and D7.
    $comment->created = $row->timestamp;
    $comment->changed = $row->timestamp;
    $comment->comment_body[LANGUAGE_NONE][0] = array('value' => $row->comment, 'format' => 'filtered_html');

    drupal_write_record('comment', $comment);
    comment_save($comment);

    $context['message'] = t('Importing comment @subject', array('@subject' => $comment->subject));
    $context['sandbox']['current_comment'] = $row->cid;
    $context['sandbox']['progress']++;
  }

  if ($context['sandbox']['progress'] != $context['sandbox']['max']) {
    $context['finished'] = $context['sandbox']['progress'] / $context['sandbox']['max'];
  }
}
</pre></code>
<li>Browse to your new Drupal's Modules page, and enable the Blog,  Devel, and 'Drupal5 Blog Import' modules.
<li>Browse to your new Drupal's Structure/Content-Types/Blog-entry/Manage-Fields page, and add a new field:
    <ul>
    <li>Label: Attachments
    <li>Name: page_file
    <li>Type: File
    <li>Widget: File
    </ul>
<li>Save
    <ul>
    <li>Enable Display field 
    <li>Files displayed by default
    </ul>
<li>Save
    <ul>
    <li>Allow extensions that suit you.  Note that this impacts adding files via the UI, and not via the import module.
    <li>I'm allowing: bzip gif gz java jpeg jpg png rar tar tgz txt xml zip 7z
    <li>Enable description field
    <li>Number of values: Unlimited
    <li>Enable display field
    <li>Files displayed by default
    </ul>
<li>Save
<li>Browse to http://personal.com.local/#overlay=%3Fq%3Dadmin/content/drupal5-blog-import
<li>Start Import
<li>One way or another, copy the files from your source server to your target server.  Your source files may be in something like src:/usr/local/drupal/files and your target will be something like dest:/home/your-name-here/sites/drupal/sites/personal/files
<li>Helpful tip for creating a tarball: cd /usr/local/drupal ; tar cvf backup.tar files
<li>sudo chown www-data ~/sites/drupal/sites/personal/files/*
<li>sudo chmod 644 ~/sites/drupal/sites/personal/files/*
<li>Run this SQL as drupal7_personal:
<code><pre>
INSERT INTO `node_comment_statistics` (`nid`, `cid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) SELECT nid, 0, UNIX_TIMESTAMP(), NULL, 1, 0 FROM node;
</pre></code>
<li>chmod 644 ~/sites/drupal/sites/*/settings.php
<li>Browse to Configuration/Development/Performance and Clear All Caches.  If you don't do this, SOME of your pages may not show their attachments.
</ul>
Now test your new site.
