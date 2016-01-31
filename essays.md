---
layout: page
title: Essays
permalink: /essays/
---
  <table class="table table-condensed">

  {% for post in site.categories["Essays"] %}

    <tr>
    <td class="col-md-4">{{ post.date | date: "%b %-d, %Y" }}</td>
    <td class="col-md-8"><a href="{{ post.url | prepend: site.baseurl }}">{{post.title}}</a></td>
    </tr>

  {% endfor %}
  </table>