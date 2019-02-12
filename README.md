## Purpose of this Repo
* Backup Dockerfiles
* Setup Jenkins pipeline to create AionR Docker images and push them to Docker hub automatically

## Expect Content
* 2 Dockerfiles to build AionR execution environment for ub18.04, ub16.04
* 2 Dockerfiles to build the images contains the latest AionR packages
* Jenkinfile to build images and push them into docker hub or other image storage system

```
docker build --file <DockerfileName> --build-arg PACKAGE_LOCATION=<new built AionR package Location> -t <name:tag> .
```

notes: readlink file
