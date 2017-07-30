
install.packages("devtools")
library("devtools")

# Bioconductor
source("https://bioconductor.org/biocLite.R")
deppkgs = c(
  "dada2",
  "DT",
  "jsonlite",
  "magrittr",
  "markdown",
  "RColorBrewer",
  "scales")
biocLite(deppkgs, suppressUpdates = TRUE)

# Now install the devel/shiny version of dada2
install_github("benjjneb/dada2", ref = "shiny")

install_github("joey711/shinyFiles")
