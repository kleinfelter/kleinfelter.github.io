---
excerpt: "<p>I'm going to try GnuCash.&nbsp; I know from previous experience that
  I'll receive a bunch of the following error messages when importing my Quicken QIF
  file.</p>"
categories: []
layout: post
title: GnuCash from Quicken
created: 1192987742
---
<p>I'm going to try GnuCash.&nbsp; I know from previous experience that I'll receive a bunch of the following error messages when importing my Quicken QIF file.</p>
  <ul>
    <li>The file contains an unknown Action 'Cash'. Some transactions may be discarded. </li>
  </ul>
  <p>It appears to me that Quicken and ETrade use action=Cash for Interest Income, instead of posting the transaction as a transfer from Interest Income to the ETrade account in Quicken.&nbsp; I could manually edit these transactions to reflect the double-entry accounting norm, but I'm going to try a different route.&nbsp; I figure that Quickbooks ought to be able to import Quicken better than anyone else.&nbsp; Once I get my Quicken data into a double-entry bookkeeping system (i.e. Quickbooks) then perhaps it will import better into GnuCash.</p>
  <ol>
    <li>Download Quickbooks 2008 Simple Start from <a href="http://quickbooks.intuit.com/product/about_quickbooks/trials.jhtml">http://quickbooks.intuit.com/product/about_quickbooks/trials.jhtml</a></li>
    <li>Run the setup and install to C:\Kevin\Quickbooks </li>
    <li>Run Quickbooks for the first time: 
      
      
      
      
      
      <ol>
        <li>Select Sole Proprietorship </li>
        <li>Save the new, empty QB file to C:\kevin\Sample Company.QBW </li>
        <li>Otherwise, take the defaults </li>
      </ol>
    </li>
    <li>Oops! QB Simple Start can't import Quicken data.&nbsp; &quot;Use Quickbooks Pro&quot; is the suggested answer. </li>
    <li>Oddly enough, you can't download Quickbooks Pro 2008 from Quickbooks.Intuit.com, but you can from <a href="http://www.quicken.com.au/BusinessFinance/QuickBooksPro/trial.aspx">http://www.quicken.com.au/BusinessFinance/QuickBooksPro/trial.aspx</a></li>
    <li>When you download it (QuickBooks Pro Professional Business 2007-08 Trial), they'll give you a trial-unlock code.&nbsp; Write it down. They'll give it to you as 99999999999999999, but you'll have to break it into 12345-12345-12345-123456. </li>
    <li>It will insist on rebooting.&nbsp; Go ahead. </li>
    <li>Start QB and select&nbsp;&quot;Convert from Quicken.&quot; </li>
    <li>Oops, that won't work.&nbsp; It just tells you that it can't.&nbsp; Create a new company, of type &quot;General Business&quot; with &quot;Individual Income Tax Return.&quot; </li>
    <li>Save the empty file as C:\kevin\Sample Company.QBW </li>
    <li>Ahhh, but Quickbooks (this version) cannot import QIF, but IIF.&nbsp; Download QIF to IIF converter from <a href="http://www.bigredconsulting.com/downloadpages/DownloadQIFNow.htm">http://www.bigredconsulting.com/downloadpages/DownloadQIFNow.htm</a></li>
    <li>Run the install. </li>
    <li>Start Excel 2003; select Tools/Add-ins, and enable QIF to IIF importer. </li>
    <li>Oops. It isn't free. </li>
    <li>A little bit more reading has left me suspecting that Quicken to Quickbooks may be a low-fidelity translation.&nbsp; I have read that QB won't import investment accounts.&nbsp; Back to square one. </li>
  </ol><hr />
  <ol>
    <br />
    <li>Let's try it with Windows GnuCash, V2.2.1.</li>
    <li>Oops! When I start it, I run into the bug documented at http://wiki.gnucash.org/wiki/Windows#GConf.2FORBit_COMM_FAILURE</li>
    <li>Debugging the start-up failure (I'm running Win2K SP4 in a VM with 256MB RAM allocated):</li>
    <ol>
      <li>It happens with straight 2.2.1</li>
      <li>I extracted the binary files for ORBit 2.13.3 from ftp://ftp.gnome.org/pub/gnome/binaries/win32/ORBit2 and overwrote the ones in my gnucash directory. It works.</li>
      <li>2.14.9 <strong>does not</strong> work.</li>
      <li>2.14.0 <strong>does</strong> work.</li>
      <li>2.14.2  <strong>does not</strong> work.</li>
      <li>I went back and re-tested 2.14.0 and 2.14.2 and confirmed that 2.14.0 does work and 2.14.2 does not work.
        Note that in between tests I deleted iof from C:\tmp\gconfd-kevin\lock</li>
      <li>So I'll try building 2.14.0 and test my build, followed by building 2.14.2 and testing my build, and then I'll migrate one to the other, a line at a time until I find the issue.&nbsp;</li>
      <li>... but I can't get it to build with the Cygwin mingw.&nbsp; I'll try the stand-alone mingw from mingw.org.
        
        
        <br /></li>
    </ol>
    <li>I eventually got it to build correctly.&nbsp; I helped locate the bug.&nbsp; Tor has a patch to 2.14.10 that fixes the problem.</li>
  </ol><hr />After fixing the GnuCash start-up problem, it is time to work on importing my accounts.
  
  <br />
  <ol>
    <li>When I import transactions from an investment account, some of them have Action = 'Cash' (i.e. NCash\n records).&nbsp; I get lots of error messages: &quot;The file contains an unknown Action 'Cash'. Some transactions may be discarded.&quot;&nbsp; Simply replacing all &quot;\nNCash\n&quot; with &quot;\n&quot; seems to fix the problem.&nbsp; In other words, the NCash records can simply be deleted, because the N records are optional in Investment accounts.
      
      <br /></li>
    <li>Ditto for ContribX and for WithdrwX.
      <br /></li>
  </ol>
