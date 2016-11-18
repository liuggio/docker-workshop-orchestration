Cap 4. Let's create a Dockerfile
--------------------------------

    Docker commands
    Use the Docker command line
    dockerd
    attach
    build
    commit
    cp
    create
    deploy
    diff
    events
    exec
    export
    history
    images
    import
    info
    inspect
    kill
    load
    login
    logout
    logs
    network connect
    network create
    network disconnect
    network inspect
    network ls
    network rm
    node demote
    node inspect
    node ls
    node promote
    node ps
    node rm
    node update
    pause
    plugin disable
    plugin enable
    plugin inspect
    plugin install
    plugin ls
    plugin rm
    portdocker-machine ip
    ps
    pull
    push
    rename
    restart
    rm
    rmi
    run
    save
    search
    service create
    service inspect
    service ls
    service ps
    service rm
    service scale
    service update
    stack config
    stack deploy
    stack rm
    stack services
    stack tasks
    start
    stats
    stop
    swarm init
    swarm join
    swarm join-token
    swarm leave
    swarm update
    tag
    top
    unpause
    update
    version
    volume create
    volume inspect
    volume ls
    volume rm
    wait


##### HealthCheck

```
docker run --name=test -d \
    --health-cmd='stat /etc/passwd || exit 1' \
    --health-interval=2s \
    busybox sleep 1d
```

`sleep 2; docker inspect --format='{{.State.Health.Status}}' test`


##### Additional 

    CMD (Default Command or Options)
    ENTRYPOINT (Default Command to Execute at Runtime)
    EXPOSE (Incoming Ports)
    ENV (Environment Variables)
    HEALTHCHECK
    VOLUME (Shared Filesystems)
    USER
    WORKDIR


###### Additional 


`docker run -it --entrypoint /bin/bash alpine -c ls -l`