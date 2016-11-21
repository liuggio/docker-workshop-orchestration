Cap. 4 - Let's create and use your image
-----------------------------------

    docker images

### Your image:

    docker run --name ngixmodified nginx  /bin/bash -c "echo data > /usr/share/nginx/a_$(date +"%m_%d_%Y").log;"
    
    docker diff nginxmodified
    
    docker images
    docker commit -m "added serve function" nginxmodified mystupidnginx:v1
    docker images
    docker commit --change='CMD ["bash", "-c","echo ciao"]' nginxmodified mystupidnginx:1.1
    
    docker run mystupidnginx:v1

### Commit

    docker run -it ubuntu bash
    docker commit -m ..  

You can tag it and run 
   
    docker tag 5db5f8471261 vendor/name:tagname
   
Pushing the image to docker hub

    docker push vendor/name:tagname
    
#### Excercise 4.a
    
Install `figlet` into alpine
and create your image.
    
   
### Dockerfile

https://github.com/nginxinc/docker-nginx/blob/master/stable/jessie/Dockerfile

    FROM debian:jessie
    
    MAINTAINER NGINX Docker Maintainers "docker-maint@nginx.com"
    
    ENV NGINX_VERSION 1.10.2-1~jessie
    
    RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
    	&& echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
    	&& apt-get update \
    	&& apt-get install --no-install-recommends --no-install-suggests -y \
    						ca-certificates \
    						nginx=${NGINX_VERSION} \
    						nginx-module-xslt \
    						nginx-module-geoip \
    						nginx-module-image-filter \
    						nginx-module-perl \
    						nginx-module-njs \
    						gettext-base \
    	&& rm -rf /var/lib/apt/lists/*
    
    # forward request and error logs to docker log collector
    RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    	&& ln -sf /dev/stderr /var/log/nginx/error.log
    
    EXPOSE 80 443
    
    CMD ["nginx", "-g", "daemon off;"]

### layers

Each Run and each From is a layer 

### Docker build

    docker build . -t tagname
    docker images
    docker run -d tagname
    docker exec -it tagname /bin/sh
    docker commit ...

### EXERCISE 4.b create your Dockerfile

The goal is to write your `Dockerfile`, build it with a tag name,
and run exposing the 8080 port.

Test it with the following script:

``` sh
#!/usr/bin/env sh

docker build  -t test-bashd . || exit 1
pid=$(docker run -d -p 8080:8080 test-bashd)
wget -O /tmp/index.html localhost:8080 || exit 2

docker logs $pid
docker rm -f $pid;

echo "\n\n\n--------------------\nBuild ok!"
exit 0;
```

### EXERCISE 4.c Add figlet to your image

Add figlet and push to docker hub

### EXERCISE 4.d Push it to docker hub :)