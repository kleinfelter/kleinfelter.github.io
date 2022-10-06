---
categories: []
layout: post
title: Git Crash Course and Cheat Sheet
created: 1320598058
redirect_from: /content/git-crash-course-and-cheat-sheet
---
I'm going to ignore most distributed aspects of git in this posting.  This content addresses solo developer projects.  Note that CWD is an abbreviation for your current working directory.
<p>I use git on my laptop for most work, and when I have a 'milestone product,' I push that to my server.
<table>
<thead style="font-weight:bold"><td>To Do This</td><td>Type This</td></thead>
<tr><td>Create a repo in CWD</td><td>git init</td></tr>
<tr><td>Add content of CWD to git's tracking (if CWD is repo root or descendant)</td><td>git add .</td></tr>
<tr><td>Put all tracked content of CWD and below into repo</td><td>git commit</td></tr>
<tr><td>Put and track content of updated/new files in CWD and below into repo (combines add and commit)</td><td>git commit -a</td></tr>
<tr><td>Status</td><td>git status</td></tr>
<tr><td>Copy a project from a master repo</td><td>git clone <i>url_goes_here</i></td></tr>
<tr><td>Put your changes back in the master</td><td>git push</td></tr>
<tr><td>Discover what you SHOULD have <b>add</b>ed</td><td>git diff</td></tr>
<tr><td>Show what will get committed</td><td>git diff --cached</td></tr>
<tr><td>Show what will get commited (alt.)</td><td>git status</td></tr>
<tr><td>Abandon (completely destroy) a branch</td><td>git branch -D <i>branch_name</i></td></tr>
<tr><td>Show commit history [with metrics]</td><td>git log [--stat]</td></tr>
<tr><td>Compare two branches</td><td>git diff master..my_branch</td></tr>
<tr><td>Compare CWD with a version</td><td>git diff some_branch</td></tr>
<tr><td>Show what changed in this_dir since last commit</td><td>git diff HEAD -- ./this_dir </td></tr>
<tr><td>Do a file system based clone</td><td>git clone /path/to/master/for/project myrepo_dir</td></tr>
<tr><td>Push a local repo to a NEW remote 'master' repo</td><td>git clone --bare repo_original repo_bare</td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
<tr><td></td><td></td></tr>
</table>
<p>
<ul>
<li>In your commit message, the first line MUST be a summary line.
<li>One-time tasks, after you install git, before you use it for the first time
    <ul>
    <li>git config --global user.name "Your Name"
    <li>git config --global user.email "your_mailbox@example.com"
    </ul>
<li>Note that <b>add</b>ing a file is not permanent.  If you add+edit+commit+edit2+commit2, your file won't be included in commit2 (unless you do a "commit -a" to add+commit).
</ul>
<p>Basic workflow.  Suppose you're about to implement a feature you'll call Feature-X:
<ul>
<li>cd <i>somewhere_in_your_git-enabled_project</i>
<li>git branch Feature-X
    <ul>
    <li>This creates the branch, but does not make it your active branch.
    </ul>
<li>git checkout Feature-X
    <ul>
    <li>This makes Feature-X your active branch.
    </ul>
<li>Lotsa editing
<li>git commit -a
<li>test and edit some more
<li>git commit-a
<li>git checkout master
    <ul>
    <li>Makes 'master' your active branch.
    </ul>
<li>git merge Feature-X
<li>If the merge doensn't go smoothly:
    <ul>
    <li>git diff
    <li>More editing
    <li>git commit -a
    </ul>
<li>Regression testing, and maybe more commits.
<li>git branch -d Feature-X
</ul>
