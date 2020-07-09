---
layout: post
title: Do Not Use the Default ruby and Do Not sudo gem install
---
Don't use the default ruby on Mac OS X.

Don't run "sudo gem install gemname_here".

Sooner or later, you will need multiple versions of ruby.

Sooner or later, you will need multiple versions of a gem.

Use chruby and ruby-install to manage different versions of ruby.  Create a ~/.ruby-version to specify your default ruby version.

Use bundler to put your gems into your project folder instead of the global OS X folder.

