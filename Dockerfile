FROM rocker/rstudio:4.4.1

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

COPY docker/install.R /tmp/install.R
RUN Rscript /tmp/install.R && rm /tmp/install.R

# Make workshop materials available immediately in RStudio.
COPY . /home/rstudio/ipd-workshop
RUN chown -R rstudio:rstudio /home/rstudio/ipd-workshop

WORKDIR /home/rstudio/ipd-workshop
