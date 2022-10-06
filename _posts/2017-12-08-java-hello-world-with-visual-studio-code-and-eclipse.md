---
title: Java Hello World With Visual Studio Code and Eclipse
layout: post
---

## Hello World in Java with Visual Studio Code

* Download and install a JDK. (Look for "Java SE Development Kit".)  If you don't get an error when you type "javac -version" at a Command Prompt (Terminal window in Mac), you already have a JDK.
* Download and install Visual Studio Code (VSCode) from https://code.visualstudio.com/download
* Launch VSCode
* Tell VSCode to create a new file via File > New
* Paste the following text

```
public class test1 {
    public static void main(String[] args) {
        System.out.println("Hello, World");
        System.out.println("Goodbye, World");
    }
}
```

* File > Save As > test1.java
    * VSCode will prompt you to install the Java extension pack.  Do so.  It will take a few minutes.
        * When it finishes installing, it will show a "Reload" indicator.  Click it.
        * It might give you a "Classpath is incomplete" warning.
            * This happens every time you work with a stand-alone Java file (i.e. a Java file that is not part of a project.)
            * For now, just dismiss the warning.
* View > Integrated Terminal
    * cd to the directory where you saved test1.java
    * ```javac test1.java```
        * 'javac' is the compiler.  'java' is command which used to run a compiled program.
    * Do a directory listing.  Observe that javac compiled test1.java to test1.class.
    * ```java test1```
        * It should display "Hello, World"

Note that you will almost never create a Java program this way.  This is a special process for a single-source-file Java app.  Typically, your app will be comprised of many files, and you'll have to create a 'project' to tie them all together.  Most Java projects are godawful complex things which require a 'build tool' to compile and assemble them into something you can run.  There are multiple build tools which Java developers use because developers often say, "This is awful.  I could build something better."

We're going to use Maven.  Maven is good for our purposes because VSCode works with it and so does Eclipse, in case you later decide you have to suffer Eclipse.  Maven revolves around a 'POM file' (Project Object Model), which is written in XML.

We're going to abandon this stand-alone source file and create a hello-world Maven project; we'll also set you up to use the Java debugger.

* Close VSCode.
* For Mac
    * Run "brew install maven".  It will install to /usr/local/bin/mvn.  
    * Run ```mvn --version```
    * Add this to .bash_profile, substituting the value for Maven home as reported by mvn (above).
        * export M2_HOME=/usr/local/Cellar/maven/3.5.2/libexec
        * export M2=$M2_HOME/bin
        * export PATH=$PATH:$M2_HOME/bin
* For Windows, download and unzip Maven from http://maven.apache.org/download.cgi.  
    * You want a "Binary zip archive".  Choose the link from the "Link" column to start the download.
    * Store it in a directory all by itself.  Maybe name that directory "MAVEN".
    * Set a ```M2_HOME``` environment variable to point to the MAVEN directory.
    * Set a ```M2``` (not M2_HOME - just 'M2') environment variable to point to the bin subdirectory of the MAVEN directory.
    * Add the M2 (bin) directory to your PATH.
* In your Terminal window (Command Prompt), navigate to an empty directory, where you wish to create your Java project.
    * ```mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false```
        * This may take a long time.
    * cd to my-app/src/main/java/com/mycompany/app.  (If you're on Windows, your slashes lean the other way.)
    * Run a directory listing and you'll see App.java.  Examine the contents.  You'll see that Maven created a hello-world app for you.  This godawful directory structure -- that's how Java apps are built.
* Launch VSCode and open the my-app directory from the File menu.
    * In the left panel of VSCode, navigate to my-app/src/main/java/com/mycompany/app, and open App.java
    * Find the line with System.out.println.  Left-click with your mouse, just to the left of the line number.  You should see a red circle.  You've just set a breakpoint on this line.
    * Choose Debug > Start Debugging from the menu.  If it asks what kind, select Java.
    * It will highlight the line with your breakpoint.  It executed all the code before that point, and stopped.
    * Choose Debug > Step Over.  It will execute your println, and you'll see the output displayed in the bottom panel.
    * Choose Debug > Continue. It will 'execute' all those closing braces and terminate your program normally.

---------------------------------------------------------------------------------

## Hello World in Java with Eclipse

### Install and Launch LiClipse

We're going to use LiClipse, which is Eclipse bundled with some other tools.

* Download and install a JDK. (Look for "Java SE Development Kit".)  If you don't get an error when you type "javac -version" at a Command Prompt (Terminal window in Mac), you already have a JDK.
* Download and install LiClipse from http://www.liclipse.com/download.html
* Launch LiClipse (henceforth to be referred to simply as Eclipse).
* Eclipse wants to use a "workspace".  That's the root folder for all projects you develop using Eclipse.  Pick one that suits you.  On my Mac, I use /Users/kevin/Sync/code.  Unless you want it to nag you each time you launch it, select "Use this as the default and do not ask again".
* Help > Install New Software > select "Eclipse x.x Release..."
    * In the "Type Filter Text" field, type "java" and press Enter.
    * "Select Eclipse Java Development Tools" and press Next; then work you way through the Wizard until it is installed.
    * Watch the progress dialog in the lower-right corner of Eclipse.  Don't proceed until it hits 100%.  It may be sloooow.
    * When it wants to restart Eclipse, let it.

### Create and Run a Single-file Java App

You really, really have to put your single-file Java app in a project.  If you don't, you'll find yourself unable to save your file.  Eclipse understands projects.  It doesn't really deal with stand-alone files.

* File > New > Project > Java > Java Project.  Press Next.
    * Enter a project name of test1.
    * Choose "Use Project folder as root for sources and class files"
    * Press Finish.
    * It will natter about opening a Java Perspective.  Let it, and tell it to always do so.  It is just going to open the panels which are relevant to *Java*.
* File > New > Class
    * Source folder = test1
    * Package = (empty)
    * Name = test1
    * Superclass = (empty)
    * Clear ALL checkboxes
    * Press Finish
* Make the test1.java file contain:

```
public class test1 {
    public static void main(String[] args) {
        System.out.println("Hello, World");
        System.out.println("Goodbye, World");
    }
}
```

* File > Save
* Locate the toolbar icon for "Run".  (One of the icons with a green circle with a triangle.)  Press it.
    * It will natter at you about Run Configurations.
        * Double-click "Java Application" and choose test1 (under Java Application).
        * Press the Run button.
    * Notice your output at the bottom of the page.

Note that you will almost never create a Java program this way.  This is a special process for a single-source-file Java app.  Typically, your app will be comprised of many files, and you'll have to create a 'project' to tie them all together.  Most Java projects are godawful complex things which require a 'build tool' to compile and assemble them into something you can run.  There are multiple build tools which Java developers use because developers often say, "This is awful.  I could build something better."

We're going to use the built-in Eclipse build too.  If you ever need to do so later, Eclipse can also work with Maven projects and it can export Eclipse projects into Maven 'POM files'. Maven revolves around a POM file (Project Object Model), which is written in XML.

We're going to abandon this stand-alone source file and create a new hellow-world project; we'll also use the Java debugger.

* File > New > Java Project.  Note that because you are already in the Java Perspective, Eclipse has hoisted 'Java Project' into the top-level menu.  You can get the same effect via File > New > Project > Java > Java Project
    * Project Name = my-app2
    * Use default location
    * JRE: use whatever it defaults to
    * Project Layout: Create separate folders...
    * Press Finish
* Stop and look.
    * You should now see TWO Java projects in the Package Explorer panel at the left side of Eclipse.
    * Sometimes, if one Java project is not causing you enough pain, Eclipse figures you might want to work on multiple projects at the same time.  Getting started, one at a time is enough.:
        * Select my-app2.  Then right-click it and choose "Close Unrelated Projects".  Tell Eclipse that you really meant to, when it asks.
        * You will still see a single folder for test1, even though it is closed.  That's how Eclipse works.
* Select the src folder under my-app2.
* Right-click src and create a new package:
    * Name it com.mycompany.app and press Finish.
* Right-click com.mycompany.app and create a new class:
    * Source folder: my-app2/src
    * Package: com.mycompany.app
    * Name: App
    * Modifiers: Public
    * Superclass: java.lang.Object
    * Select "public static void main..." but leave the other checkboxes empty.
    * Press Finish
* Take a look at the generated App.java file.  It is almost a complete hello-world.  Replace the TODO comment with:

```
        System.out.println("Hello, World");
        System.out.println("Goodbye, World");
``` 

* File > Save
* Locate the toolbar icon for "Run".  (One of the icons with a green circle with a triangle.)  Press it.
    * It will natter at you about Run Configurations.
        * Double-click "Java Application" and choose test1 (under Java Application).
        * Press the Run button.
    * Notice your output at the bottom of the page.
* Double-click the gutter, to the left of the line number by the first line with System.out.println.  It will add a small dot to indicate that you have set a breakpoint on this line.
* Locate the toolbar icon of an insect and the flyover help "Debug App".  Press it.
    * Eclipse will ask permission to switch to the Debug Persipective.  Approve it.
    * It will highlight the line with your breakpoint.  It executed all the code before that point, and stopped.
    * Choose Run > Step Over.  It will execute your println, and you'll see the output displayed in the bottom panel.
    * Choose Run > Resume. It will 'execute' all those closing braces and terminate your program normally.
* Note that if you ever find Eclipse in the 'wrong' Perspective, you can change Perspective via Window > Perspective > Open Perspective.
