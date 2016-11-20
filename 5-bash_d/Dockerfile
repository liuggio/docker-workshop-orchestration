FROM alpine

WORKDIR /app

COPY app /app

RUN apk add --update bash curl figlet --no-cache --update-cache && \
    rm -rf /var/cache/apk/* && \
    chmod +x /app/server.sh

EXPOSE 8080

CMD ["nc", "-lvkp", "8080", "-e", "/app/server.sh"]