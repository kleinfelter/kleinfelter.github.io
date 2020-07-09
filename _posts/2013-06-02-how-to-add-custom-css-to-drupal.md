---
categories: []
layout: post
title: How to Add Custom CSS to Drupal
created: 1370209336
redirect_from: /content/how-add-custom-css-drupal
---
I wanted to do some custom styling on a Drupal page.  Since I use Markdown, I couldn't just add CSS to the page's HTML.  I needed to tell Drupal to make a CSS file available.

* Edit themename.info and add 

    stylesheets[all][] = kpk-custom/kpk.css

* Put stylesheets in /blah/sites/drupal/kpk-custom
* cd to theme dir and

    ln -s /blah/sites/drupal/kpk-custom kpk-custom

Login to the site as admin, choose Configuration from the admin toolbar, then Performance, then Clear All Caches.
