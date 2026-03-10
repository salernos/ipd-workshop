FROM bioconductor/bioconductor_docker:devel

# System dependencies needed by common workshop packages.
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libudunits2-dev \
    gfortran \
    make \
  && rm -rf /var/lib/apt/lists/*

# Install R package dependencies for the workshop.
COPY docker/install.R /tmp/install.R
RUN Rscript /tmp/install.R && rm /tmp/install.R

# Copy only the workshop materials that participants need.
RUN mkdir -p /home/rstudio/ipd-workshop/content
COPY content/ /home/rstudio/ipd-workshop/content/

# Ensure the rstudio user owns the workshop directory.
RUN chown -R rstudio:rstudio /home/rstudio/ipd-workshop

# Open RStudio in the workshop materials directory by default.
WORKDIR /home/rstudio/ipd-workshop/content
