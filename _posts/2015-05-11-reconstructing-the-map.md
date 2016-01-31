---
layout: post
title: "Reconstructing the Map"
date: Mon May 11 16:18:56 2015
tags: [conference, spatial history]
categories:
- Essays
---

Ben Schmidt
CESTA, 10:30a--12p

Schmidt, "Reconstructing the Map: Statistics, Statecraft, and Data
Visualization in Nineteenth-Century America"

1. Data is a historical artifact

- we're poor readers of data

2. Statistics is the domain of the state and other bureaucracies

- Statistics before the 1980s driven by the needs of the US government

Title a spin on Harley, "[Deconstructing the Map](http://quod.lib.umich.edu/p/passages/4761530.0003.008/--deconstructing-the-map?rgn=main;view=fulltext)"

How artifacts represent power and embedded social values.

When maps are constructed algorithmically, critical analysis ls left on the table.

Shipping logs -- climate metadata, whaling logbooks

Starting with his fantastic [whaling logs](http://sappingattention.blogspot.com/2012/10/logbooks-and-long-history-of.html) visualization.

- Originally created for wind and currents in the nineteenth century
- Matthew Maury

What can we do with this data that Maury and the German, British, US states were doing with it?

- Shipping times reconstruction, e.g.
- [Whaling visualization](https://www.youtube.com/watch?v=Tn7fQ5mYHPA)
- This is how administrators "saw" the world. Not grounded predominantly in things like the China trade; it was the Pacific as a site of resource extraction.
- whaling-as-resource-extraction
- The history of digitization is interwoven in this story of data collection

New forms of displaying historical information

- one form is interactivity

The Census and the Frontier

- Citing Turner's frontier thesis
- Turner spends a lot of time on the Census bulletin and the maps published in
  the reports
- He was representing the views of Francis Amasa Walker (director) and Henry
  Gannett (geographer), of the Census Bureau
- Citing the Census Atlases (Internet Archive embed)
- We know Turner read these.
- Walker's treatis on land
- The maps are about expanding national progress.
- These maps are a touchstone in the data viz community. The color scheme, the
  "old" colors, widely available reprints.
- This is an opportunity for historians
	- data visualization is intensely interested in its own history
	- looks at the 19th c. as a golden age of dataviz
	- Tufte's books are essentially compilations of 19th c. works.
- Turner: "the maps of the census reports show an uneven advance of the
  farmer's frontier, with tongues of settlement pushed forward and with
  indentations...."
	- the Census bureau is not tracking population figures, however. Historians
	  talk about these frontier lines but it has nothing to do with the actual
	  way the Census bureau collected information. It's foreign to what we know
	  about population density.
	- Population density follows railroads as much as rivers; but the story is
	  still about the farmer on the frontier.
	- Kernel bandwidth estimator
- Why a rush to declare the frontier closed?
	- interests of the State itself.
	- the color scheme changes on the maps itself.
	- agendas of Walker, Gannett
		- immigration restriction
			- Walker a proponent of immigration restriction
			- Henry Cabbot Lodge argued for restriting immigration (see
			  *Frontier Town*, reproducing Turner and Walker arguments)
			- Madison Grant, Passing of the Great Race (1916) -- borrows from
			  the language of Walker, Turner, Gannett. Same assumptions, same
			  visual vocabulary.
		- closing of Indian Country
			- Reports on the Indian "question" and the frontier line as
			  a specific line--indefensible.
			- Scholarship on Walker and Gannett sort of mention this, but one
			  of the ironies of the 1890 maps -- the Dawes Act, a number of
			  Indians are folded into the Constitutional Population of the US.
			  Indians didn't vanish -- they were counted as part of the
			  civilized population.
- 1890 Census famous for a few reasons
	- Turner Census
		- declared closed
	- Exclusion Census
		- 1923 and 1924 immigration restriction acts used the Census to enact
		  new restrictions
	- Punchcard Census
		- The first census collected by computational means.
		- Statistical obsession for control.
	- The Lost Census
		- none of the original schedules survived
		- the statistical authority of Gannett and Walker says something about
		  the schedule documents. They were simply thrown out, not burned up.
		  Census bureau seen as exhaustive, so they trusted the statistics.
- Census Bureau's "mean population" map
	- Vox's Bureau of Census statistics for mean center population.
	- nothing about population distributions.

Historians need to reinvest into statistical data collection

- not practices of science

Turner, "[Western State Making in the Revolutionary
Era](http://www.jstor.org/stable/1833651)," *AHR* vol. 1 issue 1

We need to learn to read these artifacts of statistical culture with the same
care we bring to visual culture.

# Q&A

Richard White: In the late 1880s, bringing in western states which changes
political power. 1890 Census shows that area is populated, conveniently. It's
not about maintaining Republican control of the Senate, or so the argument
goes. Does Ben see that?

- Hasn't seen that yet. Harrison's interest in preserving control in the
  Senate?
- Hasn't seen anything about individual state populations. No particular
  answer yet.

Ron: The significance of Turner's thesis, and the immigration laws. Is there an
attention towards Western states and the Chinese population in the 1880s?

- There isn't much because after the Exclusion Act they see it as something
  that's been "solved."
- The volume of immigration coming from Europe is a greater concern for
  Walker.
- But hasn't seen anything focused on Asian populations; it's Eastern
  Europeans and Indians.

Talk more about Walker's methodology and how he determined settlements away
from county boundaries to the tongues of settlement?

- Can't really, there are no records that indicate those methodologies.
- Iso-thermal lines

Data visualization really begins in 1890, but are there precursor forms of
analysis that lead up to that?

- Inside the Census Bureau, there are county-level results. They're working
  from those for their maps.
- For cartographic practices, 1870 was the first Census atlas. The earliest
  precursor for these is Moses Greenleaf, atlas of Maine that includes
  population density lines and center-of-population and
  center-of-economic-activity markers.
- The early history of data viz is strange, merchants setting these up as
  public ventures.
- Prussian cartographers getting shunted into the Census Bureau

The narrative provided by the maps. The U.S. Census is untrustworthy before the
1870s before the major reforms in the Census office.

These are rhetorical constructions. To what extent did the Census think of what
they were doing in scientific terms? Is this a kind of science?

- They see it as social scientific.
- Much of this work is tied to research universities.
- It's political: it was brought into a scientific framework they laid out.
  Also tied into history of medicine.

Geoff: Will he be publishing the map online?

- It will be soon, for the DH Conference probably.
- We need to be invested in producing visualizations that tell a story
  compellingly.
- Polar coordinates. Kernel density for county level data.

Karl: Effectively critique blobs, and yet he uses blobs with kernel density.
They in fact lie about all sorts of things. Is it the "pretty" factor that
drives us to these maps?

- The county maps are more useful.
- The blobs are useful for seeing when things fail even on the terms in
  which they lay out. What are the mechanics by which Walker drew these
  lines? It's not in the archives, but I can iterate through them to
  recreate the algorithms he came up with.
- More useful to look at the county data for the data that we actually
  have.

Nicole: We need to be embedding historical ways of thinking into visualization.
Journalism is getting further ahead of historians, but the needs are different.

- Ben disagrees. The journalists are more market-driven in their medium
  that they publish. Historians are operating more slowly.
- But data visualization is not a subset of computer science.
- *Grammar of Graphics*; Hadley Wickham
- NB: Not sure I'm with Ben on this one. I think our collaborations matter
  a great deal, whether its CS, journalism, or designers.

# Other Notes

My [Storify](https://storify.com/jaheppler/ben-schmidt-reconstructing-the-map) tweets.

