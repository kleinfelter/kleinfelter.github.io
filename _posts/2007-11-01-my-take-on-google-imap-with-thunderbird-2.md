---
excerpt: "<ol>\r\n    <li>Make sure IMAP is enabled in your GMail account settings
  (on mail.google.com)</li>\r\n    <li>File/New/Account/Email_Account and click Nexw\r\n
  \     \r\n      \r\n      \r\n      "
categories: []
layout: post
title: My Take on Google IMAP With Thunderbird 2
created: 1193938519
---
<ol>
    <li>Make sure IMAP is enabled in your GMail account settings (on mail.google.com)</li>
    <li>File/New/Account/Email_Account and click Nexw
      
      
      
      <br /></li>
    <li>Identity: Enter your firstname and lastname, plus youremail@yourdomain.com and click Next</li>
    <li>Server Information:</li>
    <ul>
      <li>Server type = IMAP</li>
      <li>Incoming server: imap.gmail.com</li>
      <li>Outgoing server: smtp.gmail.com</li>
      <li>...and click Next</li>
    </ul>
    <li>User Names</li>
    <ul>
      <li>Incoming user name: youremail@gmail.com</li>
      <li>Outgoing user name: youremail@gmail.com</li>
      <li>...and click Next</li>
      <li>Click Next until the wizard completes</li>
    </ul>
    <li>Rename the account to Account Name = gmail.youremail@yourdomain.imap</li>
    <li>Take TB offline without downloading email (I'm behind a firewall)</li>
    <li>Further TB setup</li>
    <ol>
      <li>Tools/Account Settings</li>
      <li>Select gmail.youremail@yourdomain.imap</li>
      <li>Server Settings:</li>
      <ol>
        <li>Port = 993</li>
        <li>Use secure connection = SSL</li>
        <li>Check for messages at startup = true</li>
        <li>Check for new messages every 55 minutes</li>
        <li>When I delete a message: Remove it immediately (Paradoxically,
this will retain the email in your &quot;All Mail&quot; folder.&nbsp; The one thing
that Google IMAP uses to trigger deleting an email from All Mail is
when a message gets moved to Trash.)</li>
      </ol>
      <li>Select Outgoing Server (SMTP)</li>
    </ol>
    <ul>
      <ul>
        <li>Select smtp.gmail.com and click Edit</li>
        <li>Enter smtp.gmail.com as the Server Name and set the Port to 587</li>
        <li>Username = youremail@gmail.com</li>
        <li>Use secure connection = TLS</li>
        <li>Note: If you just can't get it to connect for SMTP, it may be that your employer has blocked access to port 587 via the corporate edition of McAfee.&nbsp; Employers used to just block port 587 via their firewalls.&nbsp; However, when people took their company-owned laptops home, they were then able to connect in GMail.&nbsp; So some have taken to configuring the corporate edition of McAfee to prevent all processes on your PC from connecting to port 587 on ANY server.</li>
        <ul>
          <li>To see if this is the case:</li>
          <ul>
            <li>Set up Portable Thunderbird and get SMTP working from another PC that you know does not block port 587.</li>
            <li>Copy that Portable Thunderbird to your laptop.</li>
            <li>See if it now fails.&nbsp; If it does, you know that your laptop has port 587 blocked.</li>
          </ul>
          <li>If you need to use SMTP anyhow:
            <br /></li>
          <ul>
            <li>Configure Thunderbird to use a proxy: SOCKS, localhost, 8080 (via Tools/Options/Advanced/Network &amp; Disk Space/Connection)</li>
            <li>Set up an ssh SOCKS proxy on port 8080.
              <br /></li>
          </ul>
        </ul>
      </ul>
    </ul>
    <li>Click Get Mail in TB</li>
    <ul>
      <li>If it asks to go online, tell it OK.</li>
      <li>Take it offline afterward. (Click the light-bulb in the status bar.) Tell it do download messages for offline use.</li>
    </ul>
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
    <li>More Config</li>
    <ol>
      <li>Check (right-click on, select Properties/Offline)&nbsp; Enable offline access for Inbox, Sent Mail, Trash, All Mail, Spam.</li>
      <ul>
        <li>I don't enable it for Drafts, because this can lead to a bunch of copies of the message when using Tbird with Google IMAP.</li>
        <li>I do perform the following Trash folder alignment exercise from Lifehacker.&nbsp;
I like the behavior that deleting a message deletes all copies of it
(even those you said to 'copy' to another Tbird folder).&nbsp; Note that if
you really want to keep the other copy, you can move it to your &quot;Local
Folders&quot; message store.</li>
        <ul>
          <li>Tools/Options/Advanced/General</li>
          <li>Hit the &quot;Config Editor&quot; button next to the &quot;Advanced Configuration&quot; label.</li>
          <li>Using the filter entry box at the top, type in mail.server.server and you will see a list of keys and values. One of those keys will be <strong>mail.server.serverX.name</strong>, where X is a number and <strong>the value is the name of your Gmail IMAP account</strong>. <strong>Remember X</strong>.</li>
          <li>Right-click somewhere in the box and select New-&gt;String.</li>
          <li>A dialog box will pop up asking for the name of your new key. Put in mail.server.serverX.trash_folder_name, where X is the number you remember from above. (For example, mine is mail.server.server2.trash_folder_name.)</li>
          <li>A new box will come up asking for the value of your new key. Put in [Gmail]/Trash</li>
          <li>Go to Gmail's web interface and delete the label [Imap]/Trash.</li>
          <li>Restart Thunderbird.&nbsp;</li>
        </ul>
      </ul>
    </ol>
    <li>Open each of your folders in Thunderbird, and let it download all message headers. (Slow.)</li>
    <li>Go offline.
      
      
      <br /></li>
  </ol>
