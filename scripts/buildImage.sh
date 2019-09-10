#!/bin/bash
PACKAGE_NAME=$1
echo $PACKAGE_NAME
SYS_LIB="/usr/lib/x86_64-linux-gnu"
libs=(
 "libboost_filesystem.so.1.65.1"
 "libboost_program_options.so.1.65.1"
 "libboost_regex.so.1.65.1"
 "libboost_system.so.1.65.1"
 "libLLVM-4.0.so.1"
 "libedit.so.2"
# "libbsd.so.0"
## libraries need to be removed after merging with rf branch 190712
# "libzmq.so.5"
# "libsodium.so.23"
# "libpgm-5.2.so.0"
# "libnorm.so.1"
 )

mkdir executive || echo "executive folder exist"
cp -r ../package/$PACKAGE_NAME executive/$PACKAGE_NAME
for file in ${libs[@]}
do
 echo copy $file
 if !(test -f $SYS_LIB/$file)
 then
   echo Error: $file not found
   exit 2
 fi
 cp $SYS_LIB/$file libs/
done

docker build --file Dockerfiles/Dockerfile_aionr_0.2 --build-arg PACKAGE_LOCATION=executive/$PACKAGE_NAME -t blockade/aionr .

rm -r executive/$PACKAGE_NAME
