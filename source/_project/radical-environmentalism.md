---
description: "A computational and spatial analysis of radical environmentalism."
title: "Radical Environmentalism"
status: collecting
---

**2016-04-05**

Talked to Mike Childers about collaborating on a project. Reconvening in May to hash out details.


### Workflow

Using Import.io, I scraped the *Environment & Society* archive with two passes.

1.  The first pass grabbed the title, date, and URL of each journal issue. This
    allowed me to use an R script to create a metadata guide for each of the
    journal issues.

2. The second pass from Import.io scraped links to the PDFs from the
   journal-level pages. After scraping the data, I extracted the URLs from the
   data and created a `url-clean.csv` file. That file became the input for
   `wget` to download the PDFs in bulk.

```{r}
library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)
library(rvest)
library(stringr)

#' Clean up metadata information from Environment & Society
#' 
#' The code below uses scraped data from Import.io to compile and clean up 
#' information about Earth First! journals. The first output, metadata-clean.csv,
#' provides metadata about journal titles and dates. The second output, pdf-clean.csv
#' and urls-clean.csv, provides a set of clean URLs to download the articles themselves.

# Clean up metadata information
# -----------------------------------------------------------------------------
metadata <- read_csv("metadata.csv")
# remove spaces in variables
names(metadata) <- sub(" ", "_", names(metadata))
names(metadata) <- tolower(names(metadata))
metadata.clean <- metadata %>% 
                    mutate(date_clean = dmy(date_value))
metadata.clean <- metadata.clean %>% 
                    mutate(year = year(date_clean))

# Save clean
write_csv(metadata.clean, "metadata-clean.csv", na = "")

# Load in PDF data and extract URLs
# -----------------------------------------------------------------------------
csv_data <- read_csv("pdfs.csv")

url_pattern <- "http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+"
csv_data$url_clean <- str_extract(csv_data$url, url_pattern)

# For use with wget, I need a list of just URLs
url_alone <- csv_data$url_clean
url_alone <- as.data.frame(url_alone)

write_csv(csv_data, "pdf-clean.csv", na="")
write_csv(url_alone, "urls-clean.csv", na="")
```

Using `wget` to download PDFs:

```
wget --wait=5 --random-wait -i urls-clean.csv
```

3.  Using a `Makefile`, we will OCR each of the pages of the journal to extract text and clean them up with an R script.

```
OCR_OUTPUTS := $(patsubst pdf/#.pdf, text/%.txt, $(wildcard pdf/*.pdf))
CLEAN_TEXTS := $(patsubst text/%.txt, eh-journals/%.txt, $(wildcard text/*.txt))

texts : $(CLEAN_TEXTS)

lsh : cache/corpus-lsh.rda

eh-journals/%.txt : text/%.txt
	    Rscript --vanilla scripts/clean-text.R $^ $@

text/%.txt : temp/%.txt
	    cp $^ $@

temp/%.txt : pdf/%.pdf
	    mkdir -p temp
	    @echo "\nBursting $^ into separate files"
	    pdftk $^ burst output temp/$*.page-%04d.pdf
	    @echo "\nConverting the PDFs for $^ to the image files"
	    for pdf in temp/$*.page-*.pdf ; do \
	    	convert -density 600 -depth 8 $$pdf $$pdf.png ; \
	    done
	    @echo "\nDoing OCR for each page in $^"
	    for png in temp/$*.page-*.pdf.png ; do \
	    	tesseract $$png $$png tesseract-config ; \
	    done
	    @echo "\nConcatenating the text files into $@"
	    cat temp/$*.page-*.pdf.png.txt > temp/$*.txt

.PHONY : clean
clean :
	rm -rf temp/*

.PHONY : clean-splits
clean-splits :
	rm -rf text/*
	rm -f eh-journals/*
	rm -f cache/corpus-lsh.rda

.PHONY : clobber
clobber : clean
```


### Primary Sources

- Environment & Society, [Earth First! journal collection](http://www.environmentandsociety.org/mml/collection/ef?field_subcollection_earth_first_value=All&page=1)

### Project Goals

What is it we hope to achieve with a digital methodology?

-   Using NLP to automatically extract locations, people, organizations. Are
    there patterns? Particular areas of emphasis? A lack of interests?

### TODO

-   [x] Finish the scrape of the articles from E&S
-   [ ] Reconvene with Mike in the month of May
-   [ ] Set up research notebook for hosting R scripts and visualizations
-   [s] Create a metadata spreadsheet for each of the articles in the journal issues, including date, title, author, and topics.
