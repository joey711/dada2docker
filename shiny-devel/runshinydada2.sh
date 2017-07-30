# The following commented-out are 
# example chunks of the run command
# that you might swap-out (for run) 
# or add (for apps, logs) as-needed.

## Remote server deployment call
# docker run -d -p 80:3838 \
## Mount your additional apps for simultaneous hosting 
# -v /yourhost/shinyapps/:/srv/shiny-server/ \
## Mount your folder for shiny-logs
# -v /yourhost/path/shinylog/:/var/log/shiny-server/ \

docker run --rm -p 3838:3838 \
    -v ~/Downloads/:/home/rstudio/Downloads/ \
    shiny-devel
