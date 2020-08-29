FROM rocker/r-ver:4.0.2

LABEL maintainer "Chris Kypridemos <ckyprid@liverpool.ac.uk>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
  && apt-get install -y \
  git git-core \
	pandoc \
	pandoc-citeproc \
	&& rm -rf /var/lib/apt/lists/*

# Repo frozen on 24/08/2020. See https://packagemanager.rstudio.com/client/#/repos/1/overview
RUN install2.r -s \
  -r "https://packagemanager.rstudio.com/all/__linux__/focal/314" \
  -e -n 1 \
  bsplus colourpicker dichromat doFuture doParallel doRNG dqrng DT foreach \
  fst future future.apply gamlss.dist ggplot2 globals htmltools iterators MASS \
  plotly promises qs remotes rngtools shiny shinyBS shinydashboard shinyjs \
  shinythemes shinyWidgets viridis viridisLite wrswoR yaml data.table
RUN installGithub.r "ChristK/CKutils@8bb4c0d085a3b0b363a129e16252a32f2e528a0a"
# WORKDIR /payload/
# CMD ["R"]
