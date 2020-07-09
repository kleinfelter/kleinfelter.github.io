---
excerpt: "<p>Once in a while, I'll search my web site / blog and the search will fail,
  even though I know the term exists in a page.&nbsp; Here's some information on Drupal
  page indexing.</p>"
categories: []
layout: post
title: Drupal Indexing
created: 1220549723
---
<p>Once in a while, I'll search my web site / blog and the search will fail, even though I know the term exists in a page.&nbsp; Here's some information on Drupal page indexing.</p>
  <ol>
    <li>You get your pages indexed whenever someone fetches <a href="http://yoursite/cron.php">http://yoursite/cron.php</a>.&nbsp; If nobody fetches cron.php, your site never updates its index.</li>
    <li>Normally, you'll use wget to fetch cron.php from your crontab.&nbsp; Doesn't matter whose crontab, or even what machine the cron is executed from, so long as you fetch <a href="http://yoursite/cron.php">http://yoursite/cron.php</a></li>
    <li>On <a href="http://yoursite/admin/settings/search">http://yoursite/admin/settings/search</a>&nbsp;you have the ability to throttle how many of your pages get indexed each time cron.php is fetched.&nbsp; You also have a button that claims to rebuild your index.&nbsp; The button doesn't.&nbsp; It just purges your index.&nbsp; If you have 100 pages, and you index 20 pages on each fetch of cron.php, after you press the button, you have to wait through 10 fetches of cron.php before all 100 pages are indexed.</li>
  </ol>
  <p>So, if you're getting misses in your searches:</p>
  <ol>
    <li>Visit <a href="http://yoursite/admin/settings/search"><u><font color="#0000ff">http://yoursite/admin/settings/search</font></u></a>&nbsp;and see how many pages are not yet indexed.</li>
    <li>If there are un-indexed pages, fetch <a href="http://yoursite/cron.php"><u><font color="#0000ff">http://yoursite/cron.php</font></u></a> via your web browser, and re-load <a href="http://yoursite/admin/settings/search"><u><font color="#0000ff">http://yoursite/admin/settings/search</font></u></a>&nbsp;to see if you now have 0 un-indexed pages.</li>
    <li>Check your crontab to see if you're fetching the proper <a href="http://yoursite/cron.php">http://yoursite/cron.php</a> successfully.</li>
    <li />
  </ol>
