---
excerpt: "When I learned of the nonsense I would have to go through in order to
  move from Windows Quicken to Mac Quicken, and if the major loss of functionality,
  I abandoned my test-drive of Mac OSX.  Then I said, &quot;Hey! I could probably
  use the same instructions to move to GnuCash and reduce by one my use of paid software. 
  (Free is a good price, right?)"
categories: []
layout: post
title: Quicken to GnuCash
created: 1206477918
---
When I learned of the nonsense I would have to go through in order to move from Windows Quicken to Mac Quicken, and of the major loss of functionality, I abandoned my test-drive of Mac OSX.  Then I said, &quot;Hey! I could probably use the same instructions to move to GnuCash and reduce by one my use of paid software.  (Free is a good price, right?)
  The following is a modified version of Intuit's instructions for converting from Windows Quicken to Mac Quicken.  I also abandoned my tentative plans to move from Windows to Mac, on the basis that I could tell I would become one of those shrill Mac users who is always complaining about the lack of parity in Mac versions of Windows programs.

* Install GnuCash 2.2.4 for Windows
    * In Quicken:
        * Accept (or delete) all your outstanding downloaded transactions.
    * Separately:
        * Export the security list for all accounts to C:\Temp\security.qif.
            * File/File Export/QIF File
            * Enter QIF File to Export to
            * Set Quicken account to export from to All Accounts.  Might have to scroll UP.
            * Set the date range to 1/1/1990 to present date.  (I checked.  My earliest transaction is in 1990.)
            * Include in Export = Security Lists (only)
        * Export the account list for all accounts to C:\Temp\account.qif.
        * Export the category list for all accounts to C:\Temp\category.qif
        * Export the TRANSACTIONS for all accounts to C:\Temp\transaction.qif.
    * In GnuCash:
        * Import C:\temp\security.qif
        * Import C:\temp\account.qif
        * Import C:\temp\category.qif
        * Import C:\temp\transaction.qif

The import was 95% successful.  I had a few spurrious new transactions.  I think they were related to splits that transferred money between accounts, and GnuCash imported both the sending and the receiving transaction as SEPARATE transactions.

It was valuing my mutual funds at $0.  I ran a FinanceQuote Update (on my Mac).  It opened a Terminal window, but didn't bring it to the top.  I had to move a CPAN configuration along.  In the end, this did not update any mutual fund prices, so my funds are still valued at $0.

Try: sudo /Applications/Gnucash.app/Contents/Resources/bin/gnc-fq-update.  Then restart GnuCash.  Then, go to Tools/Security Editor, and edit each currently-owned stock/fund and enable online updates.

Close GnuCash and run: /Applications/Gnucash.app/Contents/MacOS/Gnucash --add-price-quotes /Users/kevin/Temp/Q/gnucash-2016.sqlite3.gnucash

View/Filter By, and hide the expense accounts.  I don't really want to know that I spent 21,000 on clothes over the past 25 years.

View/Double Line, to see your transactions more like they appeared in Quicken.  You need to do this to see the memo/comment field.

In Quicken, I used a trick.  I could handle things like appreciation and depreciation and opening balances, by creating a transfer from the account into itself, and that would make money magically appear/disappear.  GnuCash treats this as 2 transactions - one in and one out.  (They are linked, so deleting one deletes the other.)  But the net effect is $ neutral --- no increase/decrease to the balance after the 2nd transaction of the pair.  I need to go through Quicken and change all of those to something else.

However, then I started trying to actually use GnuCash.  It is terribly slow for things like Net Worth by year.  I suspect that it calculates everything, rather than maintaining summary data.  I've got 15+ years of data.  Quicken handles it promptly, and GnuCash doesn't.  I'll check back in on GnuCash in a year or so and see if they've sped it up.

Update: I'm revisiting this in 2016.  It looks to be fast enough now, although still not a speed demon when loading 25 years of data.  I'm going to capture the details of my 2016 adventure in Evernote, because it will contain details of my account fix-ups.
