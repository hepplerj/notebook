---
layout: post
title: "Superfund Sites and Income by Census Tract"
date: 2016-02-10 08:07
tags: [R, Superfund, Santa Clara County, dissertation, mapping, GIS, Silicon 
Valley]
categories: 
- Code
...

* Table of Contents
{:toc}




{% highlight r %}
###--------------------------------------------------
### Variables
###--------------------------------------------------

# Census data average incomes
income.median.1949 = 3689
income.median.1959 = 7417
income.median.1969 = 12456
income.median.1979 = 23369
income.median.1989 = 48115

###--------------------------------------------------
### Data prep
###--------------------------------------------------

# Population
sccpop.1980csv <- read.csv("/Users/jasonheppler/Dropbox/acad/data/census-data/nhgis0011_ds104_1980_tract.csv", stringsAsFactors = FALSE)
sccpop.1980csv <- sccpop.1980csv[sccpop.1980csv$COUNTY=="Santa Clara",c("GISJOIN","STATE","COUNTY","C9D001","C9D002","C9D003","C9D004","C9D005","C9D006","C9D007","C9D008","C9D009","C9D010","C9D011","C9D012","C9D013","C9D014","C9D015")]
sccpop.1980csv <- sccpop.1980csv %>% mutate(totalWhite = C9D001)
sccpop.1980csv <- sccpop.1980csv %>% mutate(totalMinority = C9D002 + C9D003 + C9D004 + C9D005 + C9D006 + C9D007 + C9D008 + C9D009 + C9D010 + C9D011 + C9D012 + C9D013 + C9D014 + C9D015)
sccpop.1980csv <- sccpop.1980csv %>% mutate(total = totalWhite + totalMinority)
sccpop.1980csv <- sccpop.1980csv[sccpop.1980csv$COUNTY=="Santa Clara", c("GISJOIN","STATE","COUNTY","totalWhite","totalMinority","total")]

# Income
sccincome.1980csv <- read.csv("/Users/jasonheppler/Dropbox/acad/data/census-data/income/nhgis0018_ds107_1980_tract.csv", stringsAsFactors = FALSE)
sccincome.1980csv <- sccincome.1980csv[sccincome.1980csv$COUNTY=="Santa Clara",c("GISJOIN","STATE","COUNTY","DIE001")]
names(sccincome.1980csv)[names(sccincome.1980csv)=="DIE001"] <- "medianIncome"

scc.joined.1980csv <- join(sccincome.1980csv, sccpop.1980csv, by = "GISJOIN")

###--------------------------------------------------
### Shapefile prep (read, convert projection, and create DF)
###--------------------------------------------------

wgs.84 <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

catracts.1980.shp <- readOGR("/Users/jasonheppler/Dropbox/research-data/nhgis-shapefiles/us-tracts/", "US_tract_1980")
{% endhighlight %}



{% highlight text %}
## OGR data source with driver: ESRI Shapefile 
## Source: "/Users/jasonheppler/Dropbox/research-data/nhgis-shapefiles/us-tracts/", layer: "US_tract_1980"
## with 42917 features
## It has 6 fields
{% endhighlight %}



{% highlight r %}
catracts.1980.shp <- spTransform(catracts.1980.shp, CRS(wgs.84))
catracts.1980.shp@data$id <- rownames(catracts.1980.shp@data)
catracts.1980 <- fortify(catracts.1980.shp)
catracts.1980.df <- join(catracts.1980, catracts.1980.shp@data, by="id")

###--------------------------------------------------
### Data calculations
###--------------------------------------------------

# Calculate which tracts have higher income white/minority, 
# and lower income white/minority, based off average
scc.joined.1980csv$popMajority <- ifelse(scc.joined.1980csv$totalMinority > scc.joined.1980csv$totalWhite, "minority", "white")
scc.joined.1980csv$incomeAverage <- ifelse(scc.joined.1980csv$medianIncome > income.median.1979, "Higher income", "Lower income")
scc.joined.1980csv$incomeByRace <- do.call(paste, scc.joined.1980csv[c("incomeAverage", "popMajority")])

# Join shapefile and data
merge.1980.shp <- join(catracts.1980.df, scc.joined.1980csv, by="GISJOIN", type="full")
tracts.1980.shp <- merge.1980.shp[ which(merge.1980.shp$COUNTY=='Santa Clara'), ]

# Superfunds
scc.superfunds.1980 <- read.csv("/Users/jasonheppler/Dropbox/acad/machinesvalley/htdoc/data-files/ca-pollution/ca_superfund.csv", sep=",", header=T)
scc.toxics.1980 <- read.csv("/Users/jasonheppler/Dropbox/acad/machinesvalley/htdoc/data-files/ca-pollution/ca_toxic_sites.csv", sep=",", header=T)

###--------------------------------------------------
### Map: Income by type
###--------------------------------------------------
map <- get_map("Santa Clara, CA", zoom = 11)
scc.incomerace.1980 <- ggmap(map) + geom_polygon(data=tracts.1980.shp,
                                     aes(map_od = id, x=long, y=lat, group=group, fill=incomeByRace),
                                     size=0.01,
                                     color="white",
                                     alpha=0.6)

# Theme and presentation
scc.incomerace.1980 +
  theme_map() +
  scale_fill_brewer("Income", type="qual", palette="Spectral", na.value="grey") + 
  geom_point(data=scc.superfunds.1980,
             aes(x=longitude, y=latitude),
             alpha=1,
             fill=NA,
             color="black",
             stroke=1.5,
             pch=21,
             size=6,
             shape=21) +
  geom_point(data=scc.toxics.1980,
             aes(x=longitude, y=latitude),
             alpha=1,
             fill="red",
             pch=21,
             size=2) +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.position = c(0.05, 0.05), # put the legend inside the plot area
        legend.justification = c(0, 0),
        legend.background = element_rect(color = F, fill = "white")
  ) 
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/figures/unnamed-chunk-1-1.svg) 

Polluted sites in Santa Clara County showing low-income and minority neighborhoods by Census tract, c. 1980. Low-income is defined as areas below the [county median](http://www.bayareacensus.ca.gov/bayarea.htm) of $23,369, and minority is defined as neighborhoods that have a greater proportion of minority households. Categories derived from the U.S. Census. Large black circles represent [Superfund sites](https://github.com/hepplerj/machinesvalley/blob/gh-pages/data-files/ca-pollution/ca_superfund.csv), smaller red circles represent identified [toxic or chemical leaks and spills](https://github.com/hepplerj/machinesvalley/blob/gh-pages/data-files/ca-pollution/ca_toxic_sites.csv).
