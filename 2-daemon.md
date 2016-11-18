2 - Let's build a daemon
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

Guess why?


### EXERCISE 1 basic server   10 min

https://gist.github.com/liuggio/b023328e375759c47cae#file-1_exercise_basic-server-md  

### EXERCISE 2 basic server 10 min 

https://gist.github.com/liuggio/b023328e375759c47cae#file-2_exercise_basic-server-md  

###EXERCISE 3 (cleanup) 10 min

https://gist.github.com/liuggio/b023328e375759c47cae#file-3_exercise_cleanup-md 