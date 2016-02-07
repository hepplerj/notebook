---
layout: page
title: Visualization in the Humanities
permalink: /visualization-humanities/
tags: [visualization]
---

* Table of Contents
{:toc}

## Project Description

In what ways can historians take advantage of visualization techniques in the presentation and communication of historical arguments? Can we, through data-drive and visualization-driven research, shape new methods of revealing ambiguity, complexity, and exploration of the past?

## Posts

<table class="table-stripped">
    <tr>
      <th>Date</th>
      <th>Title</th>
    </tr>
    {% for post in site.tags.visualization %}
    <tr>
      <td width="15%;">{{ post.date | date_to_string }}</td>
      <td width="70%;"><a href="{{ post.url | prepend: site.baseurl }}">{{post.title}}</a></td>
      </tr>
    {% endfor %}
  </table>
