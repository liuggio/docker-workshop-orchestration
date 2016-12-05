#!/usr/bin/env bash

ENV=${ENV:dev}

function commandCreate() {
  if [ $# -ne 2 ]; then
    echo "a command need a title and a description"
    exit 1
  fi

  echo -e "$1\t$2"
}

function commandAppend() {
    repositoryCommandAppend "$(commandCreate $1 $2)"
}

function commandGetLastFive() {
   repositoryCommandsGetLastFive
}
