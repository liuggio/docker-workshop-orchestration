Using the swarm mode
--------------------

## Steps

1. create cluster

`./create.sh`

2. run a service 

We install a visualizer 

`docker-machine ssh first docker run -it -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock manomarks/visualizer`

open the browser to the first ip to the 8080

    docker-machine ssh first docker service create --name vote --replicas 1 -p 80:80 instavote/vote
    eval $(docker-machine env first)`
    docker service ls
    curl http://$(docker-machine ip first):80/
    curl http://$(docker-machine ip second):80/
    
    docker service scale vote=6
    
Update 1
    
    docker service update --image instavote/vote:movies vote
    
Update 2
    
    docker service update --update-parallelism 2 --update-delay 10s --image instavote/vote:indent vote
3. destroy
 

`./destroy.sh`



### Exercise 10.a

execute a deploy of our bash_d servicew

