FROM rocker/r-ver:4.0.3

LABEL maintainer "Chris Kypridemos <ckyprid@liverpool.ac.uk>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
  && apt-get install -y \
  git git-core make zlib1g-dev libcurl4-openssl-dev libssl-dev\
  libicu-dev libjpeg-dev libpng-dev libgmp3-dev libmpfr-dev pandoc \
  pandoc-citeproc automake wget\
  && rm -rf /var/lib/apt/lists/*
  

# Repo frozen on March 1, 2021. See https://packagemanager.rstudio.com/client/#/repos/1/overview
RUN install2.r -s \
  -r "https://packagemanager.rstudio.com/all/1623553" \
  -e -n 10 \
  bsplus colourpicker dichromat doFuture doParallel doRNG dqrng DT foreach \
  fst future future.apply gamlss.dist ggplot2 htmltools iterators MASS \
  plotly promises qs remotes rngtools shiny shinyBS shinydashboard shinyjs \
  shinythemes shinyWidgets viridis viridisLite wrswoR yaml data.table \
  mvtnorm gamlss.data mc2d cowplot gamlss
  
RUN installGithub.r "ChristK/CKutils@8bb4c0d085a3b0b363a129e16252a32f2e528a0a"

RUN mkdir /root/workHORSE
# Get from pCloud necessary files that cannot be stored on GitHub due to their large size 
RUN wget -c https://filedn.com/lj14yWNHbMFXQ0F4Fkti6a8/workHORSE_data_files.tar -O - | tar -x -C /root/workHORSE/
