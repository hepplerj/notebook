preview :
	Rscript -e "blogdown::serve_site()"

build : 
	Rscript -e "blogdown::build_site()"

deploy : build
	rsync --checksum --stats -avx -e 'ssh -p 22' --exclude-from ./rsync-exclude --delete public/ jasonhep@jasonheppler.org:~/public_html/notebook
