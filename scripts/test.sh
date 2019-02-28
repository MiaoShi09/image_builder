#!/bin/bash

node --version

cd qa-rpc
file=("smoke-test","AMO","TXTC","FTTC","bugs","precompile")
type=("http","websocket")

./ci_test_flexile.sh "${file[@]}" "${type[@]}" true
