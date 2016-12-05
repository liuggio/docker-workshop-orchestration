#!/usr/bin/bash bash

source `pwd`/c/domain_command.sh
source `pwd`/c/repository.sh

@test "append get the last entries" {

   commandAppend do something
   commandGetLastFive | grep "do\tsomething"

   [ 1 -eq 1 ]
}