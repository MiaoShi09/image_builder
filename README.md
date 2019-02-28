## Purpose of this Repo
* Backup Dockerfiles
* Setup Jenkins pipeline to create AionR Docker images, test them and push them to Docker hub automatically


## Expect Content
* 2 Dockerfiles to build AionR execution environment for ub18.04, ub16.04
* 2 Dockerfiles to build the images contains the latest AionR packages
* Jenkinfile to build images and push them into docker hub or other image storage system
* A shell script to trigger the testing

## Image Info
* The work directory of docker images is /run
* The runing data is located at /root/.aion
* Default Command is launching AionR to connect to Mainnet

## Manual Build Image
```
docker build --file <DockerfileName> --build-arg PACKAGE_LOCATION=<new built AionR package Location> -t <imageRepo:tag> .
```

## Integrate with Jenkins Release Build
### Expected AionR Release Flow
![Image_building_flow](./flowImages/Image_building_flow.png)
* A new Jenkinsfile will be added to AionR repo for release purpose. The last step of the new pipeline is to trigger the image building and passing the current kernel version.  

### Expected AionR Image Building Flow
![pipeline_flow](./flowImages/pipeline_flow.png)
* Test
