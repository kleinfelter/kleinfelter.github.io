---
excerpt: "<ol>\r\n    <li>Change the site title (and the title of the home page) via
  Tools/Control Panel (log-in as the site administrator) \r\n      \r\n      \r\n
  \     \r\n      \r\n      \r\n      "
categories: []
layout: post
title: Customizing a Dekiwiki Instance
created: 1195599095
---
<ol>
    <li>Change the site title (and the title of the home page) via Tools/Control Panel (log-in as the site administrator) 
      
      
      
      
      
      <br /></li>
    <li>If you imported from a MoinMoin wiki, you'll want to copy (and clean-up) your Front Page into the site default page.</li>
    <li>Replace the Mindtouch logo in the upper-left corner. Select Tools/Control Panel/Visual Appearance</li>
    <li>Remove the Mindtouch logo in the lower-left corner. On the server, vi includes/Skin.php and search for function getPoweredBy.&nbsp; Change the function to return the empty string.</li>
    <li>You can edit the help URL by adding to LocalSettings.php. a line resembling: $wgHelpUrl = 'http://www.kleinfelter.org/Help_on_Using_the_Wiki';
      
      
      <br /></li>
  </ol>
