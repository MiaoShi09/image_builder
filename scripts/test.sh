#!/bin/bash

node --version

cd qa-rpc
file=("smoke-test","AMO","TXTC","FTTC","bugs","precompile")
#file=("bugs")
type=(http,websocket)

./ci_test_flexible.sh "${file[@]}" "${type[@]}" true
