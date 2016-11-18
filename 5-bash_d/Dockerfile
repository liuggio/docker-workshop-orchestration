FROM alpine

WORKDIR /app

COPY app /app

RUN chmod +x /app/server.sh && \
    apk add --update bash figlet --no-cache --update-cache && \
     rm -rf /var/cache/apk/*

EXPOSE 8080

CMD ["nc", "-lvkp", "8080", "-e", "/app/server.sh"]