%.md : _Rmd/%.Rmd _cache
	R --slave -e "set.seed(100); rmarkdown::render('$(<F)')"

build:
	jekyll build

serve:
	jekyll serve --watch --drafts --incremental --config _config.yml,_config-pow.yml

clean:
	git clean -fdX

nuke:
	rm -rf public/

.PHONY: build serve clean
