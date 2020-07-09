---
categories: []
layout: post
title: Access Error Declaring db as Database
created: 1422397590
redirect_from: /content/access-error-declaring-db-database
---
Microsoft Access sometimes throws a compile error, "Expected user-defined type, not project" if you do something like:

    Dim db As Database

It doesn't recognize "Database" as the built-in type that it is.  This is because of an incredible stupidity in Access.  When you create a new Access database, it creates a 'project,' and it names that project "Database".  So when you attempt to use the built-in type "Database", it thinks you're referring to the project.

You have to rename the project to something besides Database (and don't name it Integer or String!)  

* In the left-side frame of the VBA window, you'll see "Project - Database" near the top.  
* Under that, you'll see "Database (your-file-name-here)".  
* Click on "Database (your-file-name-here)".  
* Farther down the page you'll see "(Name) Database".  
* Change that to "(Name) Anything-besides-Database".
