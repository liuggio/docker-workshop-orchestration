3 - Let's create and use your image
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

### Docker build

    docker build . -t tagname
    docker images
    docker run -d tagname
    docker exec -it tagname /bin/sh
    docker commit ...

### EXERCISE 5 create your dockerfile

https://gist.github.com/liuggio/b023328e375759c47cae#file-5_dockerfile_bash_http_server-md