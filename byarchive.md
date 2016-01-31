---
layout: page
title: Research Archives
permalink: /research-archives/
---

<p>These are notes categorized by the archive I visited.</p>

<ul class="listing">
{% for post in site.categories.Archives %}
    <li>
        <span>{{ post.date | date: "%B %e, %Y" | ordinalize  }}</span>
        <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
{% endfor %}
</ul>