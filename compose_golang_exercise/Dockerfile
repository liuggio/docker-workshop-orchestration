FROM gliderlabs/alpine:3.3

WORKDIR /app

COPY app /app

RUN chmod +x /app/server.sh && \
    apk-install bash figlet --no-cache --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/main/

EXPOSE 8080

CMD ["nc", "-lvkp", "8080", "-e", "/app/server.sh"]