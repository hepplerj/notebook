---
layout: page
title: How the Notebook Works
permalink: /notebook/
---

## About This Notebook

My notebook is built on top of Github using Jekyll, a static site generator built by Tom Preston-Warner and others in the open source community. I have a few requirements for any system that will be my notebook:

- The ability to write offline in Markdown, but publish the material in any format I need.
- An ability to host the production version of the notebook on the web, open for anyone to read and reference.
- A way to easily embed bibliographic references.
- The ability to link to articles and posts within the notebook with persistent URLs and bibliographic references, since the notebook is a record of work before it appears in publication elsewhere.
- The ability to render software code in a pleasing manner.

I've long been intrigued by Carl Boettiger's [open science notebook](http://carlboettiger.info), as well as [Caleb McDaniel's open history notebook](). And I'm also inspired by [Lincoln Mullen's notebook](http://notebook.lincolnmullen.com) and [Shawn Graham's notebook](). So, welcome to my notebook. Here's how things work.

## Overview

My original notebook ran on Gitit, but remained local to my laptop rather than open on the web. I still use that while I'm working on my dissertation, though some of that material will be moved to this notebook as well -- especially as I start revising my dissertation into a book manuscript. While Gitit mostly hit the above requirements, there were a few thing about it I didn't like. I don't write in Haskell, and don't have any desire to learn the language, so I wanted a system built in a language I already knew so I could extend the platform as I needed. Since I've long been a user of [Ruby]() and [Jekyll](), the platform made much more sense to me. I also never liked Gitit's `.page` extension, preferring to keep my files as `.md`.

There are a few drawbacks to Jekyll. It doesn't have the same ease of wiki functionality built into Gitit, so internal linking isn't as clean as I'd like. Plus, Jekyll's `_posts` filenames require the addition of YYY-MM-DD appended to them, making it harder for me to scan for a file I want when I'm reading them locally as raw Markdown. One workaround for that has been the creation of a small `bash` script that copies the `_posts` into a `_md` directory, removing the appended date. When I edit files, I edit files inside of `_md`, which are then copied into `_posts` and appended with the date parsed out of the YAML frontmatter. I'm so very thankful for automation.

## Notes, Essays, Categories, Tags

Everything in the notebook is a `_post`, apart from some of the descriptive pages I've put together (like this page). Everything here is a Markdown file contained in `_posts`.

At a conceptual level, I distinguish from "essays" and "notes." A note is any page in a notebook for recording something useful---reading notes, archive notes, primary sources notes, and so on, but a note cannot stand alone without extra context. So, context for notes live inside of a `project` that those notes relate to. Each of this metadata is contained in `category` in Jekyll's YAML, providing me a way to break down notes into units. Notes often appear in more than one category. For example, a note might look like:

~~~
---
layout: post
title: "white1995misfortune"
tags: [american west, dissertation, survey]
categories:
- Readings
- Secondary
---
~~~

Toward the bottom of the YAML header, the note belongs to the categorires `Readings` and `Secondary`, relating the note to two categories that I can then sort by and parse. These categories are used in the notebook itself to build lists from project pages.

Essays, in contrast, are related to specific projects or collections of notes, meant for me to make things more comprehensible or extend the context around historical information. For example, an essay might include the following metadata:

~~~
---
layout: essay
title: "Urbanization and the American West"
tags: [urban history, urbanization, suburbanization, american west, dissertation]
categories:
- essays
---
~~~

The essay isn't related to a specific project necessarily. The category `essays` will put it in a list of essays and general writings in the notebook. I also give the essay a different layout, which has a few minor UI tweaks from the post format.

Each post also has a series of tags which I often use for grouping together topics, and allows me to explore the notes through a tag cloud (in the [Notes by Tag)](/tags/).

## Documentation

- [Adding a Project](/doc/adding-project/)

There are a few scripts to make it easy to create new notes and essays. Most of these are contained in the `Rakefile`. The task `newnote` copies a template Markdown file with proper YAML header information and date stamp to the `_md` directory. The task `newessay` does the same thing. The task `prep` copies over the `_md` files into `_posts` with the appropriate date appended to the filename.

Additionally, since I'm using the R language more and more for visualization and statistical information, I've started using a script called `KnitPost` that reads files inside the `_Rmd` directory and converts them into Jekyll posts. This also preserves all of the R markup, figures, charts, and tables that come along with the document.

These scripts help keep categories, tags, and layout correct, and automate most of the maintenance I would otherwise be doing by hand.


## Deployment

When I'm ready to push notes or edits to the live site, my `Rakefile` does the following:

- Files in `_md` and `_Rmd` are copied into `_posts` with the appropriate filenames.
- Changes to the local source are checked into git.
- The local sources are pushed to Github to maintain the record of each change.
- Jekyll builds a new version of the static website from the local source into a local `_site` directory, which contains the notebook.
- I use rsync on the `_site` directory to then deploy the notebook to the web, building the open access version of the notebook.

This takes around sixty seconds for the entire process to happen. It's a little slow at times, but by and large doesn't hamper my workflow.

## Details

The notebook uses Jekyll at its most recent release. I only modify Jekyll by adding plugins. In particular, it's important to make sure the Jekyll Scholar dependencies are updated along with any Jekyll system updates. I also use [Bootstrap]() to handle most of the CSS, icons, and layout of the notebook, with some heavy tweaks inside the `main.css` file. These are pre-processed `sass` files.

I take advantage of several plugins:

- **markdown**: I want to occassionally include Markdown files from the `_includes` directory, but using liquid's `include` expects `.html`. The plugin adds a new liquid controller called `markdown` that allows me to pass these files along and have them markdownified. I use this in particular for the front page.
- **Jekyll-Scholar**: I use this to take advantage of BibTeX files for referencing articles, books, and other materials.
- **greycite_biblio**: This plugin by [Madsen](http://github.com/mmadsen) creates a persistent bioliographic reference on note pages using metadata embedded in Jekyll templates and [Greycite](http://greycite.knowledgeblog.org/).
- **git_modified**: A plugin borrowed from carl Boettiger for looking at git modification time for a file, and using that to set a Liquid variable of last modification time. I use this in the metadata of posts and essays for indicating difference between when a file was originally written and last modified.

## Pandoc

I have replaced Jekyll's default Markdown parser with [Pandoc](http://johnmacfarlane.net/pandoc/), because Pandoc is awesome. It's a document utility written in Haskell for translating Markdown.

I have templates for writing in RMarkdown with embedded R code, using [Knitr]() to produce plain Markdown with source code annotations. These are useful as reproducable research within the notebook and easy to transition into print publications. I blame [Lincoln](http://lincolnmullen.com) for all this R stuff.

## Summary

Everything here is open source. The [source](http://github.com/hepplerj/notebook) for the notebook is on Github. You're welcome to use any of this stuff. Take the notebook and modify it to your needs; feel free to use the research material contained within; or cite material in the notebook itself in your own work. You can probably get this notebook up and running for yourself in about an hour. I'd love a link or credit if you do, but it's not necessary.