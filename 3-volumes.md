Cap. 3 - Volumes
----------------

Locating a volume
You can locate the volume on the host by utilizing the docker inspect command.

    docker inspect web

   docker volume
   docker volume inspect f4dda3de785943131dae4bb4cb6de02f41df99211008230dbd9fd449c55b7f45

Mount a host directory as a data volume
In addition to creating a volume using the -v flag you can also mount a directory from your Docker engine’s host into a container.

    docker run -d -P --name web -v /src/webapp:/webapp training/webapp python app.py

Read-only

    docker run -d -P --name web -v /src/webapp:/webapp:ro training/webapp python app.py

named volumes:

    docker volume create -d flocker -o size=20GB my-named-volume
    
    docker run -d -P \
      -v my-named-volume:/webapp \
      --name web training/webapp python app.py

https://docs.docker.com/engine/tutorials/dockervolumes/

https://screencloud.net/v/oi0R

https://docs.docker.com/compose/compose-file/#/volumes-volumedriver


### Exercise 3.a

Remember the exercise 2.a?

Use the image of the above exercise `atbaker/nginx-example`
and modify `/usr/share/nginx/html/index.html` in order to have:
with  

![https://screencloud.net/v/qQfP](https://sc-cdn.scaleengine.net/i/f4a24d078be54fd72b18daf70e0edbed1.png)

Reach the same goal with the following volumes types:

  1. Just specify a path and let the Engine create a volume
     then modify the volume
     - /var/lib/mysql

  2. Specify an absolute path mapping
     - /opt/data:/var/lib/mysql

  3. User-relative path
     - ~/configs:/etc/configs/:ro

  4. Named volume
     - datavolume:/var/lib/mysql
     
  5. mount volumes from another container
     -  –volumes-from
    
### Exercise 3.b Backup a volume!
 
Use the exercise 4a to backup the volume to a host folder.
     
ref:
https://docs.docker.com/engine/tutorials/dockervolumes/


