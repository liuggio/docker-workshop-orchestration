FROM alpine

WORKDIR /app

COPY app /app

RUN apk add --update bash curl figlet --no-cache --update-cache && \
    rm -rf /var/cache/apk/* && \
    chmod +x /app/server.sh

EXPOSE 80

CMD ["nc", "-lvkp", "80", "-e", "/app/server.sh"]