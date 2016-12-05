#!/usr/bin/env bash

if [ "$1" == "append" ]; then
  echo $2\t$3 >> "file.log"
  exit $?
fi

if [ "$1" == "tail" ]; then
  tail -n 5 "file.log"
  exit $?
fi



