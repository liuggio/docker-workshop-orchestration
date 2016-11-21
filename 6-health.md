Cap. 6 - Healthcheck and Readycheck
---------------------------------

## HealthCheck

```
docker run --name=test -d \
    --health-cmd='stat /etc/passwd || exit 1' \
    --health-interval=2s \
    busybox sleep 1d
```

`sleep 2; docker inspect --format='{{.State.Health.Status}}' test`

### Exercise 6.a

Create the health-check for our bash daemon.

### ReadyCheck

The bad way: https://docs.docker.com/compose/startup-order/

Create a script that emulate the bash daemon readiness.