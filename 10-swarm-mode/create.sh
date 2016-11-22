#!/bin/bash

docker-machine create -d virtualbox first &
docker-machine create -d virtualbox second &

wait

echo "-----------------"
echo "docker-machine ssh first docker swarm init --listen-addr $(docker-machine ip first) --advertise-addr  $(docker-machine ip first)"
docker-machine ssh first docker swarm init --listen-addr $(docker-machine ip first) --advertise-addr  $(docker-machine ip first)

echo "token: `docker-machine ssh first docker swarm join-token worker -q`"

echo "-----------------"
echo "docker-machine ssh second docker swarm join --token $(docker-machine ssh first docker swarm join-token worker -q) $(docker-machine ip first)"
docker-machine ssh second docker swarm join --token $(docker-machine ssh first docker swarm join-token worker -q) $(docker-machine ip first)

echo "-----------------"
echo "docker-machine ssh first docker run -it -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock manomarks/visualizer"
docker-machine ssh first docker run -it -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock manomarks/visualizer

echo "-----------------"
echo "docker-machine env first"
docker-machine env first