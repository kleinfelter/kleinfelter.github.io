---
excerpt: "<p>Here is a side-by-side of Bort and Suspenders.&nbsp; Both are Rails starter
  applications.\r\n    \r\n    \r\n    \r\n    \r\n    <br /></p>\r\n  <p>September
  10, 2009</p>"
categories: []
layout: post
title: Bort and Suspenders
created: 1252627740
---
<p>Here is a side-by-side of Bort and Suspenders.&nbsp; Both are Rails starter applications.
    
    
    
    
    <br /></p>
  <p>September 10, 2009</p>
  <table cellspacing="1" cellpadding="1" border="1" style="width: 100%;">
    <tbody>
      <tr>
        <td style="width: 33%;"><strong>Opinion</strong></td>
        <td style="width: 33%;"><strong>&nbsp;Bort</strong></td>
        <td style="width: 33%;"><strong>&nbsp;Suspenders­</strong></td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;pagination</td>
        <td style="width: 33%;">&nbsp;mislav-will_paginate</td>
        <td style="width: 33%;">mislav-will_paginate</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;non-HTML mark-up</td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">RedCloth 4</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;mocking</td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;mocha­</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;unit test</td>
        <td style="width: 33%;">&nbsp;rspec, rspec_rails</td>
        <td style="width: 33%;">&nbsp;shoulda</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;unit test &quot;noise suppression&quot;</td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;quietbacktrace</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;Error notification</td>
        <td style="width: 33%;">&nbsp;exception notifier</td>
        <td style="width: 33%;">&nbsp;hoptoad_notifier</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;forms handler</td>
        <td style="width: 33%;">Fudge Form</td>
        <td style="width: 33%;">&nbsp;formtastic</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;file attachment</td>
        <td style="width: 33%;">attachment fu OR Paperclip</td>
        <td style="width: 33%;">&nbsp;paperclip</td>
      </tr>
      <tr>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;helper_test</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;fixtures­</td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;factory_girl</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;deployment</td>
        <td style="width: 33%;">&nbsp;capistrano</td>
        <td style="width: 33%;">&nbsp;­capistrano</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;web server</td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;mongrel cluster</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;VCS</td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;git</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;time mocking</td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;Timecop</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;login</td>
        <td style="width: 33%;">&nbsp;Restful Authentication (includes OpenID)</td>
        <td style="width: 33%;">&nbsp;Clearance</td>
      </tr>
      <tr>
        <td style="width: 33%;">integration testing
          
          
          
          
          
          
          <br /></td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;Cucumber</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;Browser simulator</td>
        <td style="width: 33%;">
          <br /></td>
        <td style="width: 33%;">&nbsp;Webrat</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;Extra rake tasks</td>
        <td style="width: 33%;">bort:install (installs optional add-ons)</td>
        <td style="width: 33%;">&nbsp;Limerick Rake</td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;Javascript smoosher</td>
        <td style="width: 33%;">&nbsp;asset packager OR bundle fu*</td>
        <td style="width: 33%;">
          <br /></td>
      </tr>
      <tr>
        <td style="width: 33%;">&nbsp;roles</td>
        <td style="width: 33%;">&nbsp;Role Requirement *
          
          
          
          
          
          
          
          
          <br /></td>
        <td style="width: 33%;">
          <br /></td>
      </tr>
      <tr>
        <td style="width: 33%;">tagging</td>
        <td style="width: 33%;">acts_as_taggable_on_steroids *</td>
        <td style="width: 33%;">
          <br /></td>
      </tr>
      <tr>
        <td style="width: 33%;">alternative to RHTML</td>
        <td style="width: 33%;">HAML *
          
          
          
          
          
          
          
          
          <br /></td>
        <td style="width: 33%;">
          <br /></td>
      </tr>
    </tbody>
  </table>
  <p>Note that in the above table, more opinions is neither good nor bad -- unless they match/don't-match your opinions.</p>
  <p>* = optional via &quot;rake bort:install&quot;</p>
  <p>For myself, I like the Thoughtbot (Suspenders) stack with the following exceptions:</p>
  <ul>
    <li>git - I'm using Subversion for other projects.&nbsp; This is easy enough to address.&nbsp; After I pull suspenders, I'll just &quot;rm -rf .git&quot;.</li>
    <li>mongrel cluster - I'm not ready to make this commitment at the beginning of the project.&nbsp; Easy enough to ignore for now, because &quot;script/server&quot; still works.</li>
    <li>Redcloth - I don't need an alternative mark-up syntax, so I'll have to rm the gem.</li>
    <li>shoulda - I'm using rspec, so I'll have to rm this gem and install rspec and rspec-rails.
      
      
      
      
      
      
      
      <br /></li>
  </ul>Bundling in Cucumber, Webrat, and Clearance is nice.&nbsp; They fit well together.
  
  
  
  
  
  
  
  <br />
  <br />So here's my current rails project start-up:
  
  
  
  
  
  
  <br />
  <ul>
    <li>cd ~/dev
      
      
      
      
      
      
      <br /></li>
    <li>git clone git://github.com/thoughtbot/suspenders.git</li>
    <li>cd suspenders</li>
    <li>./script/create_project <em>projectname</em>
      <br /></li>
    <li>
      At this point, I get an error&nbsp; &quot;config.gem: Unpacked gem thoughtbot-clearance-0.8.2 in vendor/gems has no specification file. Run 'rake gems:refresh_specs' to fix this.&quot;</li>
    <ul>
      <li>Running refresh_specs all day isn't going to help, because the .gemspec file isn't there on github (with the Clearance that is part of Suspenders -- it IS there on the &quot;real&quot; Clearance).</li>
    </ul>
    <li>cd ../<em>projectname</em>/vendor/gems</li>
    <li>rm -rf thoughtbot-clearance-0.8.2
      
      
      
      
      
      <br /></li>
    <li>git clone git://github.com/thoughtbot/clearance.git thoughtbot-clearance-0.8.2</li>
    <li>cd ~/dev/projectname</li>
    <li>rake gems:refresh_specs
      
      
      
      
      
      <br /></li>
    <li>Comment-out the Redcloth entry in config/environment.rb</li>
    <li>Comment-out the shoulda entry in config/environments/test.rb</li>
    <li>Install rspec and rspec-rails:
      
      
      
      
      
      <br /></li>
    <ul>
      <li>ruby script/plugin install git://github.com/dchelimsky/rspec.git -r 'refs/tags/1.2.7'</li>
      <li>ruby script/plugin install git://github.com/dchelimsky/rspec-rails.git -r 'refs/tags/1.2.7.1'</li>
      <li>ruby script/generate rspec
        
        
        
        
        
        <br /></li>
    </ul>
  </ul>
So I created the attached shell script to automate this.
­
  <br />
  <br />UPDATE (9/16/2009): I've abandoned this approach.&nbsp; Too often I work from inside a restrictive firewall, and the gyrations necessary to pull-in all of the pieces are simply too idiosyncratic to automate reliably.
  <br />
