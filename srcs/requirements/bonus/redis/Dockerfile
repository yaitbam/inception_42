FROM alpine:3.14

RUN	apk update && apk upgrade && apk add --no-cache \
    redis

COPY ./tools/ /tmp/tools

RUN	 chmod -R +x /tmp/tools

ENTRYPOINT ["sh", "/tmp/tools/setup.sh"]