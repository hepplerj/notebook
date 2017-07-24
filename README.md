**IN DEVELOPMENT**

This thing is still a work in progress, so use it at your own risk. There are a lot of things still broken, workflows that aren't completely clear, or things that just simply don't work yet.

Or help me develop it. Feel free to issue tickets or open push requests. Be sure to consult [CONTRIBUTING](CONTRIBUTING.md) to learn about issuing tickets, and if you participate in the development of this you must abide by the [code of conduct](CODE_OF_CONDUCT.md).

# Details

## Features

-   Todo lists using the Github syntax
-   Tags and categories for linking together concepts and notes
-   Post archives, listing posts alphabetically and by date

# Set-up

At a minimum, there's a few required things. This notebook runs with Hugo + R:

- R (>=3.3.2)
- [Blogdown](https://github.com/rstudio/blogdown). Follow the [README](https://github.com/rstudio/blogdown/blob/master/README.md) to install Hugo.
- Hugo (>=0.25)

You can clone this repository:

`git clone git@github.com:hepplerj/notebook.git`

and use `make preview` to run it locally. It will load up under [localhost:4321](http://localhost:4321).

# Features to come:

- [ ] Easier linking between posts
- [ ] Better global search
- [ ] sitemap.xml and robots.txt
- [x] 404.html
- [ ] PDF export with Pandoc

# License

See LICENSE.
