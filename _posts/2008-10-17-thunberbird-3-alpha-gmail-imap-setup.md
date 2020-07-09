---
excerpt: "<ul>\r\n    <li>Make sure IMAP is enabled in your GMail account settings
  (on mail.google.com)</li>\r\n    <li>New Email Account Wizzard</li>\r\n    <ul>\r\n
  \     <li>New Account Setup: Select &quot;Email account&quot; -- NOT &quot;Gmail&quot;</li>\r\n
  \     <li>Identity: Enter your firstname and lastname, plus youremail@yourdomain.com</li>\r\n
  \     <li>Server Information:</li>\r\n      <ul>\r\n        <li>Server type = IMAP</li>\r\n
  \       <li>Incoming server: imap.gmail.com</li>\r\n        <li>Outgoing server:
  smtp.gmail.com</li>\r\n      </ul>\r\n      <li>User Names</li>\r\n      <ul>\r"
categories: []
layout: post
title: Thunberbird 3-alpha Gmail IMAP Setup
created: 1224275627
---
<ul>
    <li>Make sure IMAP is enabled in your GMail account settings (on mail.google.com)</li>
    <li>New Email Account Wizzard</li>
    <ul>
      <li>New Account Setup: Select &quot;Email account&quot; -- NOT &quot;Gmail&quot;</li>
      <li>Identity: Enter your firstname and lastname, plus youremail@yourdomain.com</li>
      <li>Server Information:</li>
      <ul>
        <li>Server type = IMAP</li>
        <li>Incoming server: imap.gmail.com</li>
        <li>Outgoing server: smtp.gmail.com</li>
      </ul>
      <li>User Names</li>
      <ul>
        <li>Incoming user name: youremail@gmail.com</li>
        <li>Outgoing user name: youremail@gmail.com</li>
      </ul>
      <li>Account Name: gmail.youremail.imap
        <br /></li>
    </ul>
  </ul>
  <br />
  <ul>
    <li>Take TB offline without downloading email (I'm behind a firewall)</li>
    <li>Further TB setup
      <br /></li>
  </ul>
  <blockquote>
    <ul>
      <li>Tools/Account Settings</li>
      <li>Select gmail.youremail.imap</li>
      <li>Server Settings:</li>
      <li>*Port = 993</li>
      <li>*Use secure connection = SSL</li>
      <li>*Check for messages at startup = true</li>
      <li>*Check for new messages every 55 minutes</li>
      <li>*When I delete a message: Remove it immediately (Paradoxically, this will retain the email in your &quot;All Mail&quot; folder.&nbsp; The one thing that Google IMAP uses to trigger deleting an email from All Mail is when a message gets moved to Trash.)</li>
      <li>Select Outgoing Server (SMTP)</li>
      <ul>
        <li>Select smtp.gmail.com and click Edit</li>
        <ul>
          <li>Enter smtp.gmail.com as the Server Name and set the Port to 587</li>
          <li>Username = youremail@gmail.com</li>
          <li>Use secure connection = STARTTLS</li>
        </ul>
      </ul>
      <li>Tools/Options/Network &amp; Disk Space/Connection</li>
      <ul>
        <li>Automatic proxy configuration URL = file:///k:/pac/cingular/mailproxy.pac</li>
      </ul>
    </ul>
  </blockquote>
  <ul>
    <li>From cygwin, start my ssh proxy script x2rose</li>
    <li>Click Get Mail in TB</li>
    <ul>
      <li>If it asks to go online, tell it OK.</li>
      <li>Take it offline afterward. (Click the light-bulb in the status bar.) Tell it do download messages for offline use.</li>
    </ul>
  </ul>
  <ul>
    <li>Change the default location for Sent and Drafts to [Gmail]/Sent Mail and [Gmail]/Drafts respectively by doing:</li>
    <ul>
      <li>Tools/Account Settings/Copies &amp; Folders</li>
      <ul>
        <li>When sending messages, automatically place a copy in</li>
        <ul>
          <li>Other</li>
          <li>gmail.youremail.imap/Gmail/Sent Mail</li>
        </ul>
        <li>Keep message drafts in: &quot;Drafts&quot; Folder on Local Folders</li>
        <li>Keep message templates in: &quot;Templates&quot; Folder on Local Folders</li>
      </ul>
    </ul>
  </ul>
  <ul>
    <li>* More Config</li>
    <ul>
      <li>Check (right-click on, select Properties/Offline)&nbsp; Enable offline access for Inbox, Sent Mail, Trash, All Mail, Spam.</li>
      <ul>
        <li>I don't enable it for Drafts, because this can lead to a bunch of copies of the message when using Tbird with Google IMAP.</li>
        <li>I do perform the Trash folder alignment exercise from Lifehacker.&nbsp; I like the behavior that deleting a message deletes all copies of it (even those you said to 'copy' to another Tbird folder).&nbsp; Note that if you really want to keep the other copy, you can move it to your &quot;Local Folders&quot; message store.</li>
      </ul>
      <li>Tools/Options/Advanced/General/Config Editor</li>
      <ul>
        <li>Enter mail.server.server in the filter box.</li>
        <li>Identify mail.server.serverX.name (where X is a number, and the value is the name gmail.youremail.imap).&nbsp; Record X.</li>
        <li>Right-click somewhere in the box and select New/String</li>
        <ul>
          <li>Preference name = mail.server.serverX.trash_folder_name, where X is the number from above.</li>
          <li>Preference value = [Gmail]/Trash</li>
          <li>Note: The effect of this is that </li>
        </ul>
      </ul>
    </ul>
  </ul>Note: 
  <br />If Get Mail produces (in the SSH session)
  <br />
  <blockquote>&nbsp;channel 13: open failed: connect failed:
    <br /></blockquote>Try going to an outside-the-firewall server and pinging imap.gmail.com.&nbsp; Then update c:\windows\system32\drivers\etc\hosts to point imap.gmail.com to that address.&nbsp; Your firewall may be preventing accurate DNS to imap.gmail.com.&nbsp; Also, the address to imap.gmail.com changes on occasion, so even if you did this once before, you may have to do it again.
  <br />
  <br />
