preview : clean
	# Builds for local
	bundle exec jekyll build --watch --incremental --config _config.yml,_config-dev.yml

build :
	# Builds for web
	bundle exec jekyll build --config _config.yml

rebuild : clean build

deploy : clean build
	rsync --checksum --stats -avx -e 'ssh -p 22' --exclude-from ./rsync-exclude --delete _site/ jasonhep@jasonheppler.org:~/public_html/notebook

clean :
	rm -rf public/*
	rm -rf .sass-cache/
	rm -f .jekyll-metadata

