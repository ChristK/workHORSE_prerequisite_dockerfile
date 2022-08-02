# workHORSE prerequisite dockerfile

This repo hosts the dockerfile that contains all the prerequisites for the workHORSE app. It is based on an Ubuntu container with R v4.2.1 and package versions frozen on 01/08/2022 using the [Rstudio Package Manager](https://packagemanager.rstudio.com/client/#/repos/1/overview)

This  docker container is required for the branch 'master' of the workHORSE app.

To install and push to DockerHub manually one would do,
```bash
sudo docker build --no-cache -t [docker-USERNAME]/workhorse-r-prerequisite:latest . # replace [docker-USERNAME] with your docker username
sudo docker login
sudo docker push [docker-USERNAME]/workhorse-r-prerequisite:latest # replace [docker-USERNAME] with your docker username
```
