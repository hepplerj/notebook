---
layout: note
title: "2017-06-21 - Cytoscape Scratchpad"
date: 2017-06-21 
tags: [network analysis, cytoscape]
categories: 
- Essays
genre: Essays
...

I am finally resolving to learn Cytoscape (as it seems to be gaining greater favor among digital humanities folks vs. Gephi), and I'll be journaling my experiences with Cytoscape to solidify ideas and vent without cluttering Twitter. Below is an unedited journal, created in loose form.

I'm following along with [Miriam Posner's tutorial for Cytoscape](https://github.com/miriamposner/cytoscape_tutorials) as I work through learning this.

## Notes

Preparing data works the same way as Gephi, needing an edge list with two columns for a relationship. 

- these don't have to be called **source** and **target**.

When you import an edge list into Cytoscape, you need to tell it that you're giving it the edges, not just edge attributes. It's here that we tell Cytoscape which columns are **sources** and **targets**.

Remember to hold COMMAND and click-and-drag to move around.

You can search in the network, which will highlight connected nodes.

Cytoscape comes with built-in styles to change the look of the network, under the "Style" tab.

- Style attributes can be adjusted here to customize the look of nodes, edges, and network.
- **Def.**: *default* (the default visual attributes of nodes)
- **Map.**: the *mapping* to control visual features of nodes based on their properties
- **Byp.**: *bypass*, apply style to a group of nodes I've selected

Layouts are under the "Layout" menu item.

Network analysis is under the menu item Tools > Network Analyzer > Network Analysis > Analyze Network. 

- This automatically calculates several statistics about the network, including degree, density, clustering coefficient, network diameter, and so on.

<hr>

Working with Cytoscape, I've gotten a better sense of how the software might work better than Gephi for doing network analysis with humanities data. While I might prefer using a specific language for doing some of this (e.g., R), I might start preferring and recommending Cytopscape instead for those who need more advanced network capabilities. A few things that were surprising:

- There's a lot of simplicity in the way Cytoscape handles the information.
- There's a lack of layouts, but there's a [plugin infrastructure](http://apps.cytoscape.org/apps/all) to add new ones. I'll need to look into how this works.
- Their web-based network is a little more complicated to set up than Sigma.js, but not too overwhelming.
