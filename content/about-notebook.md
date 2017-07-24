---
title: "About This Notebook"
date: 2017-07-22
aliases: ["/about-notebook.html"]
---

My notebook is built on top of Github using Hugo, a static site generator built by [Steve Francia](https://stevefrancia.com/) and [others](https://github.com/gohugoio/hugo/graphs/contributors) in the open source community. I have a few requirements for any system that will be my notebook:

- The ability to write offline in Markdown, but publish the material in any format I need (via Pandoc, ideally).
- An ability to host the production version of the notebook on the web, open for anyone to read and reference.
- A way to easily embed bibliographic references.
- The ability to link to articles and posts within the notebook with persistent URLs and bibliographic references, since the notebook is a record of work before it appears in publication elsewhere.
- The ability to render software code in a pleasing manner.

I've long been intrigued by Carl Boettiger's [open science notebook](http://carlboettiger.info/), as well as Caleb McDaniel's [open history notebook](http://wiki.wcaleb.rice.edu/). And I'm also inspired by [Lincoln Mullen's notebook](http://notebook.lincolnmullen.com/) and [Shawn Graham's notebook](http://electricarchaeology.ca/2015/10/06/an-elegant-open-notebook/). So, welcome to my notebook. Here's how things work.

## Overview

My original notebook ran on Gitit, but remained local to my laptop rather than open on the web. I still use that while I'm working on my manuscript, though some of that material will be moved to this notebook as well -- especially as I start revising my dissertation into a book manuscript. While Gitit mostly hit the above requirements, there were a few thing about it I didn't like. I don't write in Haskell, and don't have any desire to learn the language, so I wanted a system built in a language I already knew so I could extend the platform as I needed. I also never liked Gitit's default .page extension, preferring to keep my files as .md. So, I moved over to Hugo.

There are a few drawbacks to Hugo. It doesn't have the same ease of wiki functionality built into Gitit, so internal linking isn't as clean as I'd like. I also cannot edit these files on the web as cleanly as I could with Gitit, although web editing on Github circumvents that to some degree.

The main core of the notebook is the use of the R library [blogdown](https://github.com/rstudio/blogdown), which renders RMarkdown posts into HTML files for Hugo. The Makefile in the repository handles site preview, build, and deploy tasks -- it's up to you if you want to write in RStudio or another editor. 

## Notes, Essays, Categories, Tags

Everything in the notebook is a `lab-notebook`, apart from some of the descriptive pages I've put together (like this page). Everything here is a Markdown file contained in `lab-notebook`.

At a conceptual level, I distinguish from "essays" and "notes." A note is any page in a notebook for recording something useful---reading notes, archive notes, primary sources notes, and so on, but a note cannot stand alone without extra context. So, context for notes live inside of a project that those notes relate to. Each of this metadata is contained in category in Jekyll's YAML, providing me a way to break down notes into units. Notes often appear in more than one category. For example, a note might look like:

```
---
title: "white1995misfortune"
date: 2017-07-21
tags: [american west, dissertation, survey]
categories: [Readings]
project: machinesvalley
---
```

Toward the bottom of the YAML header, the note belongs to the categories Readings, relating the note to categories that I can then sort by and parse. These categories are used in the notebook itself to build lists from project pages. A particular note can also belong to a specific project (in this case, `machinesvalley`, my book manuscript) letting me gather up all of those notes in one place.

Essays, in contrast, are related to specific projects or collections of notes, meant for me to make things more comprehensible, bridge across notes and ideas, or extend the context around historical information. For example, an essay might include the following metadata:

```
---
title: "Urbanization and the American West"
tags: [urban history, urbanization, suburbanization, american west, dissertation]
categories: [Essays]
---
```

The essay isn't related to a specific project necessarily. The category Essays will put it in a list of essays and general writings in the notebook.

Each post also has a series of tags which I often use for grouping together by topic or theme. Categories are a higher level than tags, meant for grouping posts together more by their genre than their thematic or topical similarity. Categories are a controlled vocabulary and consist of a smaller set of words than tagging. Right now, the available categories are:

- Readings
- Essays
- Archive
- Administrative

## Documentation

I've removed this section after migrating to Hugo. You can find the [original documentation](http://github.com/hepplerj/notebook/) on previous Github versions. The system is much easier now with Hugo.

## Pandoc

I've removed this section after migrating to Hugo. You can find the [original documentation](http://github.com/hepplerj/notebook/) on previous Github versions. The system is much easier now with Hugo.

## Summary

Everything here is open source. The source for the notebook is on Github. You're welcome to use any of this stuff. Take the notebook and modify it to your needs; feel free to use the research material contained within; or cite material in the notebook itself in your own work. You can probably get this notebook up and running for yourself in about an hour. I'd love a link or credit if you do, but it's not necessary.
