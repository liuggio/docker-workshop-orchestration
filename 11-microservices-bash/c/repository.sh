#!/usr/bin/env bash

STORAGE=/tmp/log1.txt

function repositoryCommandAppend() {
    echo "$1" >> $STORAGE
}

function repositoryCommandsGetLastFive() {
   tail -n 5 $STORAGE
}
