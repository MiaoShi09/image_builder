#!/bin/bash
JDK_VERSION=$1 #11
BUILD_VERSION=$2 #12
if [ $# -eq 3 ]; then
  OS_VERSION=$3
else
  OS_VERSION="16"
fi

sudo docker run -dt --name ub$OS_VERSION-j$JDK_VERSION -p 30303:30303 -p 8545:8545 --network host chaionclibackup/aionr:ub$OS_VERSION-jdk$JDK_VERSION /bin/bash

echo "docker cp executive/aionr ub$OS_VERSION-j$JDK_VERSION:/"
sudo docker cp executive/aionr ub$OS_VERSION-j$JDK_VERSION:/
#sudo docker cp libs/aionLibs ub$OS_VERSION-j$JDK_VERSION:/aionr/libs
echo "docker cp builds/ub${OS_VERSION}_j${BUILD_VERSION}/aion ub$OS_VERSION-j$JDK_VERSION:/aionr/aion"
sudo docker cp builds/ub${OS_VERSION}_j${BUILD_VERSION}/aion ub$OS_VERSION-j$JDK_VERSION:/aionr/aion
echo "docker exec -it -w /aionr ub$OS_VERSION-j$JDK_VERSION /bin/bash ./custom.sh"
sudo docker exec -it -w /aionr ub$OS_VERSION-j$JDK_VERSION /bin/bash ./custom.sh
