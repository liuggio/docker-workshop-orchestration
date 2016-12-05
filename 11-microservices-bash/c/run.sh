#!/usr/bin/env bash

source ./repository.sh

if [ "$1" == "append" ]; then
  repositoryCommandAppend $2
  exit $?
fi

if [ "$1" == "tail" ]; then
  repositoryCommandsGetLastFive
  exit $?
fi



