---
title: TurboTax Student Information Worksheet, Lin 18, Used for Exclusion
---

There are two kinds of TurboTax users -- those who just complete the interview as best they can, trusting TurboTax to get everything right, and those who want to understand every number so they're.  This story is for the latter. It deals with the "Part VI - Education Expenses" section of the worksheet.

Parents of children in college, will encounter the "Student Information Worksheet" in  TurboTax 2020. This is where TT looks at all the possible ways to deal with your college expenses. It uses the numbers from this worksheet to pick the best tax strategy for your situation.

## Columns

Part VI is a large table. Think of it as a static spreadsheet. (It is a spreadsheet that you can't update directly.)

I'm going to look at just a subset of the columns of this table. The omitted columns are similar to columns I *do* cover.

* **Total** - This column lists all the education expenses, scholarships, credits, without filtering.  These are the raw numbers.
* **American Opportunity Credit** (AOTC) - This column is the *subset* of values from the Total column which are eligible for the AOTC.  For example, you might have $200 of fees in the Total column, but ony $100 of those fees would be eligible for the AOTC.  In that case, you'd have $200 in Total and $100 in the AOTC column.
* **Lifetime Learning Credi** (LLC) - This column is the *subset* of values from the Total column which are eligible for the LLC.
* etc.

Other than line 18 ("Used for exclusion") the numbers in the non-Total columns have nothing to do with one another. If you have $200 in the Total column, all of the other columns are capped by this value.  But if you have $100 in the Total column for AOTC, it has nothing to do with the number in the LLC column.  If you change your data in a way that increases the AOTC number to $101, that won't take $1 away from LLC.

## Rows

* Lines 1-12 get totaled, to create line 13.
* Lines 14-18 totaled totaled, to create line 19.
* Line 19 gets subtracted from line 13, to create line 20.
* Line 20 shows, for each category (AOTC, LLC, TFT, 520), how much $ could be squirreled away there.

Important: You can't use **all** of the values in row 20. For example, if you take the AOTC, you can't also take LLC.  If you have $1000 in row 20's AOTC and you also have $1000 in row 20's LLC, TurboTax is going to use one of those values and not the other. It will pick the one which results in the lowest tax bill.

Row 20 is the bottom line, so to speak. The lines at the top of the chart are adding up expenses, the lines in the bottom of the chart are subtracting the amounts somebody else paid, and line 20 is how much expense TurboTax *could* charge to that column.

When you're looking at the chart, it is easy to get confused as to which cell goes with which label in the "Description" column.  Follow the "......." from the description to the underscore for the appropriate row.
## Gray Areas

The big gray blocks prevent you (or TurboTax) from entering numbers which don't apply to that column.  e.g. Room and Board is grayed out for AOTC and LLC because you can't pay for room and board with AOTC or LLC.

## Where Do the Numbers Come From?
* Row 1: Tuition = 1098-T data entry.  In a simple world, this number would come from "Box 1 - Payments" on your 1098-T. If you clicked on the blue link, "What if this is not what (student name) paid to this school?", row 1 comes from that field.
* Row 2: Fees = ?
* Row 3: Books, supplies, equipment = This comes from your answer to the prompt for how much you spent on books, etc. which *must be purchased from the school*.  Look closely. The "Paid to other..." is part of the NEXT row in the table.
* Row 4: Paid to other... Books,  supplies, equipment. This comes from your answer to the prompt for how much you spent on books, etc. which *need not be purchased from the school*.
* Row 5: Other course related = ?
* Row 6: Room and board.  This comes from the number you entered for the room and board prompt.
	  * What? You didn't see a room and board prompt? Yeah, it is hidden.
	  * Enter 1099-Q data via: Federal Taxes > Deductions & Credits > ESA and 529 qualified tuition programs (Form 1099-Q)
    * THEN enter "Expenses and Scholarships (Form 1099-T)" from Federal Taxes > Deductions & Credits
        * It will be accessed via "Other Education Expenses"
        * I'm guessing they do it this way because the only part of your taxes where R&B is relevant is accounting for your 529 distribution (the 1099-Q).  IF you have a 1099Q, then the R&B via "Expenses and Scholarshps" is relevant.
* Row 7: Special Needs Expenses. This is what you entered at the corresponding prompt.
    * Tip: I had some fees which the 529 plan could reimburse (without generating a tax liability) but AOTC could not. I couldn't find a way to tell TurboTax that these fees should be excluded from AOTC. Then I discovered that Special Needs Expenses are eligible for 529 but not AOTC.  
        * This worksheet does not get sent to the IRS. It merely captures the calculations TurboTax did.
        * I entered the non-AOTC fees as Special Needs Expenses, even though my child has no "special needs." TurboTax did the desired calculations, I paid the right taxes, and the 529 plan reimbursed these pseudo special needs.
* Row 8: Computer expenses = ?
* Row 9: QTP/ESA = ?
* Row 10: Academic Tutoring = ?
* Row 11: Uniforms = ?
* Row 12: Transportation = ?
* Row 13: Total qualified expenses = This is the sum of rows 1-12.
* Row 14: Refunds = This comes from the number you entered for the refunds prompt.
* Row 15: Tax-free assistance = ? (I don't know the exact prompt, but this is where the Georgia Zell/Hope scholarship shows up.)
* Row 16: Deducted on Sched A = ?  You probably won't get anything here, if you're taking the standard deduction.
* Row 17: Used for credit or deduction = ?
* Row 18: Used for exclusion
    * (I hate row 18.) TurboTax makes up this number. Taking the AOTC column as an example. 
        * Suppose you have $500 listed. It means TurboTax is *voluntarily* taking $500 which *could* go toward AOTC, and not applying it to AOTC.
        * Why on Earth would it do that? 
        * Because by giving up that $500 for AOTC, it can applying it more effectively elsewhere.
        * Elswhere, I said that the columns were independent except row 18.  This is why.
        * See "Mythical Row 21."
* Row 19: Total adjustments = This is the sum of rows 14-18. These are values which *reduce*  the expense which is eligible for the corresponding column.
* Row 20: Adjusted Qualified Expenses.  Row 13 minus Row 19. This is how much expense TurboTax *could* charge to that column.  When TurboTax puts a number in row 18 (Used for exclusion), it is doing so in order to lower this value for the column.

Mythical Row 21: The table would be much clearer if TurboTax appended a row 21. This imaginary row would be the amount from row 20 which TurboTax actually applied to this column's category.  

* e.g. If your Total column was $1000, and TurboTax applied $300 of that Total to AOTC and $700 to your 529 plan, it would have these numbers in row 21.
* e.g. Since you can't use the AOTC and the LLC for the same student in the same year, your row 21 will have a zero in one of these columns, even if row 20 has $2000 in each of these columns.

If you are trying to make sense of the table, create your own row 21.  The numbers in row 21 will be less than or equal the same column's numbers from row 20.

Disclaimer: Any of this information could be totally wrong. It is not tax advice or legal opinion. It just describes what I *think* is the way to make TurboTax do what I wanted.
