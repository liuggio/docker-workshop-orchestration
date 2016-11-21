Cap. 2 - Let's build a daemon
------------------------

Little bashism

    docker logs `docker ps -a -l -q`

A simple daemon

    echo start;sleep 5;echo dead

Using the -d option
    
    docker run  -d alpine /bin/sh -c 'echo start;sleep 5;echo dead'

Docker events

    docker events

Looping

    while true; do date; sleep 1; done

Inside a  docker

    docker run -d alpine /bin/sh -c "while true; do date; sleep 1; done"
   
Following the logs
   
    docker logs -f  `docker ps -a -l -q`

Last

    docker attach $LAST

## build a real http daemon

http://asciinema.org/a/bdu4cnsjcxi4232iu172y3ih7 

    echo -e "HTTP/1.1 200 OK\n\n"$(date) | nc -l -p 1500 -q 0

listening to the 1500 port

    nc localhost 1500

    -q is ubuntu only :)

Run into a container:

    docker run  -d alpine /bin/sh -c 'while true;do echo -e "HTTP/1.1 200 OK\n\n "$(date) | nc -l -p 1500;done'

try to reach it

    curl localhost:1500

and impossible to reach 1500 :(

### EXERCISE 2.a Try to reach port 1500

### EXERCISE 2.b basic server   10 min

Pull down this Docker image from the Docker Hub: atbaker/nginx-example

This Docker image uses the Nginx webserver to serve a static HTML website.

Start a new container from the atbaker/nginx-example image that exposes port 80 from the container to port 8000 on your host.

Open a web browser and go to http://localhost:8000


### EXERCISE 2.c basic server 10 min 

Use the image of the above exercise `atbaker/nginx-example`
and modify `/usr/share/nginx/html/index.html` in order to have:
with  

![https://screencloud.net/v/qQfP](https://sc-cdn.scaleengine.net/i/f4a24d078be54fd72b18daf70e0edbed1.png)

###EXERCISE 2.d (cleanup) 10 min

You have to cleanup your local images and old containers regulary.
Write a single line command to delete all container exited