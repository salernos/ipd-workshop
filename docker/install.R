options(repos = c(CRAN = "https://cloud.r-project.org"))

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  
  install.packages("BiocManager")
} 

BiocManager::install(c(
  "BiocGenerics",
  "ALL",
  "golubEsets",
  "AnnotationDbi",
  "hgu95av2.db",
  "hu6800.db",
  "MLInterfaces"
), ask = FALSE, update = FALSE)

install.packages(c(
  "ipd",
  "MASS",
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


