---
excerpt: "I've been doing some programming in Excel's VBA recently.&nbsp; I have a
  series of blocks of code, where the only thing different in the blocks is that each
  block calls a different function.&nbsp; Pseudo-code resembles\r\n<code></code>\r\n
  \ <pre>blah1\r\nblah2\r\nCall Function1\r\nblah3\r\nblah4\r\n...\r\nblah1\r\nblah2\r\nCall
  Function2\r\nblah3\r\nblah4\r\n...\r\nblah1\r\nblah2\r\nCall Function3\r\nblah3\r\nblah4\r\n...\r\n</pre>\r"
categories: []
layout: post
title: Pass a Function as a Parameter in VBA
created: 1256908765
---
I've been doing some programming in Excel's VBA recently.&nbsp; I have a series of blocks of code, where the only thing different in the blocks is that each block calls a different function.&nbsp; Pseudo-code resembles
<code></code>
  <pre>blah1
blah2
Call Function1
blah3
blah4
...
blah1
blah2
Call Function2
blah3
blah4
...
blah1
blah2
Call Function3
blah3
blah4
...
</pre>
The obvious change here would be to create a subroutine with one of the blocks of code, and to call the subroutine passing the unique function as a parameter to the subroutine.&nbsp; Excel 2003 VBA does not permit this directly, so my next thought was to use Eval, and pass the function name as a string.&nbsp; Excel 2003 VBA does not include Eval.
  <br />
  <br />But... Excel VBA does permit one to pass an object as an argument.&nbsp; So the solution becomes:
  <br />
  <ul>
    <li>Define 3 different objects, and give each object a single function, each function named the same.</li>
    <li>Pass the object as an argument, instead of the function.</li>
    <li>Have the subroutine call the function via the object.
      <br /></li>
  </ul>
