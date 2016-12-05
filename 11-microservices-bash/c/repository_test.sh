#!/usr/bin/bash bash

source `pwd`/c/repository.sh

@test "append get the last entries" {

   repositoryCommandAppend ciao
   repositoryCommandsGetLastFive | grep "ciao"

   [ 1 -eq 1 ]
}