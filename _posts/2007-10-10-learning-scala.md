---
excerpt: "<p>Here are my notes on learning Scala:</p>\r\n  <p>&nbsp;</p>\r\n  <ul>\r\n
  \   <li>&nbsp;Not a lot of tool support yet. &nbsp;JEdit syntax highlighting works
  OK, as do some other editors. Eclipse plugin provides more capability, but it is
  slow. </li>\r\n    <li>Environment variables: \r\n      <ul>\r\n        <li>SCALA_HOME=/path/to/scala/dir
  </li>\r\n        <li>PATH (add $SCALA_HOME/bin) </li>\r\n      </ul>\r\n    </li>\r\n
  \   <li>\r\n      <br /></li>\r\n  </ul><hr />\r\n  <p>Notes on the language proper:</p>\r\n
  \ <p>Hello&nbsp;World:</p>"
categories: []
layout: post
title: Learning Scala
created: 1192044527
---
<p>Here are my notes on learning Scala:</p>
  <p>&nbsp;</p>
  <ul>
    <li>&nbsp;Not a lot of tool support yet. &nbsp;JEdit syntax highlighting works OK, as do some other editors. Eclipse plugin provides more capability, but it is slow. </li>
    <li>Environment variables: 
      <ul>
        <li>SCALA_HOME=/path/to/scala/dir </li>
        <li>PATH (add $SCALA_HOME/bin) </li>
      </ul>
    </li>
    <li>
      <br /></li>
  </ul><hr />
  <p>Notes on the language proper:</p>
  <p>Hello&nbsp;World:</p>
  <pre>
object HelloWorld {<BR>&nbsp;   def main(args: Array[String]) {<BR>&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; println("Hello, world!")<BR>&nbsp;&nbsp;&nbsp; }<BR>}</pre>
  <p><em><strong>object</strong></em> defines a singleton class instance.&nbsp; Every program has a function named <strong><em>main</em></strong> inside a singleton&nbsp;object.</p>
  <p><strong><em>def</em></strong> defines a function or an expression <em>without evaluating it;</em> it does not evaluate its RHS.</p>
  <p><em><strong>Val </strong></em>defines a constant; it evaluates its RHS.</p>
  <p>Formal parameter definition should always include a type. (<em><strong>Array[String]</strong></em> for the <strong><em>main</em></strong> function.)</p>
  <p>Function calls are call-by-value by default.&nbsp; Formal parameters with &quot;: =&gt;&quot; instead of just &quot;:&quot; are call-by-name.</p>
  <p>Every statement returns a value.</p>
  <p>&quot;return val&quot; is the same as &quot;val&quot; at the end of a function.</p>
  <p>Semicolons <u>may</u> be used as statement terminators.</p>
  <p>Function definitions look like this:</p>
  <pre>
def funcname(parm: ParmType):FuncType = {
  statements;
}</pre>
  <p>You can omit the surrounding {} if the function body is a single statement.</p>
  <p>You can omit FuncType if it is obvious to the compiler.</p>
  <p>Conditions (e.g. in an if-statement) must be surrounded by parenthesis, as in C and Java.</p>
  <p>You can nest functions (in order to scope the names).</p>
  <p>Tail-recusion is optimized for &quot;directly tail-recursive&quot; calls.&nbsp; e.g. This gets optimized:</p>
  <pre>
    def gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)</pre>
  <p>... but this does not (due to the need to multiply AFTER the recursion returns). </p>
  <pre>
    def factorial(n: Int): Int = if (n == 0) 1 else n * factorial(n 1)</pre>
  <p>Named functions can be passed by name too (&quot;First-class functions&quot;), as can anonymous functions.</p>
  <p>Here is an anonymous function in use:</p>
<pre>
def blarfle(a: Int, b: Int): Int = sum((x: Int) => x * x, a, b)
</pre>
<p>The function header is "(x: Int)", so it is a function that takes a single, integer parameter. The body of the function is "x * x".</p>
<p>Sometimes you can get away with omitting the type (if the compiler can figure it out), as in:</p>
<pre>
def blarfle(a: Int, b: Int): Int = sum((x) => x * x, a, b)
</pre>
<p>And, whenever your argument list is just "(x)" it can be rewritten as "x" giving:</p>
<pre>
def blarfle(a: Int, b: Int): Int = sum(x => x * x, a, b)
</pre>
<p>Sometimes you'll run into a function that looks like this:</p>
<pre>
def sum(f: Int => Int): (Int, Int) => Int = {
  def sumF(a: Int, b: Int): Int =
  if (a > b) 0 else f(a) + sumF(a + 1, b)
  sumF
}
</pre>
<p>This says that 'sum' is a function that take a function (the argument 'f') that takes an Int parameter and returns an Int result;], and the function 'sum' returns a function of type "(Int, Int)=> Int)".  In other words, 'sum' is a function factory that takes one function as its argument, and it generates a function that takes two Ints (and returns an Int).</p>
<p>One way to use sumF would be to do something like:</p>
<pre>
  def g = sum((x) => x * x)
  g(1,3)
</pre>
<p>... which calls 'sum' to generate a function that sums squares, naming the new function 'g', and then calls 'g' with 1 and 3 as parameters.</p>
<p>Sometimes Scala can't really tell that this is what you are trying to do, and it complans in your def of g.  You solve that problem like so:</p>
<pre>
  def g = sum((x) => x * x) _
  g(1,3)
</pre>
<p>... which uses the trailing underscore to tell Scala, "Hey! Don't worry -- this call of 'sum' just returns a function and I promise to pass the right arguments to that function when I call it. (I think.)</p>
<pFor the ultimate in brevity, you can define g and call it in a single line:</p>
<pre>
sum(x => x * x)(1, 10)
</pre>
<p>The "sum(x => x * x)" generates the new (unnamed) function and the "(1, 10)" calls it with the arguments 1 and 10.</p>
<p>&nbsp;</p>
<p>more soon </p>
