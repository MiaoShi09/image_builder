#!/bin/bash

node --version

cd ../../chaion_qa
file=("smoke-test","AMO","TXTC","FTTC","bugs","precompile")
type=(http,websocket)

./ci_test_flexible.sh "${file[@]}" "${type[@]}" false
