---
excerpt: "<style>BODY { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }\r\nP { FONT-FAMILY:Tahoma;
  FONT-SIZE:10pt }\r\nDIV { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }\r\nTD { FONT-FAMILY:Tahoma;
  FONT-SIZE:10pt }\r"
categories: []
layout: post
title: Subversion - Import a Directory While Ignoring Some of Its Content
created: 1251677995
---
<style>BODY { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }
P { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }
DIV { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }
TD { FONT-FAMILY:Tahoma; FONT-SIZE:10pt }
</style><basefont face="Tahoma" size="2" />I wanted to add a project to Subversion, but I wanted to ignore some of the directories in the project directory. &nbsp;The standard way to do this would be to add the whole project directory and <u>then</u> set the svn:ignore property to ignore the directories, and then delete them from the repository. &nbsp;But that adds the directories to svn, and delete doesn't really delete, so I wanted better.

  
  <div></div>
  <div>First, my assumptions:</div>
  <ul>
    <li>Your repository URL is <a href="file:///tmp/foo-repo">file:///tmp/foo-repo</a></li>
    <li>Your project directory is project1.</li>
    <li>Your current working directory is project1.</li>
  </ul>
  <div>Here's how:</div>
  <ul>
    <li>svn mkdir -m &quot;Adding just the project1 directory.&quot; &nbsp;<a href="file:///tmp/foo-repo/project1"> file:///tmp/foo-repo/project1</a></li>
    <li>svn co <a href="file:///tmp/foo-repo/project1">file:///tmp/foo-repo/project1</a><strong><font size="4"> .</font></strong></li>
    <ul>
      <li>Don't miss that trailing period!</li>
    </ul>
    <li>Here you have two choices. &nbsp;</li>
    <ul>
      <li>If you want to ignore the directories completely:</li>
      <ul>
        <li>Add the directory names to &quot;svnignores.txt&quot;</li>
        <li>svn propset svn:ignore -F svnignores.txt<strong><font size="4"> .</font></strong></li>
      </ul>
      <li>If you want to ignore the CONTENT of the directories (i.e. to check-in the directories and keep the directory empty in the repository):</li>
      <ul>
        <li>svn propset svn:ignore '*' directoryName1</li>
        <li>svn propset svn:ignore '*' directoryName2</li>
      </ul>
    </ul>
    <li>svn add *</li>
    <li>svn commit -m &quot;Adding the contents of the project1 directory.&quot;</li>
  </ul>
