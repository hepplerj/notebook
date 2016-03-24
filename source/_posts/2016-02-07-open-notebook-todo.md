---
layout: post
title: "Open Notebook Todo"
date: 2016-02-07 21:26
tags: [admin]
categories: 
- Administrative
...



## Notebook Todo

There are a few things to think about further and fix for the notebook:

- [ ] Finding a better way to handle internal linking.
- [ ] Figure out a better method for maintaining `_post` and `_md` files and keep in sync for easier local reading and scanning.

## Tweaks

### Wikipedia Style External Link Markers

Thanks to Lincoln Mullen for creating this bit of CSS, which allows me to see links that exist outside the notebook similar to the way Wikipedia adds a special icon to external pages:

{% highlight css %}
/* external links */
a[href * ="//"]:not([href * ="localhost"]) {
    background-position: center right;
    background-repeat: no-repeat;
    background-image: linear-gradient(transparent, transparent), url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwIiBoZWlnaHQ9IjEwIj48ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtODI2LjQyOSAtNjk4Ljc5MSkiPjxyZWN0IHdpZHRoPSI1Ljk4MiIgaGVpZ2h0PSI1Ljk4MiIgeD0iODI2LjkyOSIgeT0iNzAyLjMwOSIgZmlsbD0iI2ZmZiIgc3Ryb2tlPSIjMDZjIi8+PGc+PHBhdGggZD0iTTgzMS4xOTQgNjk4Ljc5MWg1LjIzNHY1LjM5MWwtMS41NzEgMS41NDUtMS4zMS0xLjMxLTIuNzI1IDIuNzI1LTIuNjg5LTIuNjg5IDIuODA4LTIuODA4LTEuMzExLTEuMzExeiIgZmlsbD0iIzA2ZiIvPjxwYXRoIGQ9Ik04MzUuNDI0IDY5OS43OTVsLjAyMiA0Ljg4NS0xLjgxNy0xLjgxNy0yLjg4MSAyLjg4MS0xLjIyOC0xLjIyOCAyLjg4MS0yLjg4MS0xLjg1MS0xLjg1MXoiIGZpbGw9IiNmZmYiLz48L2c+PC9nPjwvc3ZnPg==);
    padding-right: 13px;
}
{% endhighlight %}

### Todo Lists

I often write to-do lists in Markdown, especially for things I plan to go through systematically. Borrowing from Lincoln Mullen, I have a way to quickly scan my to-do lists. In Markdown, my lists look like this:

{% highlight text %}
- [ ] Not started
- [s] Started
- [x] Finished
{% endhighlight%}

Which results in:

- [ ] Not started
- [s] Started
- [x] Finished

I'm using this script, which relies on jQuery:

{% highlight javascript %}

    <script type="text/javascript">
      /* <![CDATA[ */
      \$(document).ready(function() {    
        \$("li:contains('[ ]')").html(function(_, html) {
          return html.replace('[ ]', '<span style="color:red;">☐</span>');
        });
        \$("li:contains('[s]')").html(function(_, html) {
          return html.replace('[s]', '<span style="color:gold;">☐</span>');
        });
        \$("li:contains('[x]')").html(function(_, html) {
          return html.replace('[x]', '<span style="color:green;">☑</span>');
        })
      });
      /* ]]> */
    </script>
{% endhighlight%}

