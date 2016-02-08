---
layout: post
title: "Calculate Borders Shared by Countries"
date: 2016-02-03 17:25
tags: [R, code, borders]
categories: 
- Code
...

Using R to find countries with shared borders. From [https://gist.github.com/andrewheiss/926b9d60a26e29f6bf32](https://gist.github.com/andrewheiss/926b9d60a26e29f6bf32). Copied here for reference.

{% highlight r %}
# Load libraries
library(dplyr)
library(tidyr)

# Map libraries
library(rgdal)
library(rgeos)
library(spdep)

# Variables for getting map shapefiles
map.url <- "http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip"
map.path <- file.path("data", "maps")
map.zip.name <- basename(map.url)
map.name <- tools::file_path_sans_ext(map.zip.name)

# Download Natural Earth shapefiles
download.file(url=map.url, file.path(map.path, map.zip.name), "auto")
unzip(file.path(map.path, map.zip.name), exdir=map.path)
file.remove(file.path(map.path, map.zip.name))
{% endhighlight %}



{% highlight text %}
## [1] TRUE
{% endhighlight %}



{% highlight r %}
# Load shapefiles
countries <- readOGR(map.path, map.name)
{% endhighlight %}



{% highlight text %}
## OGR data source with driver: ESRI Shapefile 
## Source: "Raw data/maps", layer: "ne_50m_admin_0_countries"
## with 241 features
## It has 63 fields
{% endhighlight %}



{% highlight r %}
# Extract the ISO codes and map them to the numeric row names
country.names <- data_frame(id = row.names(countries@data),
                            country_iso3 = as.character(countries@data$adm0_a3_is),
                            neighbor_iso3 = country_iso3)

# Determine which countries are neighbors
neighbor.list <- poly2nb(countries)
neighbor.matrix <- nb2mat(neighbor.list, style="B", zero.policy=TRUE)
colnames(neighbor.matrix) <- rownames(neighbor.matrix)

# Clean up and transform the neighbor matrix
all.neighbors <- as.data.frame(neighbor.matrix) %>%
  mutate(country = row.names(.)) %>%  # Convert row names to actual column
  gather(neighbor, present, -country) %>%  # Convert to long
  filter(present == 1) %>%  # Only look at cells with a match
  # Add country names
  left_join(select(country.names, -neighbor_iso3), by=c("country" = "id")) %>%
  left_join(select(country.names, -country_iso3), by=c("neighbor" = "id")) %>%
  filter(country_iso3 != "-99", neighbor_iso3 != "-99") %>%  # Remove missing countries
  select(contains("iso3"))  # Just get the ISO columns
head(all.neighbors)
{% endhighlight %}



{% highlight text %}
##   country_iso3 neighbor_iso3
## 1          CHN           AFG
## 2          IRN           AFG
## 3          PAK           AFG
## 4          TJK           AFG
## 5          TKM           AFG
## 6          UZB           AFG
{% endhighlight %}

And summarize our findings:


{% highlight r %}
neighbor.summary <- all.neighbors %>%
  group_by(country_iso3) %>%
  summarise(num = n()) %>%
  arrange(desc(num))

neighbor.summary
{% endhighlight %}



{% highlight text %}
## Source: local data frame [160 x 2]
## 
##    country_iso3   num
##           (chr) (int)
## 1           CHN    16
## 2           RUS    14
## 3           SRB    12
## 4           BRA    10
## 5           FRA    10
## 6           COD     9
## 7           DEU     9
## 8           AUT     8
## 9           TUR     8
## 10          TZA     8
## ..          ...   ...
{% endhighlight %}
