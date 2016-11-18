2 - Let's build a daemon
------------------------

    docker run -p 1500:1500 -d alpine /bin/sh -c 'while true;do echo -e "HTTP/1.1 200 OK\n\n "$(date) | nc -l -p 1500;done'

then

    curl localhost:1500
    Thu Nov 17 23:02:48 UTC 2016