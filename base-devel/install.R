# install dependencies
message("Installing R dependencies ...:\n")

################################################################################
# Check that the currently-installed version of R
# is at least the minimum required version.
# If this condition is not met, build should fail,
# and upstream build in the Dockerfile should define the R installation.
################################################################################
R_min_version = "3.4.0"
R_version = paste0(R.Version()$major, ".", R.Version()$minor)
if(compareVersion(R_version, R_min_version) < 0){
  stop("You do not have the latest required version of R installed.\n", 
       "Launch should fail.\n",
       "See: http://cran.r-project.org/ and update your version of R.")
} else {
  message("R version looks okay:\n", R.version$major, ".", R.version$minor)
}

################################################################################
# Make sure devtools is installed to help with installation of
# local, custom, or non-canonical repo (e.g. github) packages.
################################################################################
if(!require("devtools")){
  install.packages("devtools")
}
if(
  compareVersion(a = as.character(packageVersion("devtools")),
                 b = "1.13.2") < 0
){
  message("\nUpdating devtools package to latest release version...\n")
  install.packages("devtools")
}

################################################################################
# Define function to install missing or old packages via biocLite
################################################################################
install_missing_packages = function(pkg, version = NULL, verbose = TRUE){
  availpacks = .packages(all.available = TRUE)
  source("http://bioconductor.org/biocLite.R")
  missingPackage = FALSE
  if(!any(pkg %in% availpacks)){
    if(verbose){
      message("The following package is missing.\n",
              pkg, "\n",
              "Installation will be attempted...")
    }
    missingPackage <- TRUE
  }
  if(!is.null(version) & !missingPackage){
    # version provided and package not missing, so compare.
    if( compareVersion(a = as.character(packageVersion(pkg)),
                       b = version) < 0 ){
      if(verbose){
        message("Current version of package\n", 
                pkg, "\t", 
                packageVersion(pkg), "\n",
                "is less than required.
                Update will be attempted.")
      }
      missingPackage <- TRUE
      }
  }
  if(missingPackage){
    biocLite(pkg, suppressUpdates = TRUE)
  }
}

################################################################################
# Define list of package names, their required versions, and install them.
################################################################################
deppkgs = c(
  Biostrings = "2.44.1",
  docopt = "0.4.5",
  data.table = "1.10.4",
  ggplot2 = "2.2.1",
  magrittr = "1.5",
  ShortRead = "1.34.0")
# Loop on package check, install, update
pkg1 = mapply(install_missing_packages,
              pkg = names(deppkgs), 
              version = deppkgs,
              MoreArgs = list(verbose = TRUE), 
              SIMPLIFY = FALSE,
              USE.NAMES = TRUE)

################################################################################
# Custom installation:
################################################################################
# install latest dada2 from GitHub
devtools::install_github("benjjneb/dada2")

################################################################################
# Check dada2 package version
################################################################################
message("dada2 package version:\n", packageVersion("dada2"))

################################################################################
