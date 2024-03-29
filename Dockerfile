FROM rocker/r-ver:4.2.1

LABEL maintainer "Chris Kypridemos <ckyprid@liverpool.ac.uk>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
  && apt-get install -y \
  git git-core make zlib1g-dev libcurl4-openssl-dev libssl-dev\
  libicu-dev libjpeg-dev libpng-dev libgmp3-dev libmpfr-dev pandoc \
  pandoc-citeproc automake wget libgit2-dev libssh2-1-dev \
  && rm -rf /var/lib/apt/lists/*


# Repo frozen on August 01, 2022. See https://packagemanager.rstudio.com/client/#/repos/1/overview
RUN install2.r -s \
  -r "https://packagemanager.rstudio.com/all/__linux__/focal/2022-08-01+Y3JhbiwyOjQ1MjYyMTU7RTY0MEEyRTM" \
  -e -n 10 \
  bsplus colourpicker dichromat doFuture doParallel doRNG dqrng DT foreach \
  fst future future.apply gamlss.dist ggplot2 htmltools iterators MASS \
  plotly promises qs remotes rngtools shiny shinyBS shinydashboard shinyjs \
  shinythemes shinyWidgets viridis viridisLite wrswoR yaml data.table \
  mvtnorm gamlss.data mc2d cowplot gamlss digest piggyback

RUN installGithub.r "ChristK/CKutils"
