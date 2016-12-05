#!/usr/bin/bash bash

source `pwd`/b/repository.sh

@test "append get the last entries" {

   repositoryCommandAppend do something
   repositoryCommandsGetLastFive | grep "do\tsomething"

   [ 1 -eq 1 ]
}