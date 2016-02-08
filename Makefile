%.md : _Rmd/%.Rmd _cache
	R --slave -e "set.seed(100); rmarkdown::render('$(<F)')"

build:
	jekyll build

serve:
	jekyll serve

clean:
	git clean -fdX

.PHONY: build serve clean
