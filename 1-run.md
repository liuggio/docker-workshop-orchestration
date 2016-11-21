Cap. 1 - Let's run the box
-------------------------

#### Run a echo

`docker run  alpine echo hello world`

Template of docker run:

`docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]`

#### Background and foreground:


#### Interactive

`docker run -i -t alpine sh`

We used:
 
```
  -t, --tty          Allocate a pseudo-TTY
  -i, --interactive  Keep STDIN open even if not attached
```

Now we can execute inside the container few commands:

```
pwd
ip a
ls /home
ls /dev/*
cat /etc/hostname
cat /etc/hosts    # ha messo se stesso negli host
```

#### Pipe it 

`echo test | docker run -i alpine cat`

#### More

`docker ps`

`docker ps -a`

```
CONTAINER ID        IMAGE        NAME            COMMAND      CREATED STATUS 
c12c347e3eec        alpine         sad_shirley   "sh"             4 minutes ago       Exited (0)
```

#### Name it

Docker run:

`docker run --name one -h uno -i -t alpine sh`

```
cat /etc/hostname
cat /etc/hosts
```

Get the last:

`docker ps -l`

```
   -l get the last container 
```

https://github.com/docker/docker/blob/master/pkg/namesgenerator/names-generator.go 

`docker logs uno`

`docker run --name=uno alpine /bin/echo 'Hello world'`

`docker run --rm --name=due alpine /bin/echo 'Hello world'`

##### Restart on failure 


`docker run -d --restart=on-failure  alpine sh -c "echo a; exit 255"`

`docker events`

the results will be

```
2016-11-13T17:25:40.995519567+01:00 container start 2d5b07d68518126b7bb8b86ea094976d9dd5f277a881e80b3e0fa84581d0cf40 (image=alpine, name=cocky_kirch)
2016-11-13T17:25:40.997240649+01:00 container die 2d5b07d68518126b7bb8b86ea094976d9dd5f277a881e80b3e0fa84581d0cf40 (exitCode=1, image=alpine, name=cocky_kirch)
2016-11-13T17:26:00.886802796+01:00 container start 0d78cfdca8864819720fefec3bd9b77b0030588647ca4259259074118aad1b7c (image=alpine, name=grave_hamilton)
2016-11-13T17:26:00.914888591+01:00 container die 0d78cfdca8864819720fefec3bd9b77b0030588647ca4259259074118aad1b7c (exitCode=255, image=alpine, name=grave_hamilton)
```

`docker run --restart=on-failure:10 redis`

`docker run  --restart=always  -it alpine sh -c "exit 1"`

##### Modify the hosts

`docker run -it --add-host db-static:86.75.30.9 ubuntu cat /etc/hosts`


##### Security

More at https://github.com/riyazdf/dockercon-workshop/ 

`docker run  -m 4M --memory-swap 4M alpine sh -c "bomb() { bomb | bomb; }; bomb"`

Dangerous: 

`docker run --oom-kill-disable -m 4M --memory-swap 4M alpine sh -c "bomb() { bomb | bomb; }; bomb"`

### Excercise

#### n.1a Run it!
run: 

`while true;do echo -e "HTTP/1.1 200 OK\n\n "$(date) | nc -l -p 1500;done`

Into an alpine container with 4M of Ram 


#### n.1b Test it!

Test that the server is serving http container1-run.md