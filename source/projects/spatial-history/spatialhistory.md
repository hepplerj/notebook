---
layout: page
title: Spatial History
permalink: /spatial-history/
date: 2016-02-22 09:14:39
tags: [spatial history, gis]
---

## Project Description

In what ways can spatial history benefit from the use of computation and visualization? My notes here are collected as part of my large professional interest in spatial history as a framework for understanding the past. Spatial history plays a large role in my manuscript as well as digital projects.

## Related Notes

<table class="table-stripped">
    <tr>
      <th>Date</th>
      <th>Title</th>
    </tr>
    {% for post in site.tags["spatial history"] %}
    <tr>
      <td width="15%;">{{ post.date | date_to_string }}</td>
      <td width="70%;"><a href="{{ post.url | prepend: site.baseurl }}">{{post.title}}</a></td>
      </tr>
    {% endfor %}
  </table>
