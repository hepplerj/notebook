KnitPost <- function(site.path='/Users/jasonheppler/Dropbox/github/quals/', overwriteAll=F, overwriteOne=NULL) {
  if(!'package:knitr' %in% search()) library('knitr')

  ## Blog-specific directories.
  site.path <- site.path # directory of jekyll blog (including trailing slash)
  md.path <- paste0(site.path, "_md") # directory where your md-files reside (relative to base)
  fig.dir <- "figures/" # directory to save figures
  posts.path <- paste0(site.path, "_posts/") # directory for converted markdown files
  cache.path <- paste0(site.path, "_cache") # necessary for plots
  time_stamp = paste0(Sys.Date(), "-")

  render_jekyll(highlight = "pygments")
  opts_knit$set(base.url = '/', base.dir = site.path)
  opts_chunk$set(fig.path=fig.dir, fig.width=8.5, fig.height=5.25, dev='svg', cache=F,
                 warning=F, message=F, cache.path=cache.path, tidy=F)

  setwd(md.path) # setwd to base

  # some logic to help avoid overwriting already existing md files
  files.md <- data.frame(md = list.files(path = md.path,
                                full.names = T,
                                pattern = "\\.md$",
                                ignore.case = T,
                                recursive = F), stringsAsFactors=F)
  files.md$corresponding.md.file <- paste0(posts.path, time_stamp, basename(gsub(pattern = "\\.md$", replacement = ".md", x = files.md$md)))
  files.md$corresponding.md.exists <- file.exists(files.md$corresponding.md.file)

  ## determining which posts to overwrite from parameters overwriteOne & overwriteAll
  files.md$md.overwriteAll <- overwriteAll
  if(is.null(overwriteOne)==F) files.md$md.overwriteAll[grep(overwriteOne, files.md[,'md'], ignore.case=T)] <- T
  files.md$md.render <- F
  for (i in 1:dim(files.md)[1]) {
    if (files.md$corresponding.md.exists[i] == F) {
      files.md$md.render[i] <- T
    }
    if ((files.md$corresponding.md.exists[i] == T) && (files.md$md.overwriteAll[i] == T)) {
      files.md$md.render[i] <- T
    }
  }

  # For each md file, render markdown (contingent on the flags set above)
  for (i in 1:dim(files.md)[1]) {
    if (files.md$md.render[i] == T) {
      out.file <- knit(as.character(files.md$md[i]),
                      output = as.character(files.md$corresponding.md.file[i]),
                      envir = parent.frame(),
                      quiet = T)
      message(paste0("KnitPost(): ", basename(files.md$md[i])))
    }
  }

}

KnitPost()