---
layout: page
title: "Open Research"
permalink: /open-research/
---

Nothing here yet.

<table class="table table-condensed">
{% for post in site.categories["open research"] %}
    {% assign category = post.categories | get_project_category %}
    <tr>
    <td><a href="{{post.categories | get_raw_project_category | get_project_url }}">{{category}}</a></td>
    <td>{{ post.date | date_to_string }}</td>
    <td><a href="{{ post.url }}">{{post.title}}</a></td>
    </tr>

{% endfor %}
</table>