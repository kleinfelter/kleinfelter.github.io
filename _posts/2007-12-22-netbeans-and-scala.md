---
excerpt: "<p>I'm taking a look at Netbeans 6.0 with the new Scala plugin (http://blogtrader.org/page/dcaoyuan/entry/first_experimental_scala_supporting_for).&nbsp;
  When I tried to build a HelloScala app, I received the error &quot;Could not load
  definitions from resource scala/tools/ant/antlib.xml.&quot;</p>\r\n  <p>Setting
  SCALA_HOME in my environment variables appears to not work with Windows Netbeans
  6.0 final and the Scala plugin.\r\n    \r\n    \r\n    <br /></p>"
categories: []
layout: post
title: Netbeans and Scala
created: 1198375602
---
<p>I'm taking a look at Netbeans 6.0 with the new Scala plugin (http://blogtrader.org/page/dcaoyuan/entry/first_experimental_scala_supporting_for).&nbsp; When I tried to build a HelloScala app, I received the error &quot;Could not load definitions from resource scala/tools/ant/antlib.xml.&quot;</p>
  <p>Setting SCALA_HOME in my environment variables appears to not work with Windows Netbeans 6.0 final and the Scala plugin.
    
    
    <br /></p>
  <p>I've got SCALA_HOME=C:\scala in my environment (which is where my Scala lives). I've confirmed it by
starting a Command prompt and typing &quot;set&quot;. Yet I still get the
scala/tools/ant/antlib.xml error.</p>
  <p>However, adding -J-Dscala.home=C:\scala to the end of the
netbeans_default_options string in C:\Program Files\NetBeans
6.0\etc\netbeans.conf resolves the problem.</p>
  <p>I don't speak ant, but I'm betting that the following snippet from build-impl.xml doesn't behave as expected in some cases:</p>
  <p>        &lt;condition property=&quot;scala.home&quot; value=&quot;$&quot;&gt;
    
    
    <br />
            &lt;isset property=&quot;env.SCALA_HOME&quot;/&gt;
    
    
    <br />
        &lt;/condition&gt;</p><hr />
Having solved the Ant problem, I thought I'd build a simple HelloScala app.
  <br />
  <ol>
    <li>Start Netbeans</li>
    <li>Click the New Project icon on the toolbar</li>
    <li>Select Scala</li>
    <li>Press Next&nbsp;</li>
    <li>Project name = ScalaApplication1</li>
    <li>Location = K:\Code (giving Project Folder = K:\Code\ScalaApplication1)</li>
    <li>Create main class = ScalaApplication1.Main</li>
    <li>Press Finish</li>
    <li>Press Shift-F6 to build and run.</li>
    <li>Error message: java.lang.NoClassDefFoundError: ScalaApplication1/Main</li>
    <li>Change &quot;package __PACKAGE_NAME__&quot; to &quot;package ScalaApplication1&quot;
      <br /></li>
    <li>Change &quot;object __CLASS_NAME__&quot; to&quot;object Mail&quot;</li>
    <li>Press Shift-F6 to build and run.</li>
    <li>Success!
      <br /></li>
  </ol>
