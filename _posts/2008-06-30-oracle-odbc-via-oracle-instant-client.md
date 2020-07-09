---
excerpt: "<p>Instead of installing the full Oracle Client plus ODBC drivers, you can
  use Oracle &quot;Instant Client&quot; plus Instant Client ODBC supplement.&nbsp;
  Setting it up is not intuitively obvious, so here's what I did.&nbsp; Note that
  you do NOT need a tnsnames.ora or a sqlnet.ora.</p>"
categories: []
layout: post
title: Oracle ODBC Via Oracle Instant Client
created: 1214842046
---
<p>Update 2013.07.17: Still works with Oracle 11.2.  Just substitute "11" everywhere you see "10" in the instructions below.</p>
<hr />
<p>Instead of installing the full Oracle Client plus ODBC drivers, you can use Oracle &quot;Instant Client&quot; plus Instant Client ODBC supplement.&nbsp; Setting it up is not intuitively obvious, so here's what I did.&nbsp; Note that you do NOT need a tnsnames.ora or a sqlnet.ora.</p>
  <ul>
    <li>PC = Windows XP Pro SP3 with 4GB RAM </li>
    <li>Oracle server is 10g version 10.2.something </li>
    <li>Instant Client for Win32 download from <a href="http://www.oracle.com/technology/software/tech/oci/instantclient/index.html">http://www.oracle.com/technology/software/tech/oci/instantclient/index.html</a>&nbsp;(two downloads) 
      <ul>
        <li><span class="boldbodycopy">Instant Client Package - Basic</span></li>
        <li><span class="boldbodycopy">Instant Client Package - ODBC</span></li>
      </ul>
    </li>
    <li>Unzip the Basic Instant Client.&nbsp; All of the files are now in C:\instantclient_10_2. </li>
    <li>Unzip the ODBC supplement.&nbsp; Put all of its files in C:\instantclient_10_2. </li>
    <li>Run C:\instantclient_10_2\odbc_install.exe </li>
    <li>Set the following SYSTEM (not user) environment variables: 
      <ul>
        <li>LD_LIBRARY_PATH=C:\instantclient_10_2 </li>
        <li>TNS_ADMIN=C:\instantclient_10_2 </li>
        <li>SQLPATH=C:\instantclient_10_2 </li>
        <li><strong>Append</strong>C:\instantclient_10_2 to your PATH </li>
      </ul>
    </li>
    <li>Start/Control Panel/Data Sources(ODBC) 
      <ul>
        <li>System DSN </li>
        <li>Add: 
          <ul>
            <li>Data Source Name = whatever you want to call it (I used P1EBETL) </li>
            <li>Description = whatever you want to say (I used P1EBETL) </li>
            <li>TNS Service name = //<em>hostname</em>:<em>port</em>/<em>serviceID</em> (I used //p1bid1d1.edc.mycompany.net:1524/P1EBETL) 
              <ul>
                <li>Note: This is NOT a TNS Service name -- it is a &quot;SQL Connect URL.&quot;&nbsp; Using this means you don't have to create a tnsnames.ora or a sqlnet.ora, and it <u>might</u> be essential to not installing SQL*Net. (I don't know for certain.&nbsp; I just know that by using it, I didn't have to install other software or create the .ora files.) </li>
              </ul>
            </li>
            <li>User ID = database-user-ID-here </li>
          </ul>
        </li>
        <li>Press Test Connection, enter the password, and click OK.&nbsp; You should see a &quot;Connection Successful&quot; dialog. </li>
      </ul>
    </li>
  </ul>
  <p>Update 9/4/2008: This was working well for me and then one day it suddenly stopped.&nbsp; I started getting the following error:</p>
  <pre>
unable to connect
sqlstate s1000
oracle odbc ora ora-12705 cannot access nls data files or invalid environment specified</pre>
  <p>The solution was to run&nbsp;Regedit, and delete: HKLM\Software\Oracle\NLS_LANG</p>
  <p>&nbsp;</p>
<p>You may also want to install sqlplus.  It is similarly installed by unzipping into C:\instantclient_xx_2.  SQL*Plus can be run without TNSNAMES by using <pre>sqlplus userid/pwd@database.company.com:1521/sid</pre></p>
