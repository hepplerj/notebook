---
layout: post
title: Annexation Visualizations
tags: [spatial history]
categories:
- Code
project: machinesvalley
---

Notes on how I create the annexation visualizations for San Jose and Mountain View.

Some requirements:

- requires 1.x version of Topojson (`npm install -g topojson@1`)
- requires ogr2ogr (`brew install gdal`)

1. Create separate shapefiles for each year range (1945-1950, 1950-1955, etc.). This work is done in QGIS by selecting the features by a range of years and saving as a new shapefile. 

2. Next, convert each shapefile into a topojson file.  

{% highlight console %}
ogr2ogr \
	-f GeoJSON \
	-t_srs EPSG:4328 \
	YEAR.json \
	SHAPE.shp
{% endhighlight %}

3. Once each year range shapefile has been converted into a GeoJSON file, we merge them into a single topojson file.

{% highlight console %}
topojson \
	-o mountainview.json \
	-- \
	YEAR1.json \
	YEAR2.json
{% endhighlight %}
