# workHORSE prerequisite dockerfile

This repo hosts the dockerfile that contains all the prerequisites for the workHORSE app. It is based on an Ubuntu v20.04 container with R v4.0.2 and package versions frozen on 24/08/2020 using the [Rstudio Package Manager](https://packagemanager.rstudio.com/client/#/repos/1/overview)

Every time a change is pushed on this repo a new docker container is built automatically at dockerhub. 

To install and push to dockerhub manually on would do,
```bash
sudo docker build -t chriskypri/workhorse-r-prerequisite .
sudo docker login
sudo docker push [docker-USERNAME]/workhorse-r-prerequisite
```
