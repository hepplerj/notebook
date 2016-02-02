KnitPost <- function(site.path='/Users/jasonheppler/Dropbox/github/quals/', overwriteAll=F, overwriteOne=NULL) {
  if(!'package:knitr' %in% search()) library('knitr')

  ## Blog-specific directories.
  site.path <- site.path # directory of jekyll blog (including trailing slash)
  rmd.path <- paste0(site.path, "_Rmd") # directory where your Rmd-files reside (relative to base)
  fig.dir <- "figures/" # directory to save figures
  posts.path <- paste0(site.path, "_posts/") # directory for converted markdown files
  cache.path <- paste0(site.path, "_cache") # necessary for plots
  time_stamp = paste0(Sys.Date(), "-")

  render_jekyll(highlight = "pygments")
  opts_knit$set(base.url = '/', base.dir = site.path)
  opts_chunk$set(fig.path=fig.dir, fig.width=8.5, fig.height=5.25, dev='svg', cache=F,
                 warning=F, message=F, cache.path=cache.path, tidy=F)

  setwd(rmd.path) # setwd to base

  # some logic to help avoid overwriting already existing md files
  files.rmd <- data.frame(rmd = list.files(path = rmd.path,
                                full.names = T,
                                pattern = "\\.Rmd$",
                                ignore.case = T,
                                recursive = F), stringsAsFactors=F)
  files.rmd$corresponding.md.file <- paste0(posts.path, time_stamp, basename(gsub(pattern = "\\.Rmd$", replacement = ".md", x = files.rmd$rmd)))
  files.rmd$corresponding.md.exists <- file.exists(files.rmd$corresponding.md.file)

  ## determining which posts to overwrite from parameters overwriteOne & overwriteAll
  files.rmd$md.overwriteAll <- overwriteAll
  if(is.null(overwriteOne)==F) files.rmd$md.overwriteAll[grep(overwriteOne, files.rmd[,'rmd'], ignore.case=T)] <- T
  files.rmd$md.render <- F
  for (i in 1:dim(files.rmd)[1]) {
    if (files.rmd$corresponding.md.exists[i] == F) {
      files.rmd$md.render[i] <- T
    }
    if ((files.rmd$corresponding.md.exists[i] == T) && (files.rmd$md.overwriteAll[i] == T)) {
      files.rmd$md.render[i] <- T
    }
  }

  # For each Rmd file, render markdown (contingent on the flags set above)
  for (i in 1:dim(files.rmd)[1]) {
    if (files.rmd$md.render[i] == T) {
      out.file <- knit(as.character(files.rmd$rmd[i]),
                      output = as.character(files.rmd$corresponding.md.file[i]),
                      envir = parent.frame(),
                      quiet = T)
      message(paste0("KnitPost(): ", basename(files.rmd$rmd[i])))
    }
  }

}

KnitPost()