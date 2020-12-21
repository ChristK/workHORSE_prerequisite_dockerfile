# workHORSE prerequisite dockerfile

This repo hosts the dockerfile that contains all the prerequisites for the workHORSE app. It is based on an Debian container with R v4.0.3 and package versions frozen on 20/10/2020 using the [Rstudio Package Manager](https://packagemanager.rstudio.com/client/#/repos/1/overview)

Every time a change is pushed on this repo a new docker container is built automatically at dockerhub. 

To install and push to dockerhub manually on would do,
```bash
sudo docker build -t [docker-USERNAME]/workhorse-r-prerequisite . # replace [docker-USERNAME] with your docker usename
sudo docker login
sudo docker push [docker-USERNAME]/workhorse-r-prerequisite # replace [docker-USERNAME] with your docker usename
```
