# Docker DADA2

This repo contains docker build instructions for images:

- base -- release version of dada2 -- joey711/dada2-base
- base-devel -- development version of dada2 from github -- joey711/dada2-base-devel
- rstudio-devel -- RStudio Server image with devel dada2 -- joey711/dada2-rstudio-devel
- shiny-devel -- Shiny-dada2 app pre-installed on Shiny-Server image -- joey711/dada2-shiny-devel


## Shiny-rstudio

To host RStudio Server with dada2-devel pre-installed

```
docker run -d -p 8787:8787 -v ~:/home/rstudio/ joey711/dada2-rstudio-devel
```

Where `~` can be replaced by a local (host) directory of your choice.
You can also add `-v` args for making additional folders available in your Rstudio session.

## Shiny-dada2

The run invocation has the following pattern (see the included runshinydada2.sh file for additional tips):

```
docker run --rm -p 3838:3838 \
    -v ~/Downloads/:/home/rstudio/Downloads/ \
    joey711/dada2-shiny-devel
```

Where `~/Downloads/` should be replaced by a data directory on your machine that you want to "explore" with Shiny-dada2.
