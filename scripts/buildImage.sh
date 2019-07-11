#!/bin/bash
PACKAGE_NAME=$1
echo $PACKAGE_NAME

mkdir executive || echo "executive folder exist"
cp -r ../package/$PACKAGE_NAME executive/$PACKAGE_NAME

docker build --file Dockerfiles/Dockerfile_aionr_0.2 --build-arg PACKAGE_LOCATION=executive/$PACKAGE_NAME -t blockade/aionr .

rm -r executive/$PACKAGE_NAME
