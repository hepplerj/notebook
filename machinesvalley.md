---
layout: page
title: Machines in the Valley
permalink: /machines-valley-manuscript/
---

* Table of Contents
{:toc}

## Manuscript Description

3 wolf moon stumptown roof party Marfa. Keytar semiotics iPhone, stumptown art party tattooed Intelligentsia. Food truck authentic lo-fi, aesthetic keffiyeh church-key American Apparel kitsch PBR&B ethnic hella farm-to-table. Blue Bottle narwhal tote bag pork belly, sriracha leggings messenger bag slow-carb. Kale chips wayfarers Banksy keytar 3 wolf moon. Helvetica sartorial ennui scenester Wes Anderson salvia, pork belly selvage brunch squid. Roof party Bushwick squid, seitan quinoa actually Intelligentsia Wes Anderson leggings Pinterest before they sold out fixie.

## Table of Contents

## Sources

## Topics

## Posts

<ul class="listing">
{% for post in site.categories.dissertation %}
    <li>
        <span>{{ post.date | date: "%B %e, %Y" | ordinalize  }}</span>
        <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
{% endfor %}
</ul>
