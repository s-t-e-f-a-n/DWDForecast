#!/bin/bash

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

cd $SCRIPT_DIR
echo $SCRIPT_DIR

python3 ./dwdforecast.py

while true ; do wait ; done


