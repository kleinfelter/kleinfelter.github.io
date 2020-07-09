---
excerpt: <p>If you are trying to use the Todoist (<a href="http://www.todoist.com">www.todoist.com</a>)
  API</p>
categories: []
layout: post
title: Using the Todoist API
created: 1240784491
---
<p>If you are trying to use the Todoist (<a href="http://www.todoist.com">www.todoist.com</a>) API</p>
  <ul>
    <li>And you find that your URL works from a web browser (Internet Explorer, Safari, Firefox)</li>
    <li>But it doesn't work via wget or curl</li>
    <li>And you're getting &quot;500 Internal Server Error&quot; in your response</li>
    <li>And some URIs work via wget (e.g. http://todoist.com/API/getProjects?token=fb5f22601ec566e48083213f7573e908a7a272e5 )</li>
    <li>But other URIs fail via wget (e.g. http://todoist.com/API/getProject?project_id=22073&amp;token=fb5f22601ec566e48083213f7573e908a7a272e5 )</li>
  </ul>
  <p>before you blame the Todoist API -- remember that the ampersand must be escaped on the wget/curl command-line.</p>
  <p>wget <a href="http://todoist.com/API/getProject?project_id=22073\&amp;token=fb5f22601ec566e48083213f7573e908a7a272e5">http://todoist.com/API/getProject?project_id=22073\&amp;token=fb5f22601ec566e48083213f7573e908a7a272e5</a></p>
  <p>(I figured this out by using the Fiddler2 debugging proxy. Great tool.)</p>
