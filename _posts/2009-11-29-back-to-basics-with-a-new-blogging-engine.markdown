---
layout: post
title: Back to basics with a new blogging engine
tags: [blogging, ruby, writing, jekyll, wordpress]
---

I don't blog a whole lot; that much is obvious from the gaps between posts on this site. Part of it is that I'm no longer in the habit of tossing random bits of fluff into the blog. I've got Twitter and Facebook and Delicious for making short, not terribly pithy comments on stuff I run across while browsing the web.

I recently discovered that the other thing keeping me from blogging more frequently is that there are simply too many switches and levers to play with in the average blog engine. Geek that I am, I can't keep myself from flipping them instead of writing something. There's always a new WordPress plugin to try out, or some settings that can be tweaked, or another button that can be poked just to see what it does. While WordPress contains a pile of features that make blogging easier, many of them serve only to distract from the important task of *writing content*.

<!--more-->

As an example, the screen area in my web browser ([SRWare Iron](http://www.srware.net/en/software_srware_iron.php), a Chrome derivative, if anyone's interested) is 1105 &times; 808. Of this, the actual text area WordPress provides for writing posts is 583 &times; 301, a bit less than 20% of the total area available. This doesn't count that there's another screenful below this that you have to scroll to get to; that's a lot of real estate devoted to everything *but* content.

A good craftsman doesn't blame his tools, though. I don't mean to single out WordPress, either. It's a fantastic feat of software engineering, and I've been very happy with it. The folks at [Automattic](http://automattic.com) have done an amazing job.

No, what concerns me most about the various distractions of any blogging engine is that time spent fiddling with things behind the scenes is wasted. I'm not learning anything new by clicking buttons and installing plugins. No matter what I use for creating and maintaining a site, my very nature compels me to make changes. If I'm going to play with settings, at least I want it to be a growth experience. I want my futzing to be instructive and mind-expanding.

Enter [Jekyll](http://github.com/mojombo/jekyll), a blog-aware Ruby program for generating static websites. Unlike the blog engines I've been using, it doesn't run on the web server at all. It sits on my hard drive and turns text files into static web pages, which I then upload to the server. It's lean, it's fast, and I can write from the comfort of my favorite text editor ([e text editor](http://www.e-texteditor.com/), the closest thing Windows has to the fabulous Mac-only [TextMate](http://macromates.com/)). I'd already discovered the joy of [writing blog posts in my text editor](http://blog.nyerm.com/2009/02/11/textmate-as-a-blogging-tool/), and Jekyll takes it one step further.

Even better: when I get the urge to fiddle with the underpinnings of the site, I have to *write code* to do it. There simply aren't any user serviceable parts I can toy with. Jekyll's a simple thing, and easily extensible in my favorite language, but it does force me to learn something new when I want to add a feature to the site. On top of that, it sharpens my Ruby skills, which is never a bad thing.

I have no illusions that a vast and invisible readership hangs on my every word, nor do I require such slavish fandom. I do want to feel that the effort expended on creating a blog and posting to it regularly aren't wasted, though, and this new tool seems like a step in the right direction.
