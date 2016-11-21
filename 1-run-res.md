Cap 1. Let's run the box
-------------------------

1.a

    docker run alpine sh -c "while true;do echo -e 'HTTP/1.1 200 OK\n\n '$(date) | nc -l -p 1500;done"