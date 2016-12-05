#!/usr/bin/env bash

STORAGE=/tmp/log.txt

function repositoryCommandAppend() {
    echo -e "$1\t$2" >> $STORAGE
}

function repositoryCommandsGetLastFive() {
   tail -n 5 $STORAGE
}
