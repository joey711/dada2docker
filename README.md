# Docker DADA2

This repo contains docker build instructions for images:

- [base](https://github.com/joey711/dada2docker/tree/master/base) -- release version of dada2 -- [joey711/dada2-base](https://hub.docker.com/r/joey711/dada2-base/)
- [base-devel](https://github.com/joey711/dada2docker/tree/master/base-devel) -- development [version of dada2](https://github.com/benjjneb/dada2) -- [joey711/dada2-base-devel](https://hub.docker.com/r/joey711/dada2-base-devel/)
- [rstudio-devel](https://github.com/joey711/dada2docker/tree/master/rstudio-devel) -- RStudio Server image with devel dada2 -- [joey711/dada2-rstudio-devel](https://hub.docker.com/r/joey711/dada2-rstudio-devel/)
- [shiny-devel](https://github.com/joey711/dada2docker/tree/master/shiny-devel) -- Shiny-dada2 app pre-installed on Shiny-Server image -- [joey711/dada2-shiny-devel](https://hub.docker.com/r/joey711/dada2-shiny-devel/)

## Quick Start

1. [Install Docker](https://docs.docker.com/engine/installation/) if you haven't already.
2. `docker run <docker params ...> joey/dada2-<ImageName>`

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

- Where `~/Downloads/` should be replaced by a data directory on your machine that you want to "explore" with Shiny-dada2.
- Point a browser window to `0.0.0.0:3838` while the container is running.
- To end, do `CTL-C` at the terminal, or `docker container kill <container name>`. `docker container ls` will show you the name.

