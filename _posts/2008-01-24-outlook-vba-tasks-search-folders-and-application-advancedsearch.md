---
excerpt: "<p>I wanted to use Outlook 2003 &quot;Search Folders&quot; to search for
  Tasks.&nbsp; I've got Outlook Tasks arranged in a hierarchy of folders, and sometimes
  I want to see all Tasks, regardless of folder.</p>\r\n  <p>This <em>ought</em> to
  be easy, but Search Folders are heavily biased toward email.&nbsp; If you want a
  Search Folder for Tasks, you have to create it using VBA resembling:</p>"
categories: []
layout: post
title: Outlook, VBA, Tasks, Search Folders, and Application.AdvancedSearch
created: 1201201892
---
<p>I wanted to use Outlook 2003 &quot;Search Folders&quot; to search for Tasks.&nbsp; I've got Outlook Tasks arranged in a hierarchy of folders, and sometimes I want to see all Tasks, regardless of folder.</p>
  <p>This <em>ought</em> to be easy, but Search Folders are heavily biased toward email.&nbsp; If you want a Search Folder for Tasks, you have to create it using VBA resembling:</p>
  <pre>
Set MyOutlookApplication = Outlook.Application<BR>SearchSubFolders = True<BR>Set MapiNamespace = Application.GetNamespace("MAPI")<BR>Set TasksFolder = MapiNamespace.GetDefaultFolder(Outlook.OlDefaultFolders.olFolderTasks)<BR>Scope = "'" &amp; TasksFolder.FolderPath &amp; "'"

' #############################################################<BR>Filter = "urn:schemas:tasks:Completed &lt;&gt; True"<BR>Set Search = MyOutlookApplication.AdvancedSearch(Scope, Filter, SearchSubFolders)<BR>ResultsFolderName = "All Tasks"<BR>Set ResultsFolder = Search.Save(ResultsFolderName)<BR></pre>
  <p>But using &quot;urn:schemas:tasks&quot; as a filter crashes Outlook.&nbsp; The problem is that it isn't a valid schema.&nbsp; So how do you discover valid schemas?&nbsp; I Googled all over the place and didn't find a list, but there is a way to get Outlook to show you valid search schemas.</p>
  <p>First, you have to customize your Outlook toolbar:</p>
  <ol>
    <li>Right-click on the main toolbar, select Customize, and then the Commands tab. </li>
    <li>Select the View category, and scroll Commands almost all the way down to the &quot;Filter&quot; command. </li>
    <li>Drag and drop Filter onto your toolbar or menu. (I put mine at the bottom of the View menu.) </li>
  </ol>
  <p>Next, click on the top-level Tasks folder and then select Filter (from wherever you dropped it per the instructions above).</p>
  <ol>
    <li>Enter the criteria for your search, but do <u>not</u> press OK. </li>
    <li>Select the SQL tab.&nbsp; You will be shown the magic incantation, including the schema, that you can assign to Filter in the code snippet above. </li>
    <li>Note that in order to Copy/Paste the query, you must select the &quot;Edit these criteria directly&quot; first.&nbsp;&nbsp; (I recommend un-checking it after you Copy.) </li>
  </ol>
  <p>For example, to search for Tasks that are incomplete, use the following Filter:</p>
  <pre>
Filter = """<A href="http://schemas.microsoft.com/mapi/id/{00062003-0000-0000-C000-000000000046}/811c000b">http://schemas.microsoft.com/mapi/id/{00062003-0000-0000-C000-000000000046}/811c000b</A>"" &lt;&gt; 1"</pre>
  <p>Near as I can tell, you have to quote the URL with a full quote mark (&quot;) and not an apostrophe (').</p>
