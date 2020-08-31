FROM rocker/r-ver:4.0.2

LABEL maintainer "Chris Kypridemos <ckyprid@liverpool.ac.uk>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
  && apt-get install -y \
  git git-core make zlib1g-dev libcurl4-openssl-dev libssl-dev\
  libicu-dev libjpeg-dev libpng-dev libgmp3-dev libmpfr-dev pandoc \
  pandoc-citeproc wget\
  && rm -rf /var/lib/apt/lists/*
  

# Repo frozen on 24/08/2020. See https://packagemanager.rstudio.com/client/#/repos/1/overview
RUN install2.r -s \
  -r "https://packagemanager.rstudio.com/all/__linux__/focal/314" \
  -e -n 1 \
  bsplus colourpicker dichromat doFuture doParallel doRNG dqrng DT foreach \
  fst future future.apply gamlss.dist ggplot2 htmltools iterators MASS \
  plotly promises qs remotes rngtools shiny shinyBS shinydashboard shinyjs \
  shinythemes shinyWidgets viridis viridisLite wrswoR yaml data.table
RUN installGithub.r "Rdatatable/data.table@be6c1fc66a411211c4ca944702c1cab7739445f3"
RUN installGithub.r "ChristK/CKutils@8bb4c0d085a3b0b363a129e16252a32f2e528a0a"

RUN mkdir workHORSE
RUN cd workHORSE
# Get from pCloud necessary files that cannot be stored on GitHub due to their large size 
RUN wget -c https://filedn.com/lj14yWNHbMFXQ0F4Fkti6a8/workHORSE_data_files.tar -O - | tar -x
# RUN rm DELETEms*

# WORKDIR /payload/
# CMD ["R"]
