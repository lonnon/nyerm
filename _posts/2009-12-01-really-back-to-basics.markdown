---
title: Really back to basics
tags: [ruby, blogging]
layout: post
---
So, I have yet to finish the new Jekyll-based blog, and I'm already
dissatisfied with Jekyll. My primary complaint is Liquid. I wasn't wild
about its syntax in the first place; doubled braces are not only ugly,
but don't look anything like the Ruby which underlies the system. I
shouldn't have to shift my thinking so much between competing systems
of syntax when I'm developing layouts.

What's more, Jekyll's implementation of Liquid templates doesn't put post tags anywhere that I can flexibly use them. `{{ site.tags }}` produces an array of all the site's tags *with their posts*. I can't find any way to get just the list of tag names.

<!--more-->

Ideally, I should be able to do something like this:

<pre>
<ul>
{% for tag in site.tags %}
  <li>
    <h2>{{ tag }}:</h2>
    <ul>
    {% for post in tag.posts %}
      <li>{{ post.title }} ({{ post.date }})</li>
    {% endfor %}
    </ul>
  </li>
{% endfor %}
</ul>
</pre>

And I should get HTML output like this:

<pre>
<ul>
  <li>
    <h2>blogging</h2>
    <ul>
      <li>Why I'm so nitpicky (1 Dec 2009)</li>
      <li>Chill out man, it's just a blog (22 Nov 2009)</li>
    </ul>
  </li>
  <li>
    <h2>ruby</h2>
    <ul>
      <li>Can we all use 1.9 already? (29 Nov 2009</li>
      <li>How not to write a regular expression (10 Nov 2009)</li>
    </ul>
  </li>
</ul>
</pre>

To make this work, I'd have to dig into the innards of Jekyll and change how it builds the site "payload" that it hands over to the Liquid parser and renderer. Doable, but it seems like an awful lot of effort to fix something that shouldn't need fixing. Liquid has all the data it needs already, but its limited syntax doesn't give me any way to pull out just a tag's name from the site-wide array of tags, only the posts that contain each tag. Besides which, the next time I need to extract bits of data from posts and pages, I'd have to once again peel open Jekyll to add the feature.

Liquid isn't really intended for a static site generator, anyhow. Its primary concern is security. The reason you can't include Ruby expressions in Liquid tags is that it's expressly prohibited. Liquid is for letting your end users add some dynamic features to their site layouts, and you don't want the end user executing arbitrary code on your server. None of what I'm making here is going to run on the server, anyhow, so I want templating that gives me the most flexibility I can get.

Henrik's fork of Jekyll gets around Liquid's limitations by adding support for HAML layouts, in which good ol' Ruby code is used to access the needed tag names and post data. Unfortunately, after extensive work to merge Henrik's branch with the master Jekyll line that I'm using, HAML rendering is still broken. Henrik doesn't have any Cucumber features, nor even any tests, to define and verify that HAML works, so fixing the problem with HAML rendering means I'd need to write these myself, which is just as much effort as rebuilding Jekyll to allow more data to drip through Liquid and into the layout.

To further add insult to injury, Jekyll isn't compliant with Ruby 1.9. Most of Jekyll itself would probably run fine, but Liquid has issues on the latest Ruby, as does much of the Jekyll testing framework. I'm a strong believer that Ruby has to move forward as a platform, and that means pushing gem owners to update their code to work with 1.9, or failing that, abandoning gems that aren't compliant. I'm tired of trying to run code that doesn't work on 1.9 because of dependencies on old, unmaintained code.

I've given nanoc a good once-over, and while it's a lot closer to the ideal of having plain Ruby generating the dynamic parts of the site, its workflow for a blog isn't nearly as fire-and-forget as Jekyll's. I like how Jekyll teases metadata out of the filename and YAML header of a stack of text files. nanoc's use of a .yaml file in addition to each .html file would drive me nuts in a hurry; I'd rather have tags and titles directly embedded in each page.

As a result of all this, I'm going to start mostly from scratch. Jekyll's not a bad base upon which to build, but I need to strip out a lot of its code and simplify it. The blogging engine I want must meet the following criteria:

* It must read metadata for pages, posts, and layouts directly from embedded YAML and the filename for each file.
* It must use plain Ruby in its templates.
* It must be easy and quick to modify.
* It must be well-defined by a complete set of features and tests.
* It must run flawlessly on Ruby 1.9.1.

I think I'll start with an empty codebase and Jekyll's Cucumber features. After ripping out those features that I don't need, I'll add my own. Then I'll start coding from scratch, borrowing from Jekyll and nanoc where it makes sense to do so. I'm just not going to be happy with this tool if I try to cargo cult someone else's code.
