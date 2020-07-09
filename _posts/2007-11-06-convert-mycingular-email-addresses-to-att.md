---
excerpt: "Because AT&amp;T acquired Cingular, anyone with an Blackberry email address
  of the form <a href=\"mailto:yourname@mycingular.blackberry.net\">yourname@mycingular.blackberry.net,</a>
  now has a new address of the form <a href=\"mailto:yourname@att.blackberry.net\">yourname@att.blackberry.net.</a>&nbsp;&nbsp;\r\n
  \ The <a href=\"/files/convert.vba\" title=\"VBA Code\">attached file</a> can be
  used to convert all the email addresses in all the Contacts in your Outlook Contacts
  folder from mycingular addresses to att addresses.\r\n  \r\n  \r\n  \r\n  \r\n  <br
  />\r\n  "
categories: []
layout: post
title: Convert @mycingular Email Addresses to @att
created: 1194402066
---
Because AT&amp;T acquired Cingular, anyone with an Blackberry email address of the form <a href="mailto:yourname@mycingular.blackberry.net">yourname@mycingular.blackberry.net,</a> now has a new address of the form <a href="mailto:yourname@att.blackberry.net">yourname@att.blackberry.net.</a>&nbsp;&nbsp;
  The <a href="/files/convert.vba" title="VBA Code">attached file</a> can be used to convert all the email addresses in all the Contacts in your Outlook Contacts folder from mycingular addresses to att addresses.
  
  
  
  
  <br />
  <br /><strong>Note: </strong>If your have a Blackberry, and you want to update the addresses, see the Blackberry note at the end of this posting.&nbsp; You must synchronize your Blackberry address book with your Outlook Contacts both before <em>and</em> after you update the email addresses in your Outlook.
  
  
  
  <br />
  <br /><strong>Adding the Code to Your Outlook:</strong>
  <br />
  <ol>
    <li>Right-click on <a href="/files/convert.vba" title="VBA Code File">this link </a>and choose &quot;Save Target As&quot; (for Internet Explorer users) or &quot;Save Link As&quot; (for Firefox users) and save the file to your Desktop.</li>
    <li>Open the file with Notepad.&nbsp; (Start Notepad, select File/Open, navigate to the file you saved, and press the Open button.)</li>
    <li>Copy the contents of the file to the Clipboard.&nbsp; (Choose Edit/Select All; then choose Edit/Copy.)</li>
    <li>Start Outlook (if it isn't running) and select Tools/Macro/Visual Basic Editor.&nbsp; If Outlook asks you whether macros are OK, tell it yes!</li>
    <li>On the left side of your screen, you'll see tree control.&nbsp; It will <em>probably</em> contain an item named &quot;Project1(VbaProject.OTM)&quot; but the name can vary. Expand the tree control until you reach something called &quot;ThisOutlookSession&quot;.&nbsp; Double-click on ThisOutlookSession.</li>
    <li>To the right of the tree control, you'll see a panel that says &quot;(General)&quot; and &quot;(Declaraations)&quot; at the top.&nbsp; Paste the content of your clipboard to the <u>end</u> of the contents of this window.&nbsp; (Click in the window, press control-End, choose Edit/Paste.)</li>
    <li>Close the window titled &quot;Microsoft Visual Basic&quot;.</li>
  </ol><strong>Running the Code</strong>:
  
  
  
  
  <br />
  <ol>
    <li>Before you run the code, please make a back-up of your Contacts.&nbsp; If you don't know how, ask your IT support, or Google for &quot;outlook backup contacts&quot;.</li>
    <li>Repeat after me, &quot;If running this code causes anything unpleasant, up to and including the appearance of a black hole that swallows the solar system, I will not complain, threaten, harass, blame, or file suit against its author, Kevin Kleinfelter.&quot;</li>
    <li>First, check to make sure that Outlook will let you run a macro:</li>
    <ol>
      <li>Select Tools/Macro/Security. Set Security Level to Medium (if it isn't selected already) and click OK.</li>
      <li>If you changed the Security setting, you'll have to exit and restart Outlook.
        
        
        <br /></li>
    </ol>
    <li>Choose Tools/Macro/Macros</li>
    <li>Choose &quot;ThisOutlookSession.ConvertCingularToAtt&quot; (or whatever.ConvertCingularToAtt), and press Run.</li>
    <li>Press the OK button when the code asks your permission.</li>
    <li>Bask in the glow of success.</li>
  </ol><strong>That's great, but what about the addresses on my Blackberry?</strong>
  <br />
  <ol>
    <li>If you don't have it installed already, visit <a href="http://na.blackberry.com/eng/services/desktop/">http://na.blackberry.com/eng/services/desktop/</a>&nbsp; and download and install Blackberry Desktop Software - Software v4.2 SP2 (Blackberry Desktop v4.2 Service Pack 2). If you need help with this step, contact your IT support person or your cell carrier.</li>
    <li>Synchronize your Blackberry address book with your Outlook Contacts folder.&nbsp; If you need help with this step, contact your IT support person or your cell carrier.
      
      
      
      
      <br /></li>
  </ol>
