#!/bin/bash
VOLUME_LOC=$1
CONFIG=$2
echo $VOLUME_LOC

cat ${CONFIG}.template.txt
sed "s/_CURRENT_DIR/${VOLUME_LOC}/g" < ${CONFIG}.template.txt > ${CONFIG}_local.yaml
