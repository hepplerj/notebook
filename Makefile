preview : clean
	# Builds for local
	bundle exec jekyll build --watch --incremental --config _config.yml,_config-pow.yml

build :
	# Builds for web
	bundle exec jekyll build --config _config.yml

deploy : clean build
	rsync --checksum --stats --info=progress2 -avx -e 'ssh -p 22' --exclude-from ./rsync-exclude --delete _site/ jasonhep@jasonheppler.org:~/public_html/notebook

clean :
	rm -rf public/*
	rm -rf .sass-cache/
	rm -f .jekyll-metadata

