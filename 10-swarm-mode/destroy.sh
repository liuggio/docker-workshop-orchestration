#!/bin/bash

eval $(docker-machine env --no-proxy -u)
docker-machine rm -f first second
