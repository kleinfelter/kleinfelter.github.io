---
excerpt: "<ul>\r\n<li> I pushed a Python starter app to GAE, and I confirmed that
  it worked.  Then I pushed a Java starter app to the same GAE application.  I was
  getting the \"Gwt module 'modulenamehere' may need to be (re)compiled\" error.  \r"
categories: []
layout: post
title: Notes On Google App Engine
created: 1269174925
---
<ul>
<li> I pushed a Python starter app to GAE, and I confirmed that it worked.  Then I pushed a Java starter app to the same GAE application.  I was getting the "Gwt module 'modulenamehere' may need to be (re)compiled" error.  
<ul><li>It turns out that when you push an application, it does not replace the old application; it simply pushes the new files, with overwrites where the names are the same and adds where the names are unique.  <li>When you push V2, it pushes all files to V2, but it leaves V1, and V1 remains as the application that is run when you enter http://appnamehere.appspot.com.  <li>You either have to go to the GAE Dashboard and make V2 the default, or enter http://2.latest.appnamehere.appspot.com.  (That's a prefix of version number, plus "latest".)
</ul>
<li> I've been reading lots of complaints about "scaling down" with GAE.  For apps that are run only occasionally, the wall clock time requires to start up a JVM plus a Java framework can be 6+ seconds.  Google says they're doing much of their GAE development with Java, but they don't have to worry about scaling down.  There are several JVM languages I'm interested in (Java, Jython, JRuby, Scala, JavaScript), but I'm going to need quick start-up time until my app becomes popular, so the decision seems to be between JVM and Python.  I don't find the same complaints about Python.  Plus, pyjamas and desktop-pyjamas look interesting, and unlike Ruby, Windows is a first-class platform with Python.
</ul>
