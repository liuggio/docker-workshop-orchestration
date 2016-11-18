3 - Let's create and use your image
-----------------------------------

```
FROM alpine

ARG PORT
ENV PORT ${PORT:-8080}
EXPOSE $PORT
WORKDIR /

RUN echo 'echo "listening at $PORT";while true;do echo -e "HTTP/1.1 200 OK\n\n "$(date) | nc -l -p $PORT;done' > /bin.sh \
     && chmod +x /bin.sh

ENTRYPOINT ["/bin/sh"]
CMD ["/bin.sh"]
```

```
export p=1500
docker build --build-arg PORT=$p . -t daemon/daemon
docker run -p $p:$p  daemon/daemon
```
