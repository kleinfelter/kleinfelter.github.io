---
excerpt: "I wanted to insert an image of a flag into a cell in a table in PowerPoint.
  \ The obvious thing to do is to copy a picture to the clipboard, and then press
  control-V to paste the image.  Sadly, this pastes the image onto the PAGE in PowerPoint,
  and not into the CELL.  The problem is that if you move/resize the table, the image
  doesn't move with the table.\r\n\r\nYou can find suggestions around the web to set
  your picture to be the background for the cell.  However, if you do this, your picture
  gets stretched to fit the cell, distorting your picture.\r\n\r"
categories: []
layout: post
title: Inserting an Image Into a Cell In a Table in PowerPoint 2007
created: 1315938524
---
I wanted to insert an image of a flag into a cell in a table in PowerPoint.  The obvious thing to do is to copy a picture to the clipboard, and then press control-V to paste the image.  Sadly, this pastes the image onto the PAGE in PowerPoint, and not into the CELL.  The problem is that if you move/resize the table, the image doesn't move with the table.

You can find suggestions around the web to set your picture to be the background for the cell.  However, if you do this, your picture gets stretched to fit the cell, distorting your picture.

In my particular case, the cell has a constant width, so I only needed to ensure that the picture's height didn't get stretched.  You can apply the following technique to address width-stretching, with a little more effort.

<ul>
  <li>Right-click in the cell.
  <li>Select "Split Cells".
  <li>Split the cell into 1 column and 3 rows.
  <li>While the cell is still selected (all 3 rows):
  <ul>
    <li>Select the Design tab on the ribbon;
    <li>Select a solid line, and a white pen color
    <li>In the Draw Borders panel of the ribbon, 
    <li>Drop-down the Borders list-box, and choose "Inside Borders";
    <li>This will change the intra-cell borders to white.
  </ul>
  <li>Still with the full 3-row cell selected, set the font size to 4 pt.
  <ul>
    <li>Set the focus to the middle row of the triple-row cell.
    <li>Right-click in the middle row of the triple-row cell.
    <ul>
      <li>Choose "Format Shape".
      <li>Choose Fill.
      <li>Choose "Picture or texture fill".
      <li>Insert your desired flag from a file or the clipboard (your choice).
    </ul>
  </ul>
  <li>Close the "Format Shape" dialog.
  <li>Adjust the flag height by dragging the invisible borders of the center row in the 3-row cell.
</ul>
&nbsp;
