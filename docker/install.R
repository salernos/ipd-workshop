options(repos = c(CRAN = "https://cloud.r-project.org"))

install.packages(c(
  "ipd",
  "broom",
  "tidyverse",
  "future",
  "furrr",
  "patchwork",
  "scales",
  "janitor",
  "GGally",
  "randomForest",
  "ranger",
  "mgcv",
  "pROC",
  "DALEX",
  "neuralnet",
  "partykit"
))

if (!requireNamespace("BiocManager", quietly = TRUE)) {

  install.packages("BiocManager", repos="http://cran.rstudio.com/")
} 

BiocManager::install(c(
  "ALL",
  "golubEsets",
  "AnnotationDbi",
  "hgu95av2.db",
  "hu6800.db",
  "MLInterfaces"
), ask = FALSE, update = FALSE)
